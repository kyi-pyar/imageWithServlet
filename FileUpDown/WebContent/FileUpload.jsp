<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
</head>
<body>
<div class="container">
<%
String msg=(String)session.getAttribute("saved");
if(msg!=null &&!msg.equals("new")){ 
	out.println("<h2>"+msg+"</h2>");
}
%>
<h1>File Uploading</h1>

<form action="upload" method="post" enctype="multipart/form-data">
Choose File to upload:  <input type="file" name="file">
<br><br>
<div class="d-grid">
<button class="btn btn-success">Upload</button>
</div>
</form>
</div>
</body>
</html>