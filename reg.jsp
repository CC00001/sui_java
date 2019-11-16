<%@ page language="java" contentType="text/html; charset=ISO-8859.1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC"//w3c//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4//oose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-885-1">
  <title>Regjsp</title>
 </head>
 <body>
  <%@ page import="java.sql.*" %>
  <%@ page import="javax.sql.*" %>
  <%
   //String user = request.getParameter("userid");
   //session.putValue("userid", user);
   String uname = request.getParameter("username");
   String password = request.getParameter("password");
   String fname = request.getParameter("fname");
   String lname = request.getParameter("lname");
   String email = request.getParameter("email");
   Class.forName("com.mysql.jdbc.Driver");
   java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/test", "root", "");
   Statement st=con.createStatement();
   //String query = "SELECT * FROM users;";
   //ResultSet rs = st.executeQuery(query);
   int i = st.executeUpdate("INSERT INTO users (user_id, user_name, password, first_name, last_name, email) VALUES (0, '" + uname + "', '" + password + "', '" + fname + "', '" + lname + "', '" + email + "')");
   out.println("Registered" + "\n");
  
   String query = "SELECT * FROM users;";
   ResultSet rs = st.executeQuery(query);
   %>
   <!--
   <table border = 1>
    <tr>
     <td>User ID</td>
     <td>User Name</td>
     <td>First Name</td>
     <td>Last Name</td>
     <td>Email Address</td>
   </tr>
   -->
   <% while(rs.next()){
   int id = rs.getInt("user_id");
   String u_name = rs.getString("user_name");
   String f_name = rs.getString("first_name");
   String l_name = rs.getString("last_name");
   String _email = rs.getString("email");
   //out.println("User ID: " + id + "\t" + " First Name: " + f_name + "\t" + " Last Name: " + l_name + "\t" + " Email: " + _email + "\n");
   %>
   <!--
   <tr>
    <td><%=id%></td>
    <td><%=u_name%></td>
    <td><%=f_name%></td>
    <td><%=l_name%></td>
    <td><%=_email%></td>
   </tr>
   -->
   <%
   }
   %>
   </table>
   <a href="index.html">Go Back</a>
 </body>
</html>
 
