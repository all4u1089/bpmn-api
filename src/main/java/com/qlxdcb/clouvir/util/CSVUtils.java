package com.qlxdcb.clouvir.util;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletResponse;

public class CSVUtils {
private static final char DEFAULT_SEPARATOR = ',';
    
    private static String followCVSformat(String value) {

        String result = value;
        if (result.contains("\"")) {
            result = result.replace("\"", "\"\"");
        }
        return result;

    }
    
    public static String formatString(List<String> values) throws IOException {

        boolean first = true;

        StringBuilder sb = new StringBuilder();
        for (String value : values) {
            if (!first) {
                sb.append(DEFAULT_SEPARATOR);
            }
            sb.append(followCVSformat(value));

            first = false;
        }
        sb.append("\n");
        return sb.toString();
    }  
    
    public static String formatString(List<String> values, char customQuote) throws IOException {

        boolean first = true;

        StringBuilder sb = new StringBuilder();
        for (String value : values) {
            if (!first) {
                sb.append(DEFAULT_SEPARATOR);
            }
            if (customQuote == ' ') {
                sb.append(followCVSformat(value));
            } else {
                sb.append(customQuote).append(followCVSformat(value)).append(customQuote);
            }

            first = false;
        }
        sb.append("\n");
        return sb.toString();
    } 
    
    public static void exportListEmployee(HttpServletResponse response, List<Object[]> list, EntityManager session) {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"EmployeeList.csv\"");
        try {
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(formatString(Arrays.asList("Name", "Contact", "Email", "Agency", "Department", "Role", "Reference description", "Internal IP", "External IP")).getBytes());
            List<String> datas = null;
            for (int i = 0; i < list.size(); i++) {
            	Object[] obj = list.get(i);
            	datas = new ArrayList<String>();
            	datas.add(obj[0].toString());
            	datas.add(obj[1].toString());
            	datas.add(obj[2].toString());
            	String queryCompanyName = "SELECT companyName FROM company WHERE deleted = FALSE AND id = '" + obj[3] + "'";
            	datas.add((String)session.createNativeQuery(queryCompanyName).getSingleResult());
            	datas.add(obj[4].toString());
            	String queryRoleName = "SELECT name FROM role WHERE deleted = FALSE AND id = '" + obj[5] + "'";
            	datas.add((String)session.createNativeQuery(queryRoleName).getSingleResult());
            	datas.add(obj[6].toString());
            	datas.add(obj[7].toString());
            	datas.add(obj[8].toString());
                outputStream.write(formatString(datas).getBytes());
            }
            outputStream.flush();
            outputStream.close();
        } catch(Exception e) {
            System.out.println(e.toString());
        }
    }
    
    public static void exportListEmployer(HttpServletResponse response, List<Object[]> list, EntityManager session) {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"EmployerList.csv\"");
        try {
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(formatString(Arrays.asList("Name", "Email", "Contact", "Department", "Role", "Reference description")).getBytes());
            List<String> datas = null;
            for (int i = 0; i < list.size(); i++) {
            	Object[] obj = list.get(i);
            	datas = new ArrayList<String>();
            	datas.add(obj[0].toString());
            	datas.add(obj[1].toString());
            	datas.add(obj[2].toString());
            	datas.add(obj[3].toString());
            	String queryRoleName = "SELECT name FROM role WHERE deleted = FALSE AND id = '" + obj[4] + "'";
            	datas.add((String)session.createNativeQuery(queryRoleName).getSingleResult());
            	datas.add(obj[5].toString());
                outputStream.write(formatString(datas).getBytes());
            }
            outputStream.flush();
            outputStream.close();
        } catch(Exception e) {
            System.out.println(e.toString());
        }
    }
    
    public static void exportListHelp(HttpServletResponse response, List<Object[]> list, EntityManager session) {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"HelpList.csv\"");
        try {
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(formatString(Arrays.asList("Title", "Contents")).getBytes());
            List<String> datas = null;
            for (int i = 0; i < list.size(); i++) {
            	Object[] obj = list.get(i);
            	datas = new ArrayList<String>();
            	datas.add(obj[0].toString());
            	datas.add(obj[1].toString().replaceAll("\n", ""));
                outputStream.write(formatString(datas, '"').getBytes());
            }
            outputStream.flush();
            outputStream.close();
        } catch(Exception e) {
            System.out.println(e.toString());
        }
    }
}
