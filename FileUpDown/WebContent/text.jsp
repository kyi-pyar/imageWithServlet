<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.nio.file.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="download" method="post" enctype="multipart/form-data">
		<ul>
			<%
				String st = application.getRealPath("/Text");
				File folder = new File(st);
				File[] listOfFiles = folder.listFiles();
				for (int i = 0; i < listOfFiles.length; i++) {
					if (listOfFiles[i].isFile()) {
						String path =  listOfFiles[i].getName();
						String link = st + "\\" + listOfFiles[i].getName();
			%>
			<li><%=path%> <a href="download?path=<%=link%>"><sub>download
					here.....</sub></a></li>
			<%
				} else if (listOfFiles[i].isDirectory()) {
						System.out.println("Directory " + listOfFiles[i].getName());
					}
				}
			%>
		</ul>

	</form>


</body>
</html>