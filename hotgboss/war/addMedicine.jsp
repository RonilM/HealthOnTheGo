<!DOCTYPE html>

<%@ page import="com.google.appengine.api.utils.SystemProperty" %>
<html lang="en">
<head>
	
	<meta charset="utf-8">
	<title>Add Medicine</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Nikit Faria">

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
        
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<%@ page import="java.sql.*" %>
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
      	connectionURL = "jdbc:mysql://localhost:3306/mock2?user=mock";
        }
      } catch (Exception e) {
        e.printStackTrace();      
        return;
      }
    
        Statement statement = null;  
        ResultSet rs = null;
        
    %>
	
</head>

<body>
		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.jsp"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>HOTG Cloud</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> admin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="#">Visit Site</a></li>
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
		<div class="container-fluid">
		<div class="row-fluid">
				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="Home.jsp"><i class="icon-home"></i><span class="hidden-tablet"> Dashboard</span></a></li>
						<li><a class="ajax-link" href="addStreet.jsp"><i class="icon-plus"></i><span class="hidden-tablet">Add Street</span></a></li>
						<li class="nav-header hidden-tablet">Mobile Labs</li>
						<li><a class="ajax-link" href="addLab.jsp"><i class="icon-tint"></i><span class="hidden-tablet">Add Lab</span></a></li>
						<li><a class="ajax-link" href="addCollector.jsp"><i class="icon-user"></i><span class="hidden-tablet">Add Collector</span></a></li>
						<li><a class="ajax-link" href="addTest.jsp"><i class="icon-pencil"></i><span class="hidden-tablet">Add Test</span></a></li>
                                                <li><a class="ajax-link" href="monitorLab.jsp"><i class="icon-pencil"></i><span class="hidden-tablet">Monitor Lab</span></a></li>
						<li class="nav-header hidden-tablet">Chemist</li>
						<li><a class="ajax-link" href="addChemist.jsp"><i class="icon-plus"></i><span class="hidden-tablet">Add Chemist</span></a></li>
						<li><a class="ajax-link" href="addMedicine.jsp"><i class="icon-plus"></i><span class="hidden-tablet">Add Medicine</span></a></li>
						<li><a class="ajax-link" href="excludeMedicine.jsp"><i class="icon-minus"></i><span class="hidden-tablet">Exclude Medicine</span></a></li>
						<li><a class="ajax-link" href="includeMedicine.jsp"><i class="icon-plus"></i><span class="hidden-tablet">Include Medicine</span></a></li>
                                                <li><a class="ajax-link" href="editMedicine.jsp"><i class="icon-plus"></i><span class="hidden-tablet">Edit Medicine</span></a></li>
                                                <li><a class="ajax-link" href="monitorChemist.jsp"><i class="icon-plus"></i><span class="hidden-tablet">Monitor Chemist</span></a></li>
                                        </ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div><!--/.well -->
			</div><!--/span-->
			<!-- left menu ends -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10" style="display:block;">
			<!-- content starts -->
			
<div>
				<ul class="breadcrumb">
					<li>
						<a href="Home.jsp">Home</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="addMedicine.jsp">Add Medicine</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable ui-sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title="">
						<h2><i class="icon-edit"></i>Add Medicine</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal" name="medicine" method="post" action="/insertMedicine">
							<fieldset>
							  
                                                            <div class="control-group">
								<label class="control-label" for="prependedInput">Medicine ID : </label>
								<div class="controls">
								  <div class="input-prepend">
									<span class="add-on">HG</span>
                                                                        <input id="prependedInput" size="16" type="text" name="drug_code">
								  </div>
								</div>
							  </div>
                                                            
                                                            <div class="control-group">
								<label class="control-label" for="focusedInput">Brand Name : </label>
								<div class="controls">
								  <input name="brand_name" class="input-xlarge focused" id="focusedInput" type="text" value="">
                                                                </div>
                                                                </div>
                                                            
                                                            <div class="control-group">
							  <label class="control-label" for="typeahead">Manufacturer</label>
							  <div class="controls">
                                                              <%
                                                               // java.sql.Connection connection = DriverManager.getConnection(connectionURL,"root","root");
                                                                java.sql.Connection connection = DriverManager.getConnection(connectionURL);
                                                                statement = connection.createStatement();
                                                                out.print("<input name=\"manufacturer\" type=\"text\" class=\"span6 typeahead\" size=\"16\" id=\"typeahead\"  data-provide=\"typeahead\" data-items=\"5\" data-source=\'[");

								String sql="select distinct Manufacturer from Central_Inventory LIMIT 600;";
								rs = statement.executeQuery(sql);
                                                                while(rs.next())
                                                                {
                                                                       String tmp=rs.getString(1);
                                                                       if(rs.isLast())
                                                                        out.print("\""+tmp+"\"");
                                                                       else
                                                                          out.print("\""+tmp+"\","); 
                                                                }
                                                                out.print("]\'>");
                                                                
                                                               rs.close();
                                                              %>                                                       
							 </div>
							</div>
                                                            
                                                            <div class="control-group">
							  <label class="control-label" for="typeahead">Generic Name : </label>
							  <div class="controls">
                                                              <%
                                                                
                                                                out.print("<input name=\"generic_name\" type=\"text\" class=\"span6 typeahead\" size=\"16\" id=\"typeahead\"  data-provide=\"typeahead\" data-items=\"5\" data-source=\'[");

								sql="select distinct Generic_Name from Central_Inventory LIMIT 600;";
								rs = statement.executeQuery(sql);
                                                                while(rs.next())
                                                                {
                                                                       String tmp=rs.getString(1);
                                                                       if(rs.isLast())
                                                                        out.print("\""+tmp+"\"");
                                                                       else
                                                                          out.print("\""+tmp+"\","); 
                                                                }
                                                                out.print("]\'>");
                                                              %>                                                       
							 </div>
							</div>
                                                        
                                                            <div class="control-group">
								<label class="control-label" for="focusedInput">Strength : </label>
								<div class="controls">
								  <input name="strength" class="input-xlarge focused" id="focusedInput" type="text" value="">
                                                                </div>
                                                                </div>
                                                            
                                                            <div class="control-group">
								<label class="control-label" for="focusedInput">Form : </label>
								<div class="controls">
								  <%
                                                                
                                                                out.print("<input name=\"form\" type=\"text\" class=\"span6 typeahead\" size=\"16\" id=\"typeahead\"  data-provide=\"typeahead\" data-items=\"5\" data-source=\'[");

								sql="select distinct Form from Central_Inventory LIMIT 200;";
								rs = statement.executeQuery(sql);
                                                                while(rs.next())
                                                                {
                                                                       String tmp=rs.getString(1);
                                                                       if(rs.isLast())
                                                                        out.print("\""+tmp+"\"");
                                                                       else
                                                                          out.print("\""+tmp+"\","); 
                                                                }
                                                                out.print("]\'>");
                                                              %>   
                                                                </div>
                                                                </div>
                                                            
                                                                <div class="control-group">
								<label class="control-label" for="focusedInput">Quantity : </label>
								<div class="controls">
								  <input name="quantity" class="input-xlarge focused" id="focusedInput" type="text" value="">
                                                                </div>
                                                                </div>
                                                                
                                                            <div class="control-group">
								<label class="control-label">Prescription Required:</label>
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="optionsRadios" id="optionsRadios1" value="Yes" checked="">
									YES
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="optionsRadios" id="optionsRadios2" value="No">
									NO
								  </label>
								</div>
							  </div>
                                                                
                                                          <div class="control-group">
								<label class="control-label" for="prependedInput">MRP :</label>
								<div class="controls">
								  <div class="input-prepend">
									<span class="add-on"><img alt="Rs." src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Indian_Rupee_symbol.svg/7px-Indian_Rupee_symbol.svg.png" width="7" height="10" style="vertical-align: baseline" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Indian_Rupee_symbol.svg/11px-Indian_Rupee_symbol.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Indian_Rupee_symbol.svg/14px-Indian_Rupee_symbol.svg.png 2x"></span><input id="prependedInput" size="16" type="text" name="mrp">
								  </div>
								  
								</div>
							  </div>
 
							  <div class="form-actions">
								<button type="submit" class="btn btn-primary">Save changes</button>
                                                                <button class="btn" type="reset">Cancel</button>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
			
					<!-- content ends -->
			</div><!--/#content.span10-->
				</div><!--/fluid-row-->
				
		<hr>

		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">�</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

		<footer>
			<p class="pull-left">&copy; <a href="http://usman.it" target="_blank">HOTG Cloud</a> 2012</p>
			<p class="pull-right">Powered by: <a href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
		</footer>
		
	</div><!--/.fluid-container-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	
		
</body>
</html>
