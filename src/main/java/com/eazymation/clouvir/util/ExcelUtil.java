package com.eazymation.clouvir.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.util.FileCopyUtils;

import com.eazymation.clouvir.enums.BusinessScopeEnum;
import com.eazymation.clouvir.enums.ContractStatusEnum;
import com.eazymation.clouvir.enums.CycleEnum;
import com.eazymation.clouvir.enums.EquipmentProgressEnum;
import com.eazymation.clouvir.enums.InspectionTimeEnum;
import com.eazymation.clouvir.enums.ProductProgressEnum;
import com.eazymation.clouvir.enums.ProgressStepEnum;
import com.eazymation.clouvir.enums.SecurityCheckProgressEnum;
import com.eazymation.clouvir.enums.SecurityEducationProgressEnum;
import com.eazymation.clouvir.enums.SecurityViolationLevelEnum;
import com.eazymation.clouvir.enums.SecurityViolationProgressEnum;
import com.eazymation.clouvir.enums.TargetRoleEnum;



public class ExcelUtil {

	private static ExcelUtil instance;

	public static ExcelUtil getInStance() {
		if (instance == null) {
			instance = new ExcelUtil();
		}
		return instance;
	}

	public static String formatDouble(double number) {
		// #.###,##
		final DecimalFormatSymbols decimalFormatSymbols = new DecimalFormatSymbols();
		decimalFormatSymbols.setDecimalSeparator(',');
		decimalFormatSymbols.setGroupingSeparator('.');
		final DecimalFormat decimalFormat = new DecimalFormat("#.###", decimalFormatSymbols);
		return decimalFormat.format(number);
	}

	@SuppressWarnings({ "unused", "deprecation" })
	private static void setBorderMore(Workbook wb, Row row, Cell c, int begin, int end, int fontSize) {
		final CellStyle cellStyle = wb.createCellStyle();
		cellStyle.setWrapText(true);
		cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		cellStyle.setBorderLeft((short) 1);
		Font font = wb.createFont();
		font.setFontName("Times New Roman");

	}

	@SuppressWarnings("deprecation")
	public static CellStyle setBorderAndFont(final Workbook workbook, final int borderSize, final boolean isTitle,
			final int fontSize, final String fontColor, final String textAlign) {
		final CellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setWrapText(true);

		cellStyle.setBorderTop((short) borderSize); // single line border
		cellStyle.setBorderBottom((short) borderSize); // single line border
		cellStyle.setBorderLeft((short) borderSize); // single line border
		cellStyle.setBorderRight((short) borderSize); // single line border
		cellStyle.setAlignment(CellStyle.VERTICAL_CENTER);

		if (textAlign.equals("RIGHT")) {
			cellStyle.setAlignment(CellStyle.ALIGN_RIGHT);
		} else if (textAlign.equals("CENTER")) {
			cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
		} else if (textAlign.equals("LEFT")) {
			cellStyle.setAlignment(CellStyle.ALIGN_LEFT);
		}
		cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

		final Font font = workbook.createFont();
		font.setFontName("Times New Roman");
		if (isTitle) {

			font.setBoldweight(Font.BOLDWEIGHT_BOLD);

		}
		if (fontColor.equals("RED")) {
			font.setColor(Font.COLOR_RED);
		} else if (fontColor.equals("BLUE")) {
			font.setColor(HSSFColor.BLUE.index);
		} else if (fontColor.equals("ORANGE")) {
			font.setColor(HSSFColor.ORANGE.index);
		} else {

		}
		font.setFontHeightInPoints((short) fontSize);
		cellStyle.setFont(font);

		return cellStyle;
	}

	public static void createNoteRow(Workbook wb, Sheet sheet1, int idx) {
		Cell c;
		org.apache.poi.ss.usermodel.Row row;
		row = sheet1.createRow(idx);
		c = row.createCell(1);
		c.setCellValue("* Theo HCP");
		c.setCellStyle(setBorderAndFont(wb, 0, true, 11, "", "LEFT"));
	}		
	
	public static void exportExcelListUser(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm dd-MM-yyyy");
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy.MM.dd hh:mm:ss");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 17 * 256);
			sheet1.setColumnWidth(2, 30 * 256);
			sheet1.setColumnWidth(3, 20 * 256);
			sheet1.setColumnWidth(4, 12 * 256);
			sheet1.setColumnWidth(5, 11 * 256);
			sheet1.setColumnWidth(6, 17 * 256);
			sheet1.setColumnWidth(7, 13 * 256);
			sheet1.setColumnWidth(8, 13 * 256);
			sheet1.setColumnWidth(9, 12 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(1);
			c.setCellValue("이름");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(2);
			c.setCellValue("소속회사");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(3);
			c.setCellValue("부서");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("역할");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(5);
			c.setCellValue("등록일");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("최근로그인");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("내부 IP");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("외부 IP");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(9);
			c.setCellValue("보안위반 내역");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] employee : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);
				
				//Name
				c = row.createCell(1);
				c.setCellValue(employee[0].toString());
				c.setCellStyle(cellCenter);
				
				//Company
				String queryCompanyName = "SELECT companyName FROM company WHERE deleted = FALSE AND id = '" + employee[1] + "'";
				c = row.createCell(2);
				c.setCellValue((String)session.createNativeQuery(queryCompanyName).getSingleResult());
				c.setCellStyle(cellCenter);				
				
				//Department
				c = row.createCell(3);
				c.setCellValue(employee[2].toString());
				c.setCellStyle(cellCenter);				
				
				//Role
				String queryRoleName = "SELECT name FROM role WHERE deleted = FALSE AND id = '" + employee[3] + "'";
				c = row.createCell(4);
				c.setCellValue((String)session.createNativeQuery(queryRoleName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//Registration date
				c = row.createCell(5);
				c.setCellValue(((Timestamp) employee[4]).toLocalDateTime().format(formatter1));
				c.setCellStyle(cellCenter);
				
				//Recentsignin
				c = row.createCell(6); 
				c.setCellValue(employee[5] != null ? ((Timestamp) employee[5]).toLocalDateTime().format(formatter2) : "");
				c.setCellStyle(cellCenter);
				
				//Internal IP
				c = row.createCell(7);
				c.setCellValue(employee[6].toString());
				c.setCellStyle(cellCenter);
				
				//External IP
				c = row.createCell(8);
				c.setCellValue(employee[7].toString());
				c.setCellStyle(cellCenter);

				//Security violation history
				c = row.createCell(9);
				c.setCellValue(employee[8].toString().equals("0") ? "-" : employee[8].toString());
				c.setCellStyle(cellCenter);
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;

			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	public static void exportExcelListEmployer(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy.MM.dd hh:mm:ss");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 20 * 256);
			sheet1.setColumnWidth(2, 25 * 256);
			sheet1.setColumnWidth(3, 20 * 256);
			sheet1.setColumnWidth(4, 15 * 256);
			sheet1.setColumnWidth(5, 11 * 256);
			sheet1.setColumnWidth(6, 20 * 256);
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(1);
			c.setCellValue("이름");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(2);
			c.setCellValue("ID(Email)");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(3);
			c.setCellValue("부서");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("역할");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(5);
			c.setCellValue("등록일");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("최근로그인");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] employer : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);
				
				//Name
				c = row.createCell(1);
				c.setCellValue(employer[0].toString());
				c.setCellStyle(cellCenter);
				
				//ID (Email)
				c = row.createCell(2);
				c.setCellValue(employer[1].toString());
				c.setCellStyle(cellCenter);			
				
				//Department
				c = row.createCell(3);
				c.setCellValue(employer[2].toString());
				c.setCellStyle(cellCenter);				
				
				//Role
				String queryRoleName = "SELECT name FROM role WHERE deleted = FALSE AND id = '" + employer[3] + "'";
				c = row.createCell(4);
				c.setCellValue((String)session.createNativeQuery(queryRoleName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//Registration date
				c = row.createCell(5);
				c.setCellValue(((Timestamp) employer[4]).toLocalDateTime().format(formatter1));
				c.setCellStyle(cellCenter);
				
				//Recentsignin
				c = row.createCell(6); 
				c.setCellValue(employer[5] != null ? ((Timestamp) employer[5]).toLocalDateTime().format(formatter2) : "");
				c.setCellStyle(cellCenter);
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;

			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	public static void exportExcelListCompany(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 30 * 256);
			sheet1.setColumnWidth(2, 15 * 256);
			sheet1.setColumnWidth(3, 15 * 256);
			sheet1.setColumnWidth(4, 18 * 256);
			sheet1.setColumnWidth(5, 20 * 256);
			sheet1.setColumnWidth(6, 20 * 256);
			sheet1.setColumnWidth(7, 20 * 256);
			sheet1.setColumnWidth(8, 8 * 256);
			sheet1.setColumnWidth(9, 8 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(1);
			c.setCellValue("회사명");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(2);
			c.setCellValue("등록일 ");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(3);
			c.setCellValue("유효종료일");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("계약상태");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(5);
			c.setCellValue("대표이사");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("대표전화번호");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("팩스번호");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("참여사업");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(9);
			c.setCellValue("참여직원");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] company : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);
				
				//company name
				c = row.createCell(1);
				c.setCellValue(company[0].toString());
				c.setCellStyle(cellCenter);
				
				//Registration date 
				c = row.createCell(2);
				c.setCellValue(((Timestamp) company[1]).toLocalDateTime().format(formatter1));
				c.setCellStyle(cellCenter);;			
				
				//Effective end date
				c = row.createCell(3);
				c.setCellValue(company[2] != null ? ((Timestamp) company[2]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);
				
				//status contract
				String contractStatus = "";
				LocalDateTime dateNow = Utils.localDateTimeNow();
				String queryContractStatusInfo = "SELECT COUNT(*) FROM company AS company "
						+ " INNER JOIN contract AS con ON company.id = con.company_id"
						+ " WHERE con.deleted = false AND company.id = " + company[3] + " AND (con.startDate <='" + dateNow
						+ "' AND con.endDate >= '" + dateNow + "')";
				int count = ((BigInteger) session.createNativeQuery(queryContractStatusInfo).getSingleResult()).intValue();
				if (count > 0) {
					contractStatus = ContractStatusEnum.UNDER_CONTRACT.getText();
				} else {
					String queryContractStatusInfo1 = "SELECT COUNT(*) FROM company AS company "
							+ " INNER JOIN contract AS con ON company.id = con.company_id" + " WHERE company.id = " + company[3]
							+ " AND (con.startDate > '" + dateNow + "')";
					int count1 = ((BigInteger) session.createNativeQuery(queryContractStatusInfo1).getSingleResult()).intValue();
					if (count1 > 0) {
						contractStatus = ContractStatusEnum.BEFORE_CONTRACT.getText();
					} else {
						String queryContractStatusInfo2 = "SELECT COUNT(*) FROM company AS company "
								+ " INNER JOIN contract AS con ON company.id = con.company_id"
								+ " WHERE con.deleted = false AND company.id = " + company[3] + " AND (con.endDate < '" + dateNow
								+ "')";
						int count2 = ((BigInteger) session.createNativeQuery(queryContractStatusInfo2).getSingleResult()).intValue();
						if (count2 > 0) {
							contractStatus =  ContractStatusEnum.END.getText();
						} else {
							contractStatus = null;
						}

					}
				}
				c = row.createCell(4);
				c.setCellValue(contractStatus);
				c.setCellStyle(cellCenter);
				
				//CEO
				c = row.createCell(5);
				c.setCellValue(company[4].toString());
				c.setCellStyle(cellCenter);	
				
				//Representative phone number
				c = row.createCell(6); 
				c.setCellValue(company[5] != null ? company[5].toString() : "");
				c.setCellStyle(cellCenter);
				
				//Fax number
				c = row.createCell(7);
				c.setCellValue(company[6].toString());
				c.setCellStyle(cellCenter);
				
				//Participation business
				c = row.createCell(8);
				c.setCellValue(company[7].toString());
				c.setCellStyle(cellCenter);

				//Participating staff
				c = row.createCell(9);
				c.setCellValue(company[8].toString());
				c.setCellStyle(cellCenter);
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/vnd.ms-excel";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition", String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	@SuppressWarnings("unchecked")
	public static void exportExcelListProject(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 10));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 30 * 256);
			sheet1.setColumnWidth(2, 25 * 256);
			sheet1.setColumnWidth(3, 9 * 256);
			sheet1.setColumnWidth(4, 14 * 256);
			sheet1.setColumnWidth(5, 14 * 256);
			sheet1.setColumnWidth(6, 20 * 256);
			sheet1.setColumnWidth(7, 20 * 256);
			sheet1.setColumnWidth(8, 8 * 256);
			sheet1.setColumnWidth(9, 8 * 256);
			sheet1.setColumnWidth(10, 9 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(1);
			c.setCellValue("사업명");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(2);
			c.setCellValue("사업진행단계");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(3);
			c.setCellValue("진척율");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("시작일");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(5);
			c.setCellValue("종료일");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("사업관리자");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("수행관리자");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("참여회사");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(9);
			c.setCellValue("참여직원");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(10);
			c.setCellValue("보안서약서");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] project : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);			
				
				//project Name
				c = row.createCell(1);
				c.setCellValue(project[0].toString());
				c.setCellStyle(cellCenter);
				
				//Business progress stage
				ProgressStepEnum progressStage = ProgressStepEnum.valueOf(project[1].toString());
				c = row.createCell(2);
				c.setCellValue(progressStage.getText());
				c.setCellStyle(cellCenter);
				
				//Progress rate
				c = row.createCell(3);
				c.setCellValue(project[2].toString());
				c.setCellStyle(cellCenter);
				
				//start date 
				c = row.createCell(4);
				c.setCellValue(project[3] != null ? ((Timestamp) project[3]).toLocalDateTime().format(formatter1) : "");
				c.setCellStyle(cellCenter);			
				
				//End date 
				c = row.createCell(5);
				c.setCellValue(project[4] != null ? ((Timestamp) project[4]).toLocalDateTime().format(formatter1) : "");
				c.setCellStyle(cellCenter);
				
				//Business Manager
				String queryPAName = "SELECT u.fullName FROM user AS u"
						+ " INNER JOIN project_admin AS pa ON u.id = pa.user_id"
						+ " WHERE u.deleted = FALSE AND pa.project_id = " + project[5];
				List<String> listPANames = session.createNativeQuery(queryPAName).getResultList();
				String paName = "";
				if (listPANames != null) {
					for (String name : listPANames) {
						paName += ", " + name;
					}
				}				
				c = row.createCell(6);
				c.setCellValue(paName.replaceFirst(", ", ""));
				c.setCellStyle(cellCenter);	
				
				//Performer
				String queryPerformerName = "SELECT u.fullName FROM user AS u"
					+ " INNER JOIN worker_do_contract AS wdc ON wdc.user_id = u.id"
					+ " INNER JOIN contract AS c ON wdc.contract_id = c.id"
					+ " INNER JOIN role AS r ON r.id = u.role_id"
					+ " WHERE u.deleted = FALSE AND c.deleted = FALSE AND r.roleType = 'PROJECT_MANAGER'"
						+ " AND c.project_id = " + project[5];
				List<String> listPerformerNames = session.createNativeQuery(queryPerformerName).getResultList();
				String performer = "";
				if (listPerformerNames != null) {
					for (String name : listPerformerNames) {
						performer += ", " + name;
					}
				}	
				c = row.createCell(7); 
				c.setCellValue(performer.replaceFirst(", ", ""));
				c.setCellStyle(cellCenter);
				
				//Participating company 
				c = row.createCell(8);
				c.setCellValue(project[6].toString());
				c.setCellStyle(cellCenter);
				
				//Participating staff
				c = row.createCell(9);
				c.setCellValue(project[7].toString());
				c.setCellStyle(cellCenter);

				String querySecurityPledge = "SELECT COUNT(DISTINCT u.id) FROM user AS u"
					+ " INNER JOIN worker_do_contract as wc on wc.user_id = u.id"
					+ " INNER JOIN contract AS c ON c.id = wc.contract_id"
					+ " INNER JOIN documentfile AS df ON df.contract_id = c.id"
					+ " WHERE u.deleted = false AND c.project_id = " + project[5] + " AND df.objectId = u.id";
				Long count = ((BigInteger) session.createNativeQuery(querySecurityPledge).getSingleResult()).longValue();
				
				
				//Security pledge
				c = row.createCell(10);
				c.setCellValue(count + "/" + project[7].toString());
				c.setCellStyle(cellCenter);
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	@SuppressWarnings("unchecked")
	public static void exportExcelListSecurityEducation(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 30 * 256);
			sheet1.setColumnWidth(2, 25 * 256);
			sheet1.setColumnWidth(3, 35 * 256);
			sheet1.setColumnWidth(4, 14 * 256);
			sheet1.setColumnWidth(5, 14 * 256);
			sheet1.setColumnWidth(6, 23 * 256);
			sheet1.setColumnWidth(7, 11 * 256);
			sheet1.setColumnWidth(8, 11 * 256);
			sheet1.setColumnWidth(9, 11 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(1);
			c.setCellValue("제목");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(2);
			c.setCellValue("회사명");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(3);
			c.setCellValue("대상 직원");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("확인/승인자");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(5);
			c.setCellValue("주기");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("상태");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("이수요청");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("이수완료");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(9);
			c.setCellValue("확인/승인");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] securityEducation : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);			
				
				//title
				c = row.createCell(1);
				c.setCellValue(securityEducation[0].toString());
				c.setCellStyle(cellCenter);
				//Company Name
				String queryCompanyName = "SELECT companyName FROM company WHERE deleted = FALSE AND id = '" + securityEducation[1] + "'";

				c = row.createCell(2);
				c.setCellValue((String)session.createNativeQuery(queryCompanyName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//Target Employee
				String queryTargetEmployeeName = "SELECT DISTINCT u.fullName FROM user AS u"
						+ " INNER JOIN security_education_target AS seTarget ON seTarget.targets = u.id"
						+ " WHERE seTarget.securityEducation_id = " + securityEducation[2];
				String targetEmployeeName = "";
				List<String> listTargetEmployeeName = session.createNativeQuery(queryTargetEmployeeName).getResultList();
				for (String str : listTargetEmployeeName) {
					targetEmployeeName += ", " + str;
				}
				c = row.createCell(3);
				c.setCellValue(targetEmployeeName.replaceFirst(", ", ""));
				c.setCellStyle(cellCenter);
				
				//OK / Approver
				String queryApproverName = "SELECT fullName FROM user WHERE deleted = FALSE AND id = '" + securityEducation[3] + "'";
				c = row.createCell(4);
				c.setCellValue((String)session.createNativeQuery(queryApproverName).getSingleResult());
				c.setCellStyle(cellCenter);		
				
				//Cycle 
				CycleEnum cycel = CycleEnum.valueOf(securityEducation[4].toString());
				c = row.createCell(5);
				c.setCellValue(cycel.getText());
				c.setCellStyle(cellCenter);	
				
				//condition
				SecurityEducationProgressEnum progress = SecurityEducationProgressEnum.valueOf(securityEducation[5].toString());
				c = row.createCell(6);
				c.setCellValue(progress.getText());
				c.setCellStyle(cellCenter);	
				
				//Request for completion
				c = row.createCell(7);
				c.setCellValue(securityEducation[6] != null ? ((Timestamp) securityEducation[6]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//	Completed 
				c = row.createCell(8);
				c.setCellValue(securityEducation[7] != null ? ((Timestamp) securityEducation[7]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//	OK / Approve Date
				c = row.createCell(9);
				c.setCellValue(securityEducation[8] != null ? ((Timestamp) securityEducation[8]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	
	public static void exportExcelListSecurityViolation(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 30 * 256);
			sheet1.setColumnWidth(2, 13 * 256);
			sheet1.setColumnWidth(3, 25 * 256);
			sheet1.setColumnWidth(4, 20 * 256);
			sheet1.setColumnWidth(5, 20 * 256);
			sheet1.setColumnWidth(6, 15 * 256);
			sheet1.setColumnWidth(7, 11 * 256);
			sheet1.setColumnWidth(8, 11 * 256);
			sheet1.setColumnWidth(9, 11 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(1);
			c.setCellValue("제목");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(2);
			c.setCellValue("수준");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(3);
			c.setCellValue("회사명");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("대상 직원");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(5);
			c.setCellValue("확인/승인자");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("상태");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("시정요청");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("조치");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(9);
			c.setCellValue("확인/승인");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] securityViolation : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);			
				
				//title
				c = row.createCell(1);
				c.setCellValue(securityViolation[0].toString());
				c.setCellStyle(cellCenter);
				
				//Level
				SecurityViolationLevelEnum level = SecurityViolationLevelEnum.valueOf(securityViolation[1].toString());
				c = row.createCell(2);
				c.setCellValue(level.getText());
				c.setCellStyle(cellCenter);
				
				//Company Name
				String queryCompanyName = "SELECT companyName FROM company WHERE deleted = FALSE AND id = '" + securityViolation[2] + "'";
				c = row.createCell(3);
				c.setCellValue((String)session.createNativeQuery(queryCompanyName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//Target Employee
				String queryTargetEmployeeName = "SELECT fullName FROM user WHERE deleted = FALSE AND id = '" + securityViolation[3] + "'";
				c = row.createCell(4);
				c.setCellValue((String)session.createNativeQuery(queryTargetEmployeeName).getSingleResult());
				c.setCellStyle(cellCenter);	
				
				//OK / Approver
				String queryApproverName = "SELECT fullName FROM user WHERE deleted = FALSE AND id = '" + securityViolation[4] + "'";
				c = row.createCell(5);
				c.setCellValue((String)session.createNativeQuery(queryApproverName).getSingleResult());
				c.setCellStyle(cellCenter);		
				
				//condition
				SecurityViolationProgressEnum progress = SecurityViolationProgressEnum.valueOf(securityViolation[5].toString());
				c = row.createCell(6);
				c.setCellValue(progress.getText());
				c.setCellStyle(cellCenter);	
				
				//Corrective request
				c = row.createCell(7);
				c.setCellValue(securityViolation[6] != null ? ((Timestamp) securityViolation[6]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//measure  
				c = row.createCell(8);
				c.setCellValue(securityViolation[7] != null ? ((Timestamp) securityViolation[7]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//	OK / Approve Date
				c = row.createCell(9);
				c.setCellValue(securityViolation[8] != null ? ((Timestamp) securityViolation[8]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	public static void exportExcelListSecurityCheck(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 8));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 30 * 256);
			sheet1.setColumnWidth(2, 23 * 256);
			sheet1.setColumnWidth(3, 18 * 256);
			sheet1.setColumnWidth(4, 25 * 256);
			sheet1.setColumnWidth(5, 14 * 256);
			sheet1.setColumnWidth(6, 13 * 256);
			sheet1.setColumnWidth(7, 11 * 256);
			sheet1.setColumnWidth(8, 11 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(1);
			c.setCellValue("제목");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(2);
			c.setCellValue("사업범위");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(3);
			c.setCellValue("대상 역할");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("점검시점");
			c.setCellStyle(cellCenterTitle);
			c = row.createCell(5);
			c.setCellValue("주기");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("상태");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("등록");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("점검완료");
			c.setCellStyle(cellCenterTitle);
			

			int i = 1;
			for (Object[] securityCheck : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);			
				
				//title
				c = row.createCell(1);
				c.setCellValue(securityCheck[0].toString());
				c.setCellStyle(cellCenter);
				
				//Business Scope
				BusinessScopeEnum businessScope = BusinessScopeEnum.valueOf(securityCheck[1].toString());
				if (businessScope.equals(BusinessScopeEnum.BUSINESS_CHOICE)) {
					String queryProjectName = "SELECT projectName FROM project WHERE deleted = FALSE AND id = '" + securityCheck[8] + "'";
					c = row.createCell(2);
					c.setCellValue((String)session.createNativeQuery(queryProjectName).getSingleResult());
					c.setCellStyle(cellCenter);		
				} else {
					c = row.createCell(2);
					c.setCellValue(businessScope.getText());
					c.setCellStyle(cellCenter);
				}

				//Target Role
				TargetRoleEnum targetRole = TargetRoleEnum.valueOf(securityCheck[2].toString());
				c = row.createCell(3);
				c.setCellValue(targetRole.getText());
				c.setCellStyle(cellCenter);
				
				//Inspection time
				InspectionTimeEnum inspectionTime = InspectionTimeEnum.valueOf(securityCheck[3].toString());
				c = row.createCell(4);
				c.setCellValue(inspectionTime.getText());
				c.setCellStyle(cellCenter);
				
				//Cycle
				c = row.createCell(5);
				c.setCellValue(securityCheck[4] != null ? CycleEnum.valueOf(securityCheck[4].toString()).getText() : "");
				c.setCellStyle(cellCenter);	
				
				//condition
				SecurityCheckProgressEnum progress = SecurityCheckProgressEnum.valueOf(securityCheck[5].toString());
				c = row.createCell(6);
				c.setCellValue(progress.getText());
				c.setCellStyle(cellCenter);	
				
				//Enrollment
				c = row.createCell(7);
				c.setCellValue(securityCheck[6] != null ? ((Timestamp) securityCheck[6]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//Checked
				c = row.createCell(8);
				c.setCellValue(securityCheck[7] != null ? ((Timestamp) securityCheck[7]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	public static void exportExcelListProduct(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 25 * 256);
			sheet1.setColumnWidth(2, 25 * 256);
			sheet1.setColumnWidth(3, 20 * 256);
			sheet1.setColumnWidth(4, 20 * 256);
			sheet1.setColumnWidth(5, 25 * 256);
			sheet1.setColumnWidth(6, 12 * 256);
			sheet1.setColumnWidth(7, 12 * 256);
			sheet1.setColumnWidth(8, 12 * 256);
			sheet1.setColumnWidth(9, 12 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(1);
			c.setCellValue("산출물명");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(2);
			c.setCellValue("사업명");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(3);
			c.setCellValue("수행관리자");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("확인/승인자");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(5);
			c.setCellValue("상태");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("등록요청");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("산출물등록");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("확인/승인");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(9);
			c.setCellValue("마감");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] product : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);			
				
				//Product name
				c = row.createCell(1);
				c.setCellValue(product[0].toString());
				c.setCellStyle(cellCenter);
				
				//Project name
				String queryProjectName = "SELECT projectName FROM project WHERE deleted = FALSE AND id = '" + product[1] + "'";
				c = row.createCell(2);
				c.setCellValue((String)session.createNativeQuery(queryProjectName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//Performer
				String queryPerformerName = "SELECT fullName FROM user WHERE deleted = FALSE AND id = '" + product[2] + "'";
				c = row.createCell(3);
				c.setCellValue((String)session.createNativeQuery(queryPerformerName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//OK/Approver 
				String queryApproverName = "SELECT fullName FROM user WHERE deleted = FALSE AND id = '" + product[3] + "'";
				c = row.createCell(4);
				c.setCellValue((String)session.createNativeQuery(queryApproverName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//condition 
				ProductProgressEnum productProgress = ProductProgressEnum.valueOf(product[4].toString());
				c = row.createCell(5);
				c.setCellValue(productProgress.getText());
				c.setCellStyle(cellCenter);		
				
				//Registration request
				c = row.createCell(6);
				c.setCellValue(((Timestamp) product[5]).toLocalDateTime().format(formatter1));
				c.setCellStyle(cellCenter);	
				
				//Product Registration
				c = row.createCell(7);
				c.setCellValue(product[6] != null ? ((Timestamp) product[6]).toLocalDateTime().format(formatter1) : "");
				c.setCellStyle(cellCenter);	
				
				//OK / Approve Date 
				c = row.createCell(8);
				c.setCellValue(product[7] != null ? ((Timestamp) product[7]).toLocalDateTime().format(formatter1) : "");
				c.setCellStyle(cellCenter);	
				
				//deadline
				c = row.createCell(9);
				c.setCellValue(product[8] != null ? ((Timestamp) product[8]).toLocalDateTime().format(formatter1) : "");
				c.setCellStyle(cellCenter);	
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	public static void exportExcelListHelp(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			CellStyle cellLeft = setBorderAndFont(wb, 1, false, 11, "", "LEFT");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 12 * 256);
			sheet1.setColumnWidth(2, 40 * 256);
			sheet1.setColumnWidth(3, 80 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(1);
			c.setCellValue("등록일");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(2);
			c.setCellValue("제목");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(3);
			c.setCellValue("내용");
			c.setCellStyle(cellCenterTitle);

			int i = 1;
			for (Object[] help : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);			
				
				//Registration date
				c = row.createCell(1);
				c.setCellValue(((Timestamp) help[0]).toLocalDateTime().format(formatter1));
				c.setCellStyle(cellCenter);	
				
				//title
				c = row.createCell(2);
				c.setCellValue(help[1].toString());
				c.setCellStyle(cellCenter);
				
				//Content
				
				c = row.createCell(3);
				c.setCellValue(help[2].toString().replaceAll("\\<.*?>",""));
				c.setCellStyle(cellLeft);

				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	public static void exportExcelListEquipment(HttpServletResponse response,
			String fileName, String sheetName, List<Object[]> list, String title, EntityManager session) throws IOException {
		// New Workbook
		Workbook wb = new XSSFWorkbook();
		try {
			DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			CellStyle cellCenterTitle = setBorderAndFont(wb, 1, true, 11, "", "CENTER");
			CellStyle cellCenter = setBorderAndFont(wb, 1, false, 11, "", "CENTER");
			Cell c = null;
			// New Sheet
			Sheet sheet1 = null;
			sheet1 = wb.createSheet(sheetName);
			sheet1.createFreezePane(0, 3);
			// Row and column indexes
			int idx = 0;
			// Generate column headings
			Row row;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue(title.toUpperCase());
			c.setCellStyle(setBorderAndFont(wb, 0, true, 14, "BLUE", "CENTER"));
			row.setHeight((short) 800);
			sheet1.addMergedRegion(new CellRangeAddress(0, 0, 0, 10));

			// set column width
			sheet1.setColumnWidth(0, 6 * 256);
			sheet1.setColumnWidth(1, 30 * 256);
			sheet1.setColumnWidth(2, 20 * 256);
			sheet1.setColumnWidth(3, 25 * 256);
			sheet1.setColumnWidth(4, 20 * 256);
			sheet1.setColumnWidth(5, 20 * 256);
			sheet1.setColumnWidth(6, 23 * 256);
			sheet1.setColumnWidth(7, 11 * 256);
			sheet1.setColumnWidth(8, 11 * 256);
			sheet1.setColumnWidth(9, 11 * 256);
			sheet1.setColumnWidth(10, 11 * 256);
			
			// Generate rows header of grid
			idx++;
			row = sheet1.createRow(idx);
			c = row.createCell(0);
			c.setCellValue("");
			c.setCellStyle(setBorderAndFont(wb, 0, false, 12, "", "LEFT"));
			sheet1.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
			idx++;
			row = sheet1.createRow(idx);
			idx++;
			row.setHeight((short) 800);
			c = row.createCell(0);
			c.setCellValue("No");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(1);
			c.setCellValue("제목");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(2);
			c.setCellValue("사업명");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(3);
			c.setCellValue("수행관리자");
			c.setCellStyle(cellCenterTitle);

			c = row.createCell(4);
			c.setCellValue("확인/승인자");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(5);
			c.setCellValue("상태");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(6);
			c.setCellValue("종류");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(7);
			c.setCellValue("사용요청");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(8);
			c.setCellValue("사용승인");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(9);
			c.setCellValue("종료요청");
			c.setCellStyle(cellCenterTitle);
			
			c = row.createCell(10);
			c.setCellValue("종료승인");
			c.setCellStyle(cellCenterTitle);
			
			int i = 1;
			for (Object[] equipment : list) {
				row = sheet1.createRow(idx);
				row.setHeight((short) 900);
				c = row.createCell(0);
				c.setCellValue(i);
				c.setCellStyle(cellCenter);			
				
				//title
				c = row.createCell(1);
				c.setCellValue(equipment[0].toString());
				c.setCellStyle(cellCenter);
				
				//Business name
				String queryProejectName = "SELECT projectName FROM project WHERE deleted = FALSE AND id = '" + equipment[1] + "'";
				c = row.createCell(2);
				c.setCellValue((String)session.createNativeQuery(queryProejectName).getSingleResult());
				c.setCellStyle(cellCenter);	
				
				//Performer
				String queryPerformerName = "SELECT fullName FROM user WHERE deleted = FALSE AND id = '" + equipment[2] + "'";
				c = row.createCell(3);
				c.setCellValue((String)session.createNativeQuery(queryPerformerName).getSingleResult());
				c.setCellStyle(cellCenter);
				
				//OK / Approver name
				String queryApproverName = "SELECT fullName FROM user WHERE deleted = FALSE AND id = '" + equipment[3] + "'";
				c = row.createCell(4);
				c.setCellValue((String)session.createNativeQuery(queryApproverName).getSingleResult());
				c.setCellStyle(cellCenter);	
				
				//condition
				EquipmentProgressEnum progress = EquipmentProgressEnum.valueOf(equipment[4].toString());
				c = row.createCell(5);
				c.setCellValue(progress.getText());
				c.setCellStyle(cellCenter);	
				
				//Kinds
				String equipmentKindName = "";
				String queryEK = "SELECT ek.id, ek.name, ek.parent_id FROM equipmentkind as ek WHERE id = " + equipment[5];
				Object[] objEK = (Object[]) session.createNativeQuery(queryEK).getSingleResult();
				if (objEK != null) {	
					if (objEK[2] != null) {
						String queryEKParent = "SELECT ek.id, ek.name, ek.parent_id FROM equipmentkind as ek WHERE id = " + objEK[2];
						Object[] objEKParent = (Object[]) session.createNativeQuery(queryEKParent).getSingleResult();
						if (objEKParent != null) {
							equipmentKindName = objEKParent[1].toString() + "(" + objEK[1] + ")";
						}
					} else {
						equipmentKindName = objEK[1].toString();
					}
				}
				c = row.createCell(6);
				c.setCellValue(equipmentKindName);
				c.setCellStyle(cellCenter);	
				
				//Use request
				c = row.createCell(7);
				c.setCellValue(equipment[6] != null ? ((Timestamp) equipment[6]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//Authorization to use
				c = row.createCell(8);
				c.setCellValue(equipment[7] != null ? ((Timestamp) equipment[7]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//	Termination request 
				c = row.createCell(9);
				c.setCellValue(equipment[8] != null ? ((Timestamp) equipment[8]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				//	End Approval 
				c = row.createCell(10);
				c.setCellValue(equipment[9] != null ? ((Timestamp) equipment[9]).toLocalDateTime().format(formatter1) : "-");
				c.setCellStyle(cellCenter);	
				
				i++;
				idx++;
			}

			idx++;
			// createNoteRow(wb, sheet1, idx);
			idx++;
			ByteArrayOutputStream fileOut = new ByteArrayOutputStream();
			wb.write(fileOut);
			String mimeType = "application/octet-stream";
			response.setContentType(mimeType);
			response.setHeader("Content-Disposition",
					String.format("attachment; filename=\"" + fileName + ".xlsx" + "\""));
			response.setContentLength((int) fileOut.size());

			InputStream inputStream = new ByteArrayInputStream(fileOut.toByteArray());
			FileCopyUtils.copy(inputStream, response.getOutputStream());
			response.flushBuffer();
			inputStream.close();
		} finally {
			wb.close();

		}
	}
	
	
	
	public static CellStyle setBorderAndFont(final Workbook workbook,
			final BorderStyle borderStyle, final boolean isTitle, final int fontSize,
			final String fontColor, final String textAlign , final boolean italic) {
		
		final CellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setWrapText(true);
		
		if(borderStyle!=null){
			cellStyle.setBorderTop(borderStyle); // single line border
			cellStyle.setBorderBottom(borderStyle); // single line border
			cellStyle.setBorderLeft(borderStyle); // single line border
			cellStyle.setBorderRight(borderStyle); // single line border
		}
		
		if (textAlign.equals("RIGHT")) {
			cellStyle.setAlignment(HorizontalAlignment.RIGHT);
		} else if (textAlign.equals("CENTER")) {
			cellStyle.setAlignment(HorizontalAlignment.CENTER);
		} else if (textAlign.equals("LEFT")) {
			cellStyle.setAlignment(HorizontalAlignment.LEFT);
		}
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		
		final Font font = workbook.createFont();
		font.setFontName("Times New Roman");
		if (isTitle) {
			font.setBold(true);
		} 
		if (fontColor.equals("RED")) {
			font.setColor(Font.COLOR_RED);
		} else if (fontColor.equals("BLUE")) {
			font.setColor(HSSFColor.BLUE.index);
		} else if (fontColor.equals("ORANGE")){
			font.setColor(HSSFColor.ORANGE.index);
		} else {
			
		}
		
		if (italic) {
			font.setItalic(true);
		}
		
		font.setFontHeightInPoints((short) fontSize);
		cellStyle.setFont(font);

		return cellStyle;
	}
	
	public static Map<String, CellStyle> createStylesMap(Workbook wb){
		Map<String, CellStyle> styles = new HashMap<>();
		DataFormat df = wb.createDataFormat();
		CellStyle style;
		
		Font titleFont = wb.createFont();
		titleFont.setFontHeightInPoints((short) 14);
		titleFont.setFontName("Times New Roman");
		titleFont.setBold(true);
		style = wb.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setFont(titleFont);
		styles.put("title", style);
		
		style = createBorderedStyleCell(wb);
		Font fontcell = wb.createFont();
		fontcell.setFontHeightInPoints((short) 12);
		fontcell.setFontName("Times New Roman");
		style.setAlignment(HorizontalAlignment.LEFT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(fontcell);
		styles.put("cell", style);
		
		style = createBorderedStyleCell(wb);
		Font fontNumber = wb.createFont();
		fontNumber.setFontHeightInPoints((short) 12);
		fontNumber.setFontName("Times New Roman");
		style.setAlignment(HorizontalAlignment.RIGHT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(fontNumber);
		styles.put("cell_number", style);
		
		style = createBorderedStyleCell(wb);
		Font fontNumberCenter = wb.createFont();
		fontNumber.setFontHeightInPoints((short) 12);
		fontNumber.setFontName("Times New Roman");
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(fontNumberCenter);
		styles.put("cell_number_center", style);
		
		style = createBorderedStyleCell(wb);
		Font fontDay = wb.createFont();
		fontDay.setFontHeightInPoints((short) 12);
		fontDay.setFontName("Times New Roman");
		style.setAlignment(HorizontalAlignment.RIGHT);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setWrapText(true);
		style.setFont(fontDay);
		style.setDataFormat(df.getFormat("dd/MM/yyyy"));
		styles.put("cell_day", style);
		
		CellStyle cell_sub = wb.createCellStyle();
		Font fontSubTitle = wb.createFont();
		fontSubTitle.setFontHeightInPoints((short) 10);
		fontSubTitle.setFontName("Times New Roman");
		fontSubTitle.setItalic(true);
		cell_sub.setAlignment(HorizontalAlignment.LEFT);
		cell_sub.setVerticalAlignment(VerticalAlignment.CENTER);
		cell_sub.setWrapText(true);
		cell_sub.setFont(fontSubTitle);
		styles.put("cell_sub", cell_sub);
		
		return styles;
	}
	
	private static CellStyle createBorderedStyleCell(Workbook wb) {
		CellStyle style = wb.createCellStyle();
		style.setBorderRight(BorderStyle.THIN);
		style.setRightBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderBottom(BorderStyle.THIN);
		style.setBottomBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderLeft(BorderStyle.THIN);
		style.setLeftBorderColor(IndexedColors.BLACK.getIndex());
		style.setBorderTop(BorderStyle.THIN);
		style.setTopBorderColor(IndexedColors.BLACK.getIndex());
		return style;
	}
}