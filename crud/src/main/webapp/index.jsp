<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%
    if(request.getParameter("submit")!=null) 
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
    pre = con.prepareStatement("insert into employee values(?,?,?,?,?,?)");
    pre2 = con.prepareStatement("insert into salary values(?,?)");
    pre.setInt(1,id);
    pre.setString(2,empName);
    pre.setString(3,dep);
    pre.setString(4,mStatus);
    pre.setString(5,sex);
    pre.setString(6,address);
    pre2.setInt(1, id);
    pre2.setInt(2,salary);
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
<div id="form">
 <form method="post" id="myform" action="#">
 <h1>EMPLOYEE FORM</h1>
 <div> <label for="ename">EMPLOYEE NAME:</label><br>
  <input type="text" id="ename" name="ename" required>
  </div>
  
  <div><label for="eid">EMPLOYEE ID:</label><br>
  <input type="text" id="eid" name="eid" pattern="[0-9]{1,}" required>
  </div>
  
  <div><label for="dep">DEPARTMENT:</label><br>
  <select id="dep" name="dep" required>
  <option value="FullStack Developer">FullStack Developer</option>
   <option value="FullStack Developer">FullStack Developer</option>
  <option value="Testing">Testing</option>
  <option value="Front-end">Front-end</option>
  <option value="Technical-support">Technical-support</option>
  </select><br></div>
  
 <div> <label for="sex">SEX:</label><br>
  <input type="radio" id="Male" name="sex"  value="Male" required>
  <label for="Male">Male</label><br>
  <input type="radio" id="Female" name="sex"  value="Female" required>
  <label for="Female">female</label><br>
  </div>
  
  <div><label for="mstatus">MARTIAL STATUS:</label><br>
  <input type="radio" id="Married" name="mstatus" value="Married" required>
  <label for="Married">Married</label><br>
  <input type="radio" id="Unmarried" name="mstatus" value="Unmarried" required >
  <label for="Unmarried">Unmarried</label><br>
  </div>
  
  <div> <label for="salary">SALARY:</label><br>
  <input type="text" id="salary" name="salary" pattern="[0-9]{1,}" required>
  
  <div><label for="add">ADDRESS:</label><br>
  <input type="text" id="add" name="add" required>
  </div>
  
   <a href="crud.jsp" target="_blank">view</a>
  <button onclick="cancel()">cancel</button>
  <input type="submit"  id="submit" value="submit" name="submit" >
</form> </div>
<script type="text/javascript">
function cancel(){
document.getElementById("myform").reset();
}
</script>
</body>
</html>