
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Lab Screen</title>

<script>
<%  
if(session.getAttribute("Lab_Id")==null)
{
%>
window.onload = function()
{
	 window.location.replace("index.html");
}

<%
}
%>


function ActivateOrdersScreen()
{
	
document.getElementById("MainFrame").src="MobileLabOrders.jsp";
	
}

function ActivateRegColScreen()
{
document.getElementById("MainFrame").src="RegisterTimings.jsp";
}

function ActivateOrderSearchScreen()
{
	var OrderID=document.getElementsByName("OrderID")[0].value;
	
	document.getElementById("MainFrame").src="SearchOrderID.jsp?OrderID="+OrderID+"";	
	
}



</script>

<style>
body
{
background: rgb(59,103,158); /* Old browsers */

background: rgb(44,83,158); /* Old browsers */
/* IE9 SVG, needs conditional override of 'filter' to 'none' */
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMTAwJSIgeDI9IjEwMCUiIHkyPSIwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjMmM1MzllIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzJjNTM5ZSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
background: -moz-linear-gradient(45deg,  rgba(44,83,158,1) 0%, rgba(44,83,158,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,rgba(44,83,158,1)), color-stop(100%,rgba(44,83,158,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(45deg,  rgba(44,83,158,1) 0%,rgba(44,83,158,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(45deg,  rgba(44,83,158,1) 0%,rgba(44,83,158,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(45deg,  rgba(44,83,158,1) 0%,rgba(44,83,158,1) 100%); /* IE10+ */
background: linear-gradient(45deg,  rgba(44,83,158,1) 0%,rgba(44,83,158,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#2c539e', endColorstr='#2c539e',GradientType=1 ); /* IE6-8 fallback on horizontal gradient */

}


.Tabs
{
position:absolute;
top:36px;
height:40px;
width:15%;
color:white;
/*background-color:rgb(211, 11, 11);*/

background: rgb(169,3,41); /* Old browsers */
/* IE9 SVG, needs conditional override of 'filter' to 'none' */
background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMTAwJSIgeDI9IjEwMCUiIHkyPSIwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjAlIiBzdG9wLWNvbG9yPSIjYTkwMzI5IiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iODIlIiBzdG9wLWNvbG9yPSIjOGYwMjIyIiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzZiMWEyYyIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
background: -moz-linear-gradient(45deg,  rgba(169,3,41,1) 0%, rgba(143,2,34,1) 82%, rgba(107,26,44,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,rgba(169,3,41,1)), color-stop(82%,rgba(143,2,34,1)), color-stop(100%,rgba(107,26,44,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(45deg,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 82%,rgba(107,26,44,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(45deg,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 82%,rgba(107,26,44,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(45deg,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 82%,rgba(107,26,44,1) 100%); /* IE10+ */
background: linear-gradient(45deg,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 82%,rgba(107,26,44,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a90329', endColorstr='#6b1a2c',GradientType=1 ); /* IE6-8 fallback on horizontal gradient */


padding:2px;
margin:0;
border-top-right-radius:8px;
border-top-left-radius:8px;
font-family:sans-serif;
font-size:12px;
}

.Tabs:hover
{
color:black;
}
</style>
</head>
<body style="margin:0;padding:0">

<a href="/Chemist_logout.jsp"><button style="Position:absolute;top:20px;left:88%;background-color:rgb(173,0,0);height:30px;width:8%;border:none;color:white;cursor:pointer">Log Out</button></a>
<div onclick="ActivateOrdersScreen()" class="Tabs" style="left:7%;cursor:pointer"><h2 style="padding:5px;line-height:5px;text-align:center">Orders</h2></div>
<div onclick="ActivateRegColScreen()" class="Tabs" style="left:23%;cursor:pointer"><h2 style="padding:5px;line-height:5px;text-align:center">Register Timings</h2></div>
<div class="Tabs" style="left:39%;width:30%"><input type="Text" name="OrderID" placeholder="   Order ID (For datewise enter 'yymmdd')" style="position:relative;height:25px;width:70%;left:6%;top:14%;font-size:14px"></input><button onclick="ActivateOrderSearchScreen()" style="position:relative;height:22px;width:15%;left:10%;top:14%">Search</button></div>
<iframe id="MainFrame" style="position:absolute;top:80px;left:6%;width:88%;height:800px;border:5px solid black;border-radius:15px" src="MobileLabOrders.jsp"></iframe>


</body>
</html>