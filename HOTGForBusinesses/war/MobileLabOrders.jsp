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
<meta http-equiv="refresh" content="1800">

<title></title>

<style>
body
{
margin:0;
padding:0;

background: rgb(245,246,246); /* Old browsers */
/* IE9 SVG, needs conditional override of 'filter' to 'none' */
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMTAwJSIgeDI9IjEwMCUiIHkyPSIwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjZjVmNmY2IiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMjElIiBzdG9wLWNvbG9yPSIjZGJkY2UyIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iNDklIiBzdG9wLWNvbG9yPSIjYjhiYWM2IiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iODAlIiBzdG9wLWNvbG9yPSIjZGRkZmUzIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2Y1ZjZmNiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
background: -moz-linear-gradient(45deg,  rgba(245,246,246,1) 0%, rgba(219,220,226,1) 21%, rgba(184,186,198,1) 49%, rgba(221,223,227,1) 80%, rgba(245,246,246,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,rgba(245,246,246,1)), color-stop(21%,rgba(219,220,226,1)), color-stop(49%,rgba(184,186,198,1)), color-stop(80%,rgba(221,223,227,1)), color-stop(100%,rgba(245,246,246,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(45deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(45deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(45deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* IE10+ */
background: linear-gradient(45deg,  rgba(245,246,246,1) 0%,rgba(219,220,226,1) 21%,rgba(184,186,198,1) 49%,rgba(221,223,227,1) 80%,rgba(245,246,246,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f5f6f6', endColorstr='#f5f6f6',GradientType=1 ); /* IE6-8 fallback on horizontal gradient */

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

<script>

function AcceptOrder(OrderID)
{
	$.post("/ChangeTestStatus",
			  {
					   OrderID:OrderID,
					TestStatus:'Accept'
			  },
			  function(data,status){
			  	
				  if(status=='success'){
			  	if(data=='Pass'){
					  $("#"+OrderID).remove();
					  window.alert("Order accepted!! Please note the OrderID:"+OrderID);
			  		}
			  	else
			  		{
			  		window.alert("Could not accept the order. Please refresh your page and try again.");
			  		}
			  	}
			 
			  
			  });
	

}

function RejectOrder(OrderID)
{
	$.post("/ChangeTestStatus",
			  {
					   OrderID:OrderID,
					TestStatus:'Reject'
			  },
			  function(data,status){
			  	
				  if(status=='success'){
			  	if(data=='Pass'){
					  $("#"+OrderID).remove();
					  window.alert("Order Rejected!! Please note the OrderID:"+OrderID);
			  		}
			  	else
			  		{
			  		window.alert("Could not Reject the order. Please refresh your page and try again.");
			  		}
			  	}
			  });
}

</script>

</head>
<body>
<% 

String url;
String Lab_Id=(String)session.getAttribute("Lab_Id");
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
								+",Test_Name_Specific,CFN,CLN,CMPN,UEmail "
								+"from "
								+"(select * from "
 								+"(SELECT * from "  
								+"(select Collector_Id CID,First_Name CFN,Last_Name CLN,Mobile_Phone_Number CMPN "
								+"from Collection_Agent_List where Lab_Id like '"+Lab_Id+"') C "
 								+"left join "
  								+"(select * from User_Order_For_Test where TestStatus like 'OR') ORD "
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
            	</table>
            	<button onclick="AcceptOrder('<%=rs.getString(1)%>')">Accept</button>  <button onclick="RejectOrder('<%=rs.getString(1)%>')">Reject</button>
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