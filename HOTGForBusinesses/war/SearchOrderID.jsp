<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page language="java" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>

   
<% 
if(session.getAttribute("Lab_Id")==null){
	response.sendRedirect("index.html");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title></title>

<style>
body
{
margin:0;
padding:0;
background-color:grey;
}


table, th
{
border: 1px black;
}

td
{
padding:4px;
text-align:left;
border: 3px solid rgb(0, 25, 124);
border-radius:5px;
font-size:12px;
color:white;
}

td:nth-child(odd) {
    background-color: rgb(34, 45, 66);
}

td:nth-child(even) {
   /* background-color: rgb(255, 161, 161);*/
	min-width:200px;
}

h2
{
text-align:center;
padding:0;
margin:8px;
color:white;
background-color:rgb(131, 182, 131);
font-size:20px;
border-radius:8px;
}

.OrderHolder
{
float:left;
background-color:rgba(0, 21, 131, 0.72);
margin:35px;
color:white;
border:4px solid red;
box-shadow:4px 6px 8px black;
border-radius:10px;
}

.OrderHolder h1
{
text-align:center;
font-size:20px;
}

button
{
padding:8px;
margin:12px;
font-size:12px;

}

</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>



</head>
<body>
<% 

String url;
String Lab_Id=(String)session.getAttribute("Lab_Id");
String OrderID=request.getParameter("OrderID");
//SessionData SD;
//List<SessionData> CartData;
//CartData = (LinkedList<SessionData>)session.getAttribute("Cart");

	try { 
      	
          if (SystemProperty.environment.value() ==
              SystemProperty.Environment.Value.Production) {
            // Load the class that provides the new "jdbc:google:mysql://" prefix.
            Class.forName("com.mysql.jdbc.GoogleDriver");
            url = "jdbc:google:mysql://healthonthego1503:healthonthego/HOTG?user=root";
          } else {
            // Local MySQL instance to use during development.
        	  Class.forName("com.mysql.jdbc.Driver");
              url = "jdbc:mysql://127.0.0.1:3306/Mock2?user=Mock";
          }
        } catch (Exception e) {
        	
          e.printStackTrace();
         
          return;
        }

	try {
        java.sql.Connection conn = DriverManager.getConnection(url);
        try {
          
            String statement =  "select Order_Id_Test,Appointment_Date,Appointment_Time,Patient_Name,Patient_Age, "
								+"Patient_Gender,Patient_Med_History,Doc_Name_Consulted,Doc_Phno_Consulted, "
								+"Comp2.MRP,First_Name,Last_Name,Address,City,Pincode,Mobile_phone_Number,Alt_Phone_Number "
								+",Test_Name_Specific,CFN,CLN,CMPN,UEmail,TestStatus "
								+"from "
								+"(select * from "
 								+"(SELECT * from "  
								+"(select Collector_Id CID,First_Name CFN,Last_Name CLN,Mobile_Phone_Number CMPN "
								+"from Collection_Agent_List where Lab_Id like '"+Lab_Id+"') C "
 								+"left join "
  								+"(select * from User_Order_For_Test where Order_Id_Test like '%"+OrderID+"%') ORD "
								+"on " 
 								+"ORD.Collector_Id = C.CID ) Comp "
								+"inner join "
 								+"(select First_Name,Last_Name,Address,City,Pincode,Mobile_phone_Number, "
 								+"Alt_Phone_Number,Email_Id UEmail,User_Id UID from User) U "
 								+"on "
 								+"U.UID=Comp.User_Id) Comp2 "
 								+"inner join "
 								+"Test_List TL "
 								+"on Comp2.Test_Id = TL.Test_Id order by Appointment_Date,Appointment_Time";

			//System.out.println(statement);
            
            java.sql.Statement stmt = conn.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery(statement);
            
            while(rs.next())
            {
            %>
            	<div class="OrderHolder" id="<%=rs.getString(1)%>">
            	<h1>Order ID: <%=rs.getString(1)%></h1>
            	<div class="CustomerPatientData" style="float:left;width:100%;margin:1px;padding:6px">
            	
            	<div style="float:left;width:45%;height:230px;margin:4px;padding:12px;background-color:rgb(106, 120, 190);border-radius:10px;box-shadow:4px 4px 4px black">
            	<h2>Customer Data</h2>
            	<table border="1">
            	<tr><td>Name:</td><td><%=rs.getString(11)+" "+rs.getString(12)%></td></tr>
            	<tr><td>Address:</td><td><%=rs.getString(13)+" ,"+rs.getString(14)+" ,"+rs.getString(15) %></td></tr>
            	<tr><td>Mobile:</td><td><%=rs.getString(16) %></td></tr>
            	<tr><td>Alternate No.:</td><td><%=rs.getString(17) %></td></tr>          	
            	<tr><td>Email: </td><td><%=rs.getString(22) %></td></tr> 
            	</table>
            	</div>
            	
            	<div style="float:left;width:45%;height:230px;margin:4px;padding:12px;background-color:rgb(106, 120, 190);border-radius:10px;box-shadow:4px 4px 4px black">
            	<h2>Patient Data</h2>
            	<table border="1">
            	<tr><td>Name:</td><td><%=rs.getString(4)%></td></tr>
            	<tr><td>Age:</td><td><%=rs.getString(5)%></td></tr>
            	<tr><td>Gender:</td><td><%=rs.getString(6)%></td></tr>
            	<tr><td>Medical History:</td><td><%=rs.getString(7)%></td></tr>
            	</table>
            	</div>
            	
            	</div>
            	
            	
            	
            	<div class="OrderCollectorData" style="float:left;width:100%;margin:1px;padding:6px">
            	
            	<div style="float:left;width:45%;height:250px;margin:4px;padding:12px;background-color:rgb(106, 120, 190);border-radius:10px;box-shadow:4px 4px 4px black">
            	<h2>Order Data</h2>
            	<table border="1">
            	<tr><td>Order ID:</td><td><%=rs.getString(1)%></td></tr>
            	<tr><td>Appointment Date:</td><td><%=rs.getString(2)%></td></tr>
            	<tr><td>Appointment Time:</td><td><%=rs.getString(3)%></td></tr>
            	<tr><td>Test Name:</td><td><%=rs.getString(18)%></td></tr>
            	<tr><td>MRP:</td><td><%=rs.getString(10)%></td></tr>
            	<tr><td>Consulting Doctor:</td><td><%=rs.getString(8)%></td></tr>
            	<tr><td>Doctor Phone:</td><td><%=rs.getString(9)%></td></tr>
            	</table>
            	</div>
            	
            	<div style="float:left;width:45%;height:250px;margin:4px;padding:12px;background-color:rgb(106, 120, 190);border-radius:10px;box-shadow:4px 4px 4px black">
            	<h2>Collector Data</h2>
            	<table border="1">
            	<tr><td>Name:</td><td><%=rs.getString(19)+" "+rs.getString(20)%></td></tr>
            	<tr><td>Mobile:</td><td><%=rs.getString(21)%></td></tr>
            	<tr><td>Test Status:</td><td><%=rs.getString(22)%></td></tr>
            	</table>
            	
            	</div>
            	
            	</div>
            	
            	
            	
            	</div>
            	
            	
            <%
            }

        }
        catch (Exception f) {
            f.printStackTrace();
          }
        finally {
          conn.close();
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }


%>
</body>
</html>