<%-- 
    Document   : ChemistHome
    Created on : Nov 20, 2013, 4:25:45 PM
    Author     : NIKIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("cid")==null){
	
	response.sendRedirect("index.html");
}

%>

<!DOCTYPE html>
<html>
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link id="bs-css" href="CSS/bootstrap-classic.css" rel="stylesheet">
        <script>
        function ActivateOrderSearchScreen()
		{
			var OrderID=document.getElementsByName("OrderID")[0].value;
	
			document.getElementById("MainFrame").src="searchOrderChemist.jsp?OrderID="+OrderID+"";	
	}
        function ActivateGetOrderSearchScreen()
		{
			var OrderID=document.getElementsByName("OrderID")[0].value;
	
			document.getElementById("MainFrame").src="getOrder.jsp";	
	}

</script>
        <style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
        <link href="CSS/jquery-ui-1.8.21.custom.css" rel="stylesheet">
        <link href="CSS/bootstrap-responsive.css" rel="stylesheet">
        <link href="CSS/jquery-ui-1.8.21.custom.css" rel="stylesheet">
        <link href="CSS/charisma-app.css" rel="stylesheet">
        <title>Chemist Home</title>
    </head>
    <body>
        <div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.html"> <img alt="HOTG Logo" src="/Pictures/HOTGCloud.png"></a>
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="/Chemist_logout.jsp">
						<i class="icon-user"></i><span class="hidden-phone">Log out</span>
						<span class="caret"></span>
					</a>
					
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="#">Search Order</a></li>
						<li>
							<form class="navbar-search pull-left" name="search_oid" method="get" action="searchOrder">
								<input placeholder="Enter Order ID" class="search-query span2" name="OrderID" type="text" id="search" onkeyup="ActivateOrderSearchScreen()">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
        
        <div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li class="active" style="margin-left: -2px;"><a href="#" class="ajax-link"><i class="icon-home"></i><span class="hidden-tablet" onclick="ActivateGetOrderSearchScreen()">View Orders</span></a></li>
						<li style="margin-left: -2px;"><a class="ajax-link" href="ui.html"><i class="icon-eye-open"></i><span class="hidden-tablet"> UI Features</span></a></li>
						
					</ul>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
                        <iframe id="MainFrame" src="getOrder.jsp" width="1000" height="1200" seamless></iframe>
                </div>	
		
	</div>
    </body>
</html>
