<%-- 
    Document   : getOrder
    Created on : Nov 20, 2013, 4:44:14 PM
    
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page import="java.sql.*" %>
   
<% 
if(session.getAttribute("cid")==null){
	response.sendRedirect("index.html");
}
%>
    
    <%
    String connectionURL;
    
    try { 	
        if (SystemProperty.environment.value() ==
            SystemProperty.Environment.Value.Production) {
          // Load the class that provides the new "jdbc:google:mysql://" prefix.
          Class.forName("com.mysql.jdbc.GoogleDriver");
          connectionURL = "jdbc:google:mysql://healthonthego1503:healthonthego/HOTG?user=root";
        } else {
          // Local MySQL instance to use during development.
      	  Class.forName("com.mysql.jdbc.Driver");
      	connectionURL = "jdbc:mysql://127.0.0.1:3306/Mock2?user=Mock";
        }
      } catch (Exception e) {
        e.printStackTrace();      
        return;
      }
    
        Statement statement = null;
        
        
        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
    %>
    
    <%
        class cData
        {
            String itemid;
            String orderid;
            String userid;
            String order_time;
            String Quanitity;
            String status;
            String up_key;
        }
        
        %>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
    <script type="text/javascript">
 
  /* function ()
    {
    $('#load_me').load('getOrder.jsp').fadeIn("slow");
    }, 10000);*/
    // autorefresh the content of the div after
               //every 10000 milliseconds(10sec)
    </script>
        <script language="javascript" type="text/javascript" src="niceforms.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="niceforms-default.css" />
       <script>
            function update(oid,str)
            {
            var xmlhttp;    
            if (str=="")
            {
              //document.getElementById("txtHint").innerHTML="";
              return;
            }
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
              xmlhttp=new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
              xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
              {
              if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
            	  var resp_from_ucs=xmlhttp.responseText;
            	  window.alert(resp_from_ucs);
                if(resp_from_ucs==='Accepted')
                	{
                	window.alert("Order accepted!! Please note the OrderID:"+oid);
                	location.reload();
                	}
                else if(resp_from_ucs==='Rejected')
            	{
            	window.alert("Order rejected!! Please note the OrderID:"+oid);
            	location.reload();
            	}
                else
		  		{
		  		window.alert("Could not accept the order. Please refresh your page and try again.");
		  		location.reload();
		  		}
                }
              }
            xmlhttp.open("GET","/update_chemist_screen?orderid="+oid+"&status="+str,true);
            xmlhttp.send();
            }
        </script>
        
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="600">
        <title>Orders</title>
    </head>
    <body>
        <div id="load_me">
        <div id="container">
            
        
        <%
        java.sql.Connection connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            String sql="select Item_Id,User_Id,Order_Id,Order_Time,Quantity,Status,Upload_Key from User_Order_Medicine where Chemist_Id like '"+session.getAttribute("cid")+"' and Status like 'OR' order by Order_Id;";
            rs = statement.executeQuery(sql);
            //System.out.println(sql);
            List<cData> l;
            l = new LinkedList<cData>();
           
            cData d=new cData();
            String newd = "NEW";
            
            while(rs.next())
            {  
                String newOrder=rs.getString(3);
                //System.out.println("newOrder:"+newOrder);
                //System.out.println("newd :"+newd);
                if (newd.equals("NEW"))
                {  
                    newd=newOrder;
                    d.userid=rs.getString(2);
                    d.orderid=newd;
                    d.order_time=rs.getString(4);
                    d.Quanitity=rs.getString(5);
                    d.status=rs.getString(6);
                   
                    if(rs.getString(7)!=null)
                    	d.up_key=rs.getString(7);
                    
                    d.itemid=rs.getString(1);
                    
                }
                else if(newd.equals(newOrder))
                {
                    
                   //   if(rs.getString(7)!=null)
                    //		d.up_key=rs.getString(7);
                   
                   if(rs.getString(7)!=null && d.up_key==null)
                	   d.up_key=rs.getString(7);
                   
                   else if(rs.getString(7)!=null && d.up_key!=null)
                	   d.up_key+=","+rs.getString(7);
                   
                    
                    d.itemid+=","+rs.getString(1);
                }
                else if(!newd.equals(newOrder))
                {
                    
                    l.add(d);
                    d=new cData();
                    newd = newOrder;
                    d.userid=rs.getString(2);
                    d.orderid=newd;
                    d.order_time=rs.getString(4);
                    d.Quanitity=rs.getString(5);
                    d.status=rs.getString(6);
                   
                    
                    if(rs.getString(7)!=null)
                		d.up_key=rs.getString(7);
                    
                    d.itemid=rs.getString(1);
                }
                if(rs.isLast())
                {
                	//System.out.println(d.up_key);
                    l.add(d);
                }
            }
            rs.close();
            //out.println(l.size());
            cData d1=new cData();
            for(int i=0;i<l.size();i++)
            { 
                d1=l.get(i);
                out.println("<form action=\"\" name=\"\"><fieldset><legend>Order ID : "+d1.orderid+" </legend>");
                String sql2="select First_Name,Last_Name,Address,City,Pincode,Mobile_phone_number from User where User_Id like '"+d1.userid+"';";
                rs1 = statement.executeQuery(sql2);
                
                if(rs1.next())
                {
                    out.println("<h4>User Name : <font color=\"blue\">"+rs1.getString(1)+" "+rs1.getString(2)+"</font></h4>");
                    out.println("<h4>Address : <font color=\"blue\">"+rs1.getString(3)+", "+rs1.getString(4)+" - "+rs1.getString(5)+" (tel: "+rs1.getString(6)+") </font></h4>");
                    
                    if(d1.up_key!=null){
                    	//System.out.print(d1.up_key);
                    	String allKeys[]=d1.up_key.split(",");
                    	
                    	for(int j=0;j<allKeys.length;j++)
                        {
                    	out.println("<a href=\"http://www.healthonthego.in/serve?blob-key="+allKeys[j]+"\" target=\"_blank\">View Prescription "+(j+1)+"</a>");
                        }
                    
                    }
                }
                
                String allitems[]=d1.itemid.split(",");
                out.println("<table><tr><th>Brand Name</th><th>Manufacturer</th><th>Strength</th><th>Form</th><th>Quantity</th><th>Need</th><th>MRP</th><th>Total</th></tr>");
                double sum=0.0;
                for(int j=0;j<allitems.length;j++)
                {
                    String sql3="select Brand_Name,Manufacturer,Strength,Form,Quantity,MRP from Central_Inventory where Drug_Code like '"+allitems[j]+"';";
                    rs2 = statement.executeQuery(sql3);
                    if(rs2.next())
                    {
                        String mrp=rs2.getString(6);
                        //System.out.println(mrp);
                        sum+=(Double.parseDouble(d1.Quanitity)*Double.parseDouble(mrp));
                        out.println("<tr><td>"+rs2.getString(1)+"</td><td>"+rs2.getString(2)+"</td><td>"+rs2.getString(3)+"</td><td>"+rs2.getString(4)+"</td><td>"+rs2.getString(5)+"</td><td>"+d1.Quanitity+"</td><td>"+mrp+"</td><td>"+(Double.parseDouble(d1.Quanitity)*Double.parseDouble(mrp))+"</td></tr>");
                    }
                    rs2.close();
                }
               
                out.println("</table><p align=\"RIGHT\"><font color=\"blue\"><b>Total : "+sum+"</b></font></p><input type=\"button\" value=\"Accept\" name=\"Accept\" onclick=\"update('"+d1.orderid+"','Accept');\" /><input type=\"button\" value=\"Reject\" name=\"Reject\" onclick=\"update('"+d1.orderid+"','Reject');\"/><p align=\"RIGHT\">");
                if(d1.status.equals("oj"))
                {
                    out.println("<b><font color=\"red\">Rejected</font></b></p>");
                }
                else if(d1.status.equals("A"))
                {
                    out.println("<b><font color=\"green\">Accepted</font></b></p>");
                }
                out.println("</fieldset>");
              
            } 
            
          if(rs1!=null)
            rs1.close();
            
        %>
        
        
        <!-- </fieldset>-->
        </div>
        </div>
    </body>
</html>
