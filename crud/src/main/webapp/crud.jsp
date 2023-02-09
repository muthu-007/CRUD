<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crud</title>
<style>
*{
margin-left: auto;
  margin-right: auto;
}
table,th,td{
color:black;
border:2px solid #96D4D4;
 border-collapse: collapse;
}
td {
  text-align: center;
}
 </style>
</head>
<body>
 
                         <table style="width:80%">
                             <tr>
                                    <th>Employee Id</th>
                                    <th>Employee Name</th>
                                    <th>Depatment</th>
                                    <th>Martial status</th>
                                    <th>Sex</th>
                                     <th>Salary</th>
                                    <th>Address</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
        <%  
 
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("org.postgresql.Driver");
                                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud","myuser","123");
                                
                                  String query = "select employee.id,employee.employee_name,employee.department,employee.martial_status,employee.sex,salary.salary,employee.address from employee inner join salary on employee.id=salary.id";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getInt(1) %></td>
                                 <td><%=rs.getString(2) %></td>
                                 <td><%=rs.getString(3) %></td>
                                 <td><%=rs.getString(4) %></td>
                                 <td><%=rs.getString(5) %></td>
                                 <td><%=rs.getString(6) %></td>
                                 <td><%=rs.getString(7) %></td>
                                 <td><a href="update.jsp?id=<%=id%>">edit</td>
                                 <td><a href="delete.jsp?id=<%=id%>">delete</td>
                                
                             </tr> 
                             
                             <% }%>
                              
                             
                     </table>    
                
</body>
</html>