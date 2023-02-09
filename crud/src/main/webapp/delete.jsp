<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*"%>
<%
int id =Integer.parseInt(request.getParameter("id")); 
Connection con;
PreparedStatement pre,pre2;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud","myuser","123");
pre = con.prepareStatement("delete from salary where id=?");
pre.setInt(1,id);
pre.executeUpdate();
pre2 = con.prepareStatement("delete from employee where id=?");
pre2.setInt(1,id);
pre2.executeUpdate();
response.sendRedirect("crud.jsp");
%>
