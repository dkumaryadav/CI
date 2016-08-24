package com.mindtree.formDetails;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.ListBlobItem;

@WebServlet("/view")
public class ViewDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String storageConnectionString = "DefaultEndpointsProtocol=http;" + "AccountName=m1034340sa;"
			+ "AccountKey=witATLh1//OAGp3BavIlW8EmzQxA2csPQs5i86fnJQqwmNd0RCZoe1kSOyIKrA8xt6HOiFSdO6iKPOrUDKYxhw==";
    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		try
    		{
    		    // Retrieve storage account from connection-string.
    		    CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);

    		    // Create the blob client.
    		    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();

    		    // Retrieve reference to a previously created container.
    		    CloudBlobContainer container = blobClient.getContainerReference("mycontainer");

    		    // Loop over blobs within the container and output the URI to each of them.
    		    PrintWriter out = response.getWriter();
    		    for (ListBlobItem blobItem : container.listBlobs()) {
    		       
    		   }
    		}
    		catch (Exception e)
    		{
    		    // Output the stack trace.
    		    e.printStackTrace();
    		}
	}

}
