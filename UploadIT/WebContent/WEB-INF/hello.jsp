<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload It!!</title>
<style>
button {
	width: 200px;
	height: 50px;
	border-bottom-left-radius: 0.5em;
	border-bottom-right-radius: 0.5em;
	border-top-left-radius: 0.5em;
	border-top-right-radius: 0.5em;
	font-size: 20px;
}

#back {
	float: left;
	height: 30px;
	width: 70px;
	margin-top: -90px;
	margin-left: 15px;
	display: none;
}

#input {
	margin-left: 10px;
}

hr {
	background-color: red;
	height: 10px;
	width: 100%;
}

img {
	margin-left: 25px;
}

#submit {
	height: 50px;
	width: 200px;
	margin-left: 0px;
	border-bottom-left-radius: 1.5em;
	border-bottom-right-radius: 1.5em;
	border-top-left-radius: 1.5em;
	border-top-right-radius: 1.5em;
	font-size: 20px;
	background-color: green;
	color: white;
}
</style>


<script>
function uploadingFiles(){
	document.getElementById('back').style.display = "block";
	document.getElementById('submit').style.display = "block";
	
	document.getElementById('upload').style.display = "none";
	document.getElementById('view').style.display = "none";
	
	document.getElementById('file').click();
    	
}

function listFiles(){
	
	if(document.getElementById('file').files.length>0)
	 {
		
		var submit = document.getElementById("submit");
		
		for(var x=0;x<document.getElementById('file').files.length;x++){
		var file_name = document.getElementById('file').files[x].name;
		var file_size = document.getElementById('file').files[x].size;
		var reader = new FileReader();
		var selDiv = document.getElementById(0);
        reader.onload = function (e) {
            var html = "<img style='width:100px;height:100px'src=\"" + e.target.result + "\">" +"  "+	file_name +"  "+file_size+"Bytes"+"<br clear=\"left\"/>";
            selDiv.innerHTML += html;               
        }
        
        reader.readAsDataURL(document.getElementById('file').files[x]);
	  }
	 }
	
}
</script>
</head>
<body>
	<br>
	<br>
	<br>
	<hr>
	<img src="${pageContext.request.contextPath}/resources/download.png" />
	<br>
	<hr>
	<center>
		<h1>Welcome to possible</h1>

		<br>
		<br>
		<br> <a href="index.jsp"><button id="back">Back</button></a>
		<form method="POST" action="upload" enctype="multipart/form-data">
			<input type="file" name="file" id="file" onchange="listFiles()" accept="image/*"
				style="display: none" /> <input id="submit" type="submit"
				style="display: none" />

		</form>
		<a href="#">
			<button id="upload" onclick="uploadingFiles()">Upload</button>
		</a> <br>
		<br> <a href="view"><button id="view">View</button></a> <br>
		<div id="0" />


	</center>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<hr style="height: 5px">
</body>
</html>