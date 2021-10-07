<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
String keyword = "sss";
%>

<!DOCTYPE html>
<html>
<head>
<title>File upload example with accept</title>

</head>

<body>

	<!-- ajax로 보내도록 변경 -->
	<form action="uploadpage.action" method="post" enctype="multipart/form-data">
		
			<label for="file">Choose file to upload</label> 
			
			<input type="hidden" name="PL_CD" value="1">
			<input type="file" name="image" accept=".jpg, .jpeg, .png">

			<input type="submit" value="Submit">
	</form>

</body>

</html>