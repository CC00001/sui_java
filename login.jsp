<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//w3c//DTD HTML 4.01 Transtional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">

  <title>login.jsp</title>
  </head>
  <body>
   <%@ page import="java.sql.*" %>
   <%@ page import="java.sql.*" %>
  <%
   String userid = request.getParameter("usr");
   session.putValue("user_name", userid);
   String password=request.getParameter("password");
   Class.forName("com.mysql.jdbc.Driver");
   java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/test", "root", "");
   Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from users where user_name = '" + userid + "'");
   if(rs.next()){
    if(rs.getString(3).equals(password)){
    out.println("Weclome " + userid);
    String uname = rs.getString("user_name");
    String fname = rs.getString("first_name");
    String lname = rs.getString("last_name");
    String _email = rs.getString("email");
    %>
    <table border=1>
     <tr>
      <td>User Name</td>
      <td>First Name</td>
      <td>Last Name</td>
      <td>Email</td>
     </tr>
     <tr>
      <td><%=uname%></td>
      <td><%=fname%></td>
      <td><%=lname%></td>
      <td><%=_email%></td>
     </tr>
    </table>
    <%
    }
    else{
       out.println("Invalid password, try again");
      }
  
    }
    %>
    <a href="index.html">Home</a>
  </body>
</html>
