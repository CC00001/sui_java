import java.sql.*;

public class DBConnect{
 private Connection con;
 private Statement st;
 private ResultSet rs;

 //Constructor
 public DBConnect(){
  try {
   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", " ");
   st = con.createStatement();
   }catch(Exception ex){
System.out.println("Error:" + ex);
  }
 }
 //Method
  public void getData(){
  try{
   String query = "select * from perscans";
   rs = st.executeQuery(query);
   System.out.println("Reconnect from Database");
   while(rs.next()){
    String name = rs.getString("name");
    String age = rs.getString("age");
    System.out.println("Name:" + name + " age:" + age);
   }
   }catch(Exception ex){
   System.out.println("Error:" + ex);
  }
 }

}
