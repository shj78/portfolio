<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String root = pageContext.getServletContext().getRealPath("/");
	System.out.println(root);
	
	String path = root + "pds" + File.separator + "saveData";
	System.out.println(path);
			
	File dir = new File(path);
	if (!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxFileSize = 5 * 1024 * 1024;	//--전송 최대 사이즈 5M
	
	try
	{
		MultipartRequest req = null;
		req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
		
		String mem_nnm = req.getParameter("mem_nnm");
		String mem_intro = URLEncoder.encode(req.getParameter("mem_intro"), "UTF-8");
		String mem_img = "pds" + File.separator + "saveData" + File.separator + req.getFilesystemName("mem_img");
		
		out.println("인코딩 변환: "+mem_intro);
		
		response.sendRedirect("profilesetting.action?mem_nnm="+ mem_nnm
								+ "&mem_intro=" + mem_intro
								+ "&mem_img=" + mem_img);
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test4.jsp</title>
</head>
<body>

</body>
</html>