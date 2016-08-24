package com.mindtree.formDetails;

import java.io.File;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import java.io.*;
import java.util.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

import com.microsoft.azure.storage.*;
import com.microsoft.azure.storage.blob.*;

@WebServlet("/upload")
public class FormDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	//-- Update AccountName and AccountKey with your storage account name and storage account key
	public static final String storageConnectionString = "DefaultEndpointsProtocol=http;" + "AccountName=m1034340sa;"
			+ "AccountKey=witATLh1//OAGp3BavIlW8EmzQxA2csPQs5i86fnJQqwmNd0RCZoe1kSOyIKrA8xt6HOiFSdO6iKPOrUDKYxhw==";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		File file;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		//-- Local path where the files will get uploaded first. Then files from the below directory will be uploaded to Azure
		String filePath = "C:/Users/azure/Desktop/files_upload/";
		File filebase = new File("" + filePath);

		filebase.mkdir();

		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(maxMemSize);
			factory.setRepository(new File("C:/Users/azure/Desktop/files_upload/"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(maxFileSize);
			try {
				CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);
				CloudBlobClient blobClient = storageAccount.createCloudBlobClient();
				CloudBlobContainer container = blobClient.getContainerReference("mycontainer");
				container.createIfNotExists();
				
				List fileItems = upload.parseRequest(request);
				Iterator i = fileItems.iterator();
				PrintWriter out = response.getWriter();

				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						String fileName = fi.getName();
						file = new File(filePath + fileName);
						fi.write(file);
						out.println("Uploaded Filename: " + filePath + fileName + "<br>");
						CloudBlockBlob blob = container.getBlockBlobReference(fileName);
						File source = new File(filePath+"/"+fileName);
						blob.upload(new FileInputStream(source), source.length());
						
						response.sendRedirect("success.jsp");
					}
				}

			
				

			} catch (Exception ex) {
				System.out.println(ex);
			}
		}
	}
}
