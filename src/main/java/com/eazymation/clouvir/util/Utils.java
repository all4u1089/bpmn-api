package com.eazymation.clouvir.util;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.text.DecimalFormat;
import java.text.Normalizer;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.webmvc.PersistentEntityResourceAssembler;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;

import com.eazymation.Application;
import com.eazymation.clouvir.enums.ApiErrorEnum;
import com.eazymation.clouvir.enums.ContractStatusEnum;
import com.eazymation.clouvir.enums.DaysOfWeekEnum;
import com.eazymation.clouvir.enums.FileTypeEnum;
import com.eazymation.clouvir.enums.ObjectTypeEnum;
import com.eazymation.clouvir.enums.PowerEnum;
import com.eazymation.clouvir.model.InvalidToken;
import com.eazymation.clouvir.model.Model;
import com.eazymation.clouvir.model.QInvalidToken;
import com.eazymation.clouvir.model.User;

public class Utils {
	
	public static ResponseEntity<Object> responseErrors(HttpStatus httpStatus, String code, String detail,
			String description) {
		List<Map<String, Object>> errors = new ArrayList<>();
		Map<String, Object> error = new HashMap<>();
		error.put("status", Long.valueOf(httpStatus.toString()));
		error.put("code", code);
		error.put("detail", detail);
		error.put("description", description);
		errors.add(error);
		Map<String, List<Map<String, Object>>> errorBody = new HashMap<>();
		errorBody.put("errors", errors);
		return new ResponseEntity<>(errorBody, httpStatus);
	}
	
	public static ResponseEntity<Object> responseError(HttpStatus httpStatus, String code, String detail,
			String description) {
		Map<String, Object> error = new HashMap<>();
		error.put("status", Long.valueOf(httpStatus.toString()));
		error.put("code", code);
		error.put("detail", detail);
		error.put("description", description);
		return new ResponseEntity<>(error, httpStatus);
	}

	public static ResponseEntity<Object> responseInfos(HttpStatus httpStatus, String code, String detail,
			String description) {
		List<Map<String, Object>> infos = new ArrayList<>();
		Map<String, Object> info = new HashMap<>();
		info.put("status", Long.valueOf(httpStatus.toString()));
		info.put("code", code);
		info.put("detail", detail);
		info.put("description", description);
		infos.add(info);
		Map<String, List<Map<String, Object>>> infoBody = new HashMap<>();
		infoBody.put("infos", infos);
		return new ResponseEntity<>(infoBody, httpStatus);
	}
	
	public static ResponseEntity<Object> responseInternalServerErrors(Exception e) {
		e.printStackTrace();
		if (e instanceof ConstraintViolationException)
			return returnError((ConstraintViolationException) e);
		if (e.getCause() instanceof ConstraintViolationException)
			return returnError((ConstraintViolationException) e.getCause());
		if (e.getCause() != null && e.getCause().getCause() instanceof ConstraintViolationException)
			return returnError((ConstraintViolationException) e.getCause().getCause());
		if (e.getCause() != null && e.getCause().getCause() != null
				&& e.getCause().getCause().getCause() instanceof ConstraintViolationException)
			return returnError((ConstraintViolationException) e.getCause().getCause().getCause());
		
		
		return Utils.responseErrors(HttpStatus.INTERNAL_SERVER_ERROR, ApiErrorEnum.INTERNAL_SERVER_ERROR.name(),
				ApiErrorEnum.INTERNAL_SERVER_ERROR.getText(), e.getMessage());
	}

	public static ResponseEntity<Object> returnError(ConstraintViolationException e) {
		ConstraintViolation<?> vio = e.getConstraintViolations().iterator().next();
		System.out.println("returnError -> " + vio);
		if (vio.getMessageTemplate().equals("{" + NotBlank.class.getName() + ".message}"))
			return Utils.responseErrors(HttpStatus.BAD_REQUEST,
					vio.getPropertyPath().toString().toUpperCase() + "_REQUIRED", "Bạn không được bỏ trống trường này.",
					"Trường " + vio.getPropertyPath().toString().toUpperCase() + " không được để trống.");
		if (vio.getMessageTemplate().equals("{" + NotNull.class.getName() + ".message}"))
			return Utils.responseErrors(HttpStatus.BAD_REQUEST,
					vio.getPropertyPath().toString().toUpperCase() + "_NOT_NULL", "Bạn không được bỏ trống trường này.",
					"Trường " + vio.getPropertyPath().toString().toUpperCase() + " không được NULL.");
		if (vio.getMessageTemplate().equals("{" + Size.class.getName() + ".message}"))
			return Utils.responseErrors(HttpStatus.BAD_REQUEST,
					vio.getPropertyPath().toString().toUpperCase() + "_INVALID_SIZE",
					"Trường này đã nhập quá kí tự cho phép.",
					"Trường " + vio.getPropertyPath().toString().toUpperCase() + " đã nhập quá kí tự cho phép.");
		return Utils.responseErrors(HttpStatus.BAD_REQUEST, "UNKNOWN", "UNKNOWN", "UNKNOWN");
	}

	@SuppressWarnings("rawtypes")
	public static <T extends Model> ResponseEntity<Object> doSave(JpaRepository<T, Long> repository, T obj,
			Long userId, PersistentEntityResourceAssembler eass, HttpStatus status) {
		try {
			obj = save(repository, obj, userId);
		} catch (ConstraintViolationException e) {
			return returnError(e);
		} catch (Exception e) {
			System.out.println("doSave -> " + e.getCause());
			if (e.getCause() instanceof ConstraintViolationException)
				return returnError((ConstraintViolationException) e.getCause());
			if (e.getCause() != null && e.getCause().getCause() instanceof ConstraintViolationException)
				return returnError((ConstraintViolationException) e.getCause().getCause());
			if (e.getCause() != null && e.getCause().getCause() != null
					&& e.getCause().getCause().getCause() instanceof ConstraintViolationException)
				return returnError((ConstraintViolationException) e.getCause().getCause().getCause());
			throw e;
		}
		return new ResponseEntity<>(eass.toFullResource(obj), status);
	}

	@SuppressWarnings("rawtypes")
	@Transactional(readOnly=false)
	public static <T extends Model> T save(JpaRepository<T, Long> repository, T obj, Long userId) {
		User cc = new User();
		cc.setId(userId);
		if (!obj.isNew()) {
			T o = repository.findOne(obj.getId());
			obj.setCreatedDate(o.getCreatedDate());
			obj.setUpdatedDate(Utils.localDateTimeNow());
			obj.setCreatedPersonId(o.getCreatedPersonId());
			obj.setUpdatedPersonId(cc.getId());
		} else {
			obj.setCreatedPersonId(cc.getId());
			obj.setUpdatedPersonId(obj.getCreatedPersonId());
		}
		obj = repository.save(obj);
		return obj;
	}

	public static boolean isValidEmailAddress(String email) {
		String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(email);
		return m.matches();
	}
	
	public static boolean isValidUrl(String url) {
		return ResourceUtils.isUrl(url);
	}

	public static LocalDateTime fixDateFrom(String dateFromCurrent) {
		ZonedDateTime zdt = ZonedDateTime.parse(dateFromCurrent);
		LocalDateTime dateFrom = zdt.toLocalDateTime();
		//dateFrom = LocalDateTime.of(LocalDate.of(dateFrom.getYear(), dateFrom.getMonth(), dateFrom.getDayOfMonth()),LocalTime.MIN);
		return dateFrom;
	}
	
	public static LocalDateTime fixDateTo(String dateToCurrent) {
		ZonedDateTime zdt = ZonedDateTime.parse(dateToCurrent);
		LocalDateTime dateTo = zdt.toLocalDateTime();
		dateTo = dateTo.plusDays(1).minusSeconds(1);
		//dateTo = LocalDateTime.of(LocalDate.of(dateTo.getYear(), dateTo.getMonth(), dateTo.getDayOfMonth()),LocalTime.MAX);
		return dateTo;
	}

	@SuppressWarnings("deprecation")
	public static User powerValidate(ProfileUtils profileUtil, String authorization, PowerEnum power) {
		User user = profileUtil.getUserInfo(authorization);
		if (user != null && user.checkPower(power) && user.isActive()) {
			return user;
		}
		return null;
	}
	
	public static Map<String, Object> invalidToken(ProfileUtils profileUtil, String authorization) {
		Map<String, Object> map = null;
		if (authorization != null && authorization.startsWith("Bearer")) {
			String tk = StringUtils.substringAfter(authorization, " ");
			Application app = Application.app;
			User nd = profileUtil.get(authorization).getUserInfo();
			InvalidToken token = app.getInvalidTokenService().findOne(QInvalidToken.invalidToken.token.eq(tk));
			if (token != null) {
				map = new HashMap<String, Object>();
				if (token.isActive()) {
					if (nd != null) {
						map.put("status", "OK");
						map.put("value", nd);
					} else {
						map.put("status", "ERROR");
						map.put("value", Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.USER_NOT_ACTIVE.name(),
								ApiErrorEnum.USER_NOT_ACTIVE.getText(), ApiErrorEnum.USER_NOT_ACTIVE.getText()));
					}
				} else {
					map.put("status", "ERROR");
					map.put("value", Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
							token.getTokenStatus().getText(), token.getTokenStatus().getText()));
				}
			} else if (nd != null) {
				token = app.getInvalidTokenService().findOne(QInvalidToken.invalidToken.user.id.eq(nd.getId()));
				if (token != null) {
					map = new HashMap<String, Object>();
					map.put("status", "ERROR");
					map.put("value", Utils.responseErrors(HttpStatus.UNAUTHORIZED, ApiErrorEnum.TOKEN_TIME_EXPIRED.name(),
							token.getTokenStatus().getText(), token.getTokenStatus().getText()));
				}
			}
		}
		return map;
	}	
	
	public static User powerValidate(User user, PowerEnum power) {
		if (user != null && user.checkPower(power) && user.isActive()) {
			return user;
		}
		return null;
	}
	
	@SuppressWarnings("deprecation")
	public static User tokenValidate(ProfileUtils profileUtil, String authorization) {
		User user = profileUtil.getUserInfo(authorization);
		if (user != null && user.isActive()) {
			return user;
		}
		return null;
	}

	public static LocalDateTime localDateTimeNow() {
		Instant instant = Instant.now();
		ZoneId zoneId_Asia = ZoneId.of("UTC");
		ZonedDateTime zdt_Asia = ZonedDateTime.ofInstant(instant , zoneId_Asia);
		return zdt_Asia.toLocalDateTime();
		//return LocalDateTime.now();
	}

	public static String unAccent(String s) {
		if (s != null && !"".equals(s)) {
			String temp = Normalizer.normalize(s.toLowerCase(), Normalizer.Form.NFD);
			Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
			String result = pattern.matcher(temp).replaceAll("").replaceAll("đ", "d").replaceAll("[^a-zA-Z0-9 -]", "");
			return result.replace(" +", " ");
		}
		return "";
	}	
	
	@SuppressWarnings("unchecked")
	@Transactional
	public static List<Map<String, Object>> getDocumentFilesByObjectId(ObjectTypeEnum objectType, FileTypeEnum fileType, Long objectId) {
		List<Map<String, Object>> list = new ArrayList<>();
		EntityManager em = Application.app.getEntityManager();
		String query = "SELECT df.id AS fileId, df.fileName, df.fileUrl, df.fileSize"
					+ " FROM documentfile AS df"
					+ " WHERE df.deleted = 0 AND df.objectType = '" + objectType + "'"
							+ " AND df.fileType = '" + fileType +"' AND df.objectId = " + objectId;
		List<Object[]> listObj = (List<Object[]>) em.createNativeQuery(query).getResultList();
		if (listObj != null) {
			for (Object[] obj : listObj) {
				Map<String, Object> file = new HashMap<>();
				file.put("id", obj[0]);
				file.put("fileName", obj[1]);
				file.put("fileUrl", obj[2]);
				file.put("fileSize", getFileSizeStr(Float.parseFloat(obj[3].toString())));
				list.add(file);
			}
		}
		return list;
	}
	
	@Transactional
	public static Map<String, Object> getSecurityPledgeFile(ObjectTypeEnum objectType, Long objectId, Long contractId) {
		EntityManager em = Application.app.getEntityManager();
		String query = "SELECT df.id AS fileId, df.fileName, df.fileUrl, df.fileSize"
					+ " FROM documentfile AS df"
					+ " WHERE df.deleted = 0 AND df.objectType = '" + objectType + "'"
							+ " AND df.fileType = '" + FileTypeEnum.SECURITY_PLEDGE.toString() +"' AND df.objectId = " + objectId + " AND df.contract_id = " + contractId;
		Object[] obj = null;
		try {
			obj = (Object[]) em.createNativeQuery(query).getSingleResult();
		} catch (NoResultException e) {
			
		}
		Map<String, Object> file = new HashMap<>();
		if (obj != null) {
			file.put("id", obj[0]);
			file.put("fileName", obj[1]);
			file.put("fileUrl", obj[2]);
			file.put("fileSize", getFileSizeStr(Float.parseFloat(obj[3].toString())));
		}
		return file;
	}
	
	@Transactional
	public static Map<String, Object> getSecurityPledgeFileAfter(ObjectTypeEnum objectType, Long objectId, Long contractId) {
		EntityManager em = Application.app.getEntityManager();
		String query = "SELECT df.id AS fileId, df.fileName, df.fileUrl, df.fileSize"
					+ " FROM documentfile AS df"
					+ " WHERE df.deleted = 0 AND df.objectType = '" + objectType + "'"
							+ " AND df.fileType = '" + FileTypeEnum.SECURITY_PLEDGE_AFTER.toString() +"' AND df.objectId = " + objectId + " AND df.contract_id = " + contractId;
		Object[] obj = null;
		try {
			obj = (Object[]) em.createNativeQuery(query).getSingleResult();
		} catch (NoResultException e) {
			
		}
		Map<String, Object> file = new HashMap<>();
		if (obj != null) {
			file.put("id", obj[0]);
			file.put("fileName", obj[1]);
			file.put("fileUrl", obj[2]);
			file.put("fileSize", getFileSizeStr(Float.parseFloat(obj[3].toString())));
		}
		return file;
	}
	
	@Transactional
	public static Map<String, Object> getDocumentFileByObjectId(ObjectTypeEnum objectType, FileTypeEnum fileType, Long objectId) {
		EntityManager em = Application.app.getEntityManager();
		String query = "SELECT df.id AS fileId, df.fileName, df.fileUrl, df.fileSize"
					+ " FROM documentfile AS df"
					+ " WHERE df.deleted = 0 AND df.objectType = '" + objectType + "'"
							+ " AND df.fileType = '" + fileType +"' AND df.objectId = " + objectId
					+ " LIMIT 1";
		Object[] obj = null;
		try {
			obj = (Object[]) em.createNativeQuery(query).getSingleResult();
		} catch (NoResultException e) {
			
		}
		Map<String, Object> file = new HashMap<>();
		if (obj != null) {
			file.put("id", obj[0]);
			file.put("fileName", obj[1]);
			file.put("fileUrl", obj[2]);
			file.put("fileSize", getFileSizeStr(Float.parseFloat(obj[3].toString())));
		}		
		return file;
	}
	
	public static Map<String, Object> getContractStatusByDate(LocalDateTime start, LocalDateTime end) {
		LocalDateTime now = localDateTimeNow();
		Map<String, Object> map = new HashMap<>();
		if (start == null || end == null) {
			return map;
		}
		if (now.isBefore(end) && now.isAfter(start)) {
			map.put("value", ContractStatusEnum.UNDER_CONTRACT.toString());
			map.put("text", ContractStatusEnum.UNDER_CONTRACT.getText());
		} else if (now.isBefore(start)) {
			map.put("value", ContractStatusEnum.BEFORE_CONTRACT.toString());
			map.put("text", ContractStatusEnum.BEFORE_CONTRACT.getText());
		} else {
			map.put("value", ContractStatusEnum.END.toString());
			map.put("text", ContractStatusEnum.END.getText());
		}
		return map;
	}
	
	public static String getFileSizeStr(float fileSize) {
	    if(fileSize <= 0) return "0";
	    final String[] units = new String[] { "B", "kB", "MB", "GB", "TB" };
	    int digitGroups = (int) (Math.log10(fileSize)/Math.log10(1024));
	    return new DecimalFormat("#,##0.#").format(fileSize/Math.pow(1024, digitGroups)) + " " + units[digitGroups];
	}
	
	public static String getDayOfWeekStr(int dayOfWeek) {
		String str = "";
		switch (dayOfWeek) {			
			case 1:
				str = DaysOfWeekEnum.MONDAY.toString();
				break;
			case 2:
				str = DaysOfWeekEnum.TUESDAY.toString();
				break;
			case 3:
				str = DaysOfWeekEnum.WEDNESDAY.toString();
				break;
			case 4:
				str = DaysOfWeekEnum.THURSDAY.toString();
				break;
			case 5:
				str = DaysOfWeekEnum.FRIDAY.toString();
				break;
			case 6:
				str = DaysOfWeekEnum.SATURDAY.toString();
				break;
			case 7:
				str = DaysOfWeekEnum.SUNDAY.toString();
				break;	
		}
		return str;
	}
	
	public static String getBaseUrl(HttpServletRequest request) {
		String scheme = request.getScheme() + "://";
		String serverName = request.getServerName();
		String serverPort = (request.getServerPort() == 80) ? "" : ":" + request.getServerPort();
		String contextPath = request.getContextPath();
		return scheme + serverName + serverPort + contextPath;
	}
	
	private static final char DEFAULT_SEPARATOR = ',';
    private static final char DEFAULT_QUOTE = '"';
	
	public static List<String> parseLine(String cvsLine) {
        return parseLine(cvsLine, DEFAULT_SEPARATOR, DEFAULT_QUOTE);
    }

    public static List<String> parseLine(String cvsLine, char separators) {
        return parseLine(cvsLine, separators, DEFAULT_QUOTE);
    }

    @SuppressWarnings("null")
	public static List<String> parseLine(String cvsLine, char separators, char customQuote) {

        List<String> result = new ArrayList<>();

        //if empty, return!
        if (cvsLine == null && cvsLine.isEmpty()) {
            return result;
        }

        if (customQuote == ' ') {
            customQuote = DEFAULT_QUOTE;
        }

        if (separators == ' ') {
            separators = DEFAULT_SEPARATOR;
        }

        StringBuffer curVal = new StringBuffer();
        boolean inQuotes = false;
        boolean startCollectChar = false;
        boolean doubleQuotesInColumn = false;

        char[] chars = cvsLine.toCharArray();

        for (char ch : chars) {

            if (inQuotes) {
                startCollectChar = true;
                if (ch == customQuote) {
                    inQuotes = false;
                    doubleQuotesInColumn = false;
                } else {

                    //Fixed : allow "" in custom quote enclosed
                    if (ch == '\"') {
                        if (!doubleQuotesInColumn) {
                            curVal.append(ch);
                            doubleQuotesInColumn = true;
                        }
                    } else {
                        curVal.append(ch);
                    }

                }
            } else {
                if (ch == customQuote) {

                    inQuotes = true;

                    //Fixed : allow "" in empty quote enclosed
                    if (chars[0] != '"' && customQuote == '\"') {
                        curVal.append('"');
                    }

                    //double quotes in column will hit this!
                    if (startCollectChar) {
                        curVal.append('"');
                    }

                } else if (ch == separators) {

                    result.add(curVal.toString());

                    curVal = new StringBuffer();
                    startCollectChar = false;

                } else if (ch == '\r') {
                    //ignore LF characters
                    continue;
                } else if (ch == '\n') {
                    //the end, break!
                    break;
                } else {
                    curVal.append(ch);
                }
            }

        }

        result.add(curVal.toString());

        return result;
    }
}