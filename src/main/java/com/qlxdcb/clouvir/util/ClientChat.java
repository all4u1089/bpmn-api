package com.qlxdcb.clouvir.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;

public class ClientChat {
	
	public static void main(String args[]) throws IOException {
		Socket socket = null;
		System.out.println("Establishing connection. Please wait ...");
		try {
			socket = new Socket("localhost", 5992);
			System.out.println("Connected_ " + socket);
		} catch (UnknownHostException uhe) {
			System.out.println("Host unknown_ " + uhe.getMessage());
		} catch (IOException ioe) {
			System.out.println("Unexpected exception_ " + ioe.getMessage());
		}
		PrintWriter pw = new PrintWriter(socket.getOutputStream(), true);
		//Get internal IP
		InetAddress i = InetAddress.getLocalHost();
		//Send internal IP to server
		pw.println(i.getHostAddress());
        pw.flush();
		BufferedReader input = new BufferedReader(new InputStreamReader(socket.getInputStream()));
		//Get answer from server
	    String answer = input.readLine();
	    System.out.println("answer_ " + answer);
	    while (answer != null && !answer.equals("mFailed to detect user. Please contact to Administrator to config your IP.")) {
	    	try {
	    		//Get message from server
		    	answer = input.readLine();
	    	} catch (SocketException e) {
	    		return;
	    	}
	    	System.out.println("message_ " + answer);
		}
	    System.out.println("end");
	    
	    @SuppressWarnings("unused")
		String abc = "role_list,role_add,role_update,role_view,role_delete,message_list,message_add,message_view,message_delete,messagereceiver_list,messagereceiver_view,messagereceiver_delete,securitycheck_list,securitycheck_add,securitycheck_update,securitycheck_view,securitycheck_delete,securityviolation_list,securityviolation_add,securityviolation_update,securityviolation_view,securityviolation_delete,employee_list,employee_add,employee_update,employee_view,employee_delete,employer_list,employer_add,employer_update,employer_view,employer_delete,project_list,project_add,project_update,project_view,project_delete,company_list,company_add,company_update,company_view,company_delete,help_list,help_add,help_update,help_view,help_delete,product_list,product_add,product_update,product_view,product_delete,product_confirm,securityeducation_list,securityeducation_update,securityeducation_view,securityeducation_confirmcompletion,securityeducation_registercompletion,securityeducation_confirmrequest,equipment_list,equipment_view,equipment_confirmusage,equipment_confirmtermination,equipment_add,equipment_update,equipment_view,equipment_delete,equipment_requesttermination";
	}
}
