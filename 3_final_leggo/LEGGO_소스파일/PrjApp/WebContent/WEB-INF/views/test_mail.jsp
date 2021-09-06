<%@page import="com.leggo.mail.MailSend"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.leggo.mail.*"  %>
 
<%
MailSend ms = new MailSend();
//ms.MailSend(회원 이메일);
 
out.println("COMPLETE");
%>
