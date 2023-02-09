<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*" %>
    <%
    if(request.getParameter("update")!=null) 
    {   
    String empName,dep,sex,mStatus,address;
    int id,salary;
    empName=request.getParameter("ename");
    dep=request.getParameter("dep");
    sex=request.getParameter("sex");
    mStatus=request.getParameter("mstatus");
    address=request.getParameter("add");
    id=Integer.parseInt(request.getParameter("eid"));
    salary=Integer.parseInt(request.getParameter("salary"));
    
    Connection con = null;
    PreparedStatement pre,pre2;
    ResultSet rs;
   Class.forName("org.postgresql.Driver");
    con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud","myuser","123");
    pre = con.prepareStatement("update employee set employee_name=?,department=?,martial_status=?,sex=?,address=? where id=?");
    pre2 = con.prepareStatement("update salary set salary=? where id=?");
    pre.setString(1,empName);
    pre.setString(2,dep);
    pre.setString(3,mStatus);
    pre.setString(4,sex);
    pre.setString(5,address);
    pre.setInt(6,id);
    pre2.setInt(1,salary);
    pre2.setInt(2, id);
    pre.executeUpdate();
    pre2.executeUpdate();
    response.sendRedirect("crud.jsp");        
}
%>
     <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD OPERATION</title>
<style>
#form{margin: auto auto;
  width: 60%;
  border: 3px solid blue;
  padding:10;}
input[type=text],select{
border:2px solid #96D4D4;
width:30%;
}
div{
margin:10px;}

a{
 border: 1px solid green;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  border-radius:5px;
}


</style>
</head>
<body>
 <%    
                         Connection con;
                        PreparedStatement pst,pst2;
                        ResultSet rs,rs2;
        
                        Class.forName("org.postgresql.Driver");
                        con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/crud","myuser","123");
                          
                          int id = Integer.parseInt(request.getParameter("id"));
                          
                        pst = con.prepareStatement("select * from employee where id = ?");
                        pst2= con.prepareStatement("select * from salary where id = ?");
                        pst.setInt(1, id);
                        pst2.setInt(1, id);
                        rs = pst.executeQuery();
                        rs2 = pst2.executeQuery();
                         while(rs.next()& rs2.next())
                         {
                    
                    %>
<div id="form">
 <form method="post" id="myform" action="#">
 <h1>EMPLOYEE FORM</h1>
 <div> <label for="ename">EMPLOYEE NAME:</label><br>
  <input type="text" id="ename" name="ename" value="<%= rs.getString(2)%>" required><br></div>
  
  <div><label for="eid">EMPLOYEE ID:</label><br>
  <input type="text" id="eid" name="eid" value="<%=rs.getInt(1) %>" required><br></div>
  
  <div><label for="dep">DEPARTMENT:</label><br>
  <select id="dep" name="dep"   required>
  <option value="<%= rs.getString(3)%>" id="dep" selected>"<%= rs.getString(3)%>"</option>
   <option value="FullStack Developer">FullStack Developer</option>
  <option value="Testing">Testing</option>
  <option value="Front-end">Front-end</option>
  <option value="Technical-support">Technical-support</option>"
  </select><br></div>
  
 <div> <label for="sex">SEX:</label><br>
 <script type="text/javascript">
  window.onload = function(){
    var a="<%= rs.getString(5)%>";
    var b="<%= rs.getString(4)%>";
    if(a == "Male"){document.getElementById("Male").checked = true;}
    else{document.getElementById("Female").checked = true;}
    
    if(b == "Married"){document.getElementById("Married").checked = true;}
    else{document.getElementById("Unmarried").checked = true;}
  };
</script>
  <input type="radio" id="Male" name="sex"  value="Male" required>
  <label for="Male">Male</label><br>
  <input type="radio" id="Female" name="sex"  value="Female">
  <label for="Female">female</label><br></div>
  
  <div><label for="mstatus">MARTIAL STATUS:</label><br>
  <input type="radio" id="Married" name="mstatus" value="Married" required>
  <label for="Married">Married</label><br>
  <input type="radio" id="Unmarried" name="mstatus" value="Unmarried" required>
  <label for="Unmarried">Unmarried</label><br></div>
  
  <div> <label for="salary">SALARY:</label><br>
  <input type="text" id="salary" name="salary" value="<%= rs2.getString(2)%>" required><br></div>
  
  <div><label for="add">ADDRESS:</label><br>
  <input type="text" id="add" name="add" value="<%= rs.getString(6)%>" required><br></div>
   <% }  %>
   <a href="crud.jsp" target="_blank">view</a>
  <button onclick="cancel()">cancel</button>
  <input type="submit"  id="submit" value="update" name="update" >
</form> </div>
<script>
function cancel(){
document.getElementById("myform").reset();
document.getElementById("add").value = " ";
document.getElementById("salary").value =  "";
document.getElementById("ename").value =  "";
document.getElementById("eid").value =  "";
document.getElementById("dep").value =  "";
}
</script>
</body>
</html>