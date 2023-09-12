<%@page import="java.sql.ResultSet"%><%@ include file="include/dbconnect.jsp" %>

<%
String name=(String)session.getAttribute("name");
session.setAttribute("name",name);
String pass=(String)session.getAttribute("pass");
String key=(String)session.getAttribute("key");
session.setAttribute("key",key);
String my_acc="";
session.setAttribute("pass",pass);

String id = request.getParameter("id");
System.out.println(id);
stmt5.executeUpdate("update user_reg set status='1' where id='"+id+"'");
response.sendRedirect("admin_home.jsp");
						
						

%>

