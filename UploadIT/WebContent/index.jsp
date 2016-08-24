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

#fields {
	height: 25px;
	font-size: 18px;
}
</style>
<script type="text/javascript">
function redirect(){
	alert("hello");

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
<jsp:forward page="/WEB-INF/hello.jsp" />
	
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