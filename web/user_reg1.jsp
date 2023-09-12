<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*, java.util.List, java.io.File, java.util.Iterator"%>
<%@ page import="org.apache.commons.io.*" %>
<%@ include file="include/dbconnect.jsp" %>
<%
String uid=(String)session.getAttribute("uid");

		 
 %>


<!DOCTYPE html>
<html lang="en">
<head>
<title><%@ include file="title.jsp" %></title>
<meta charset="utf-8">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">

<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script src="js/jquery-1.11.0.min.js"></script>
<%@ include file="logo.jsp" %>

<script type="text/javascript" src="js/jquery-1.6.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Swis721_Cn_BT_400.font.js"></script>
<script type="text/javascript" src="js/Swis721_Cn_BT_700.font.js"></script>
<script type="text/javascript" src="js/tabs.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mr Hotel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Hind:400,300' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Aladin' rel='stylesheet' type='text/css'>
<!--google fonts-->
<!-- animated-css -->
		<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
		<script src="js/wow.min.js"></script>
		<script>
		 new WOW().init();
		</script>
<!-- animated-css -->
<script src="js/bootstrap.min.js"></script>
 
<style type="text/css">
<!--
.button1 {  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 460px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}
.style1 {	color: #F4511E;
	font-weight: bold;
}
.txtstl1 {width:80%;
height:20px;
padding:5px;
padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
	    background-color: #f1f1f1;
}
-->
</style>

</head>

<body id="page2">
<div class="top-header">
	<div class="container">
		<div class="top-header-main">
			<div class="col-md-4 top-social wow bounceInLeft" data-wow-delay="0.3s">
			    <ul>
			    	<li><h5>Follow Us :</h5></li>
			    	<li><a href="#"><span class="fb"> </span></a></li>
			    	<li><a href="#"><span class="tw"> </span></a></li>
			    	<li><a href="#"><span class="in"> </span></a></li>
			    	<li><a href="#"><span class="gmail"> </span></a></li>
			    </ul>
			</div>
			<div class="col-md-8 header-address wow bounceInRight" data-wow-delay="0.3s">
				<ul>					
					<li><span class="phone"> </span> <h6>(220) 280-31589</h6></li>
					<li><span class="email"> </span><h6><a href="mailto:info@example.com">Youremail@gmail.com</a></h6></li>
				</ul>
			</div>
		  <div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--header-top end here-->
<!--header start here-->
	<!-- NAVBAR
		================================================== -->
<div class="header">
	<div class="fixed-header">	

		    <div class="navbar-wrapper">
		      <div class="container">
		        <nav class="navbar navbar-inverse navbar-static-top">
		             <div class="navbar-header">
			              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			                <span class="sr-only">Toggle navigation</span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			              </button>
			              <div class="logo wow slideInLeft" data-wow-delay="0.3s">
			                    <a class="navbar-brand" href="index.html"><img src="images/logo3.png" /></a>			              </div>
		          </div>
		            <div id="navbar" class="navbar-collapse collapse">
		            <nav class="cl-effect-16" id="cl-effect-16">
		              <ul class="nav navbar-nav">
		                                <li><a  href="index.jsp" data-hover="Home">Home</a></li>
 						<li><a class="active" href="user.jsp" data-hover="User">User</a></li>
		              </ul>
		            </nav>

		            </div>
		            <div class="clearfix"> </div>
                </nav>
	          </div>
		           <div class="clearfix"> </div>
		    </div>
  </div>
</div>
<!--header end here-->
<!--about start here-->
<div class="about">
	<div class="container">
		<div class="about-main">
			<div class="about-top">
				<h1>User Registration </h1>
			</div>
		  <div class="about-bottom">
				<div class="col-md-5 about-left wow bounceInLeft" data-wow-delay="0.3s">
				  <div class="zoom">
				    <p><img src="images/staff.png" alt="" width="366" height="70%"    class="img-responsive"></p>
				    </div>
				</div>
			<div class="col-md-7 about-right wow bounceInRight" data-wow-delay="0.3s">
			  <div class="about-list"><div class="clearfix">
<form action="" method="post" name="form1" id="form1" enctype="multipart/form-data">

			  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                <tr>
                  <th align="left" class="hd" scope="col"></th>
                </tr>
                <tr>
                  <th align="left" class="sd" scope="col"></th>
                </tr>
                <tr>
                  <th scope="col"><h3 align="center">&nbsp;</h3>
                    <h3 align="center">&nbsp;</h3>
                    <h3 align="center"><div class="text_style1">Upload Files</div> </h3>
                    <table width="521" height="170" border="0" align="center" cellpadding="5" cellspacing="0" class="bg2">
              <tr>
                <td width="113" align="left">Select File </td>
                <td width="388" align="left"><input type="file" name="file" /></td>
              </tr>
              <tr>
                <td align="left">&nbsp;</td>
                <td align="left"><input name="btn" type="submit" class="btn-arun" value="Upload" /></td>
              </tr>
            </table>
		    </th>
                </tr>
                <tr>
                  <th class="fd" scope="col">&nbsp;</th>
                </tr>
              </table>

<%
try
        {
String fileContent ="";
String fileName="";
String fileSize="";
String ftype="";

	
            String ImagePath = "";
            boolean isMultipart = FileUpload.isMultipartContent(request);

           
            if (!isMultipart) {
                request.getRequestDispatcher("user_reg1.jsp").forward(request, response);
                return;
            }

           
            DiskFileUpload upload = new DiskFileUpload();

            List items = upload.parseRequest(request);

        
            Iterator itr = items.iterator();

            while (itr.hasNext()) {

                FileItem item = (FileItem) itr.next();

                if (item.isFormField()) {

                 
                    String fieldName = item.getFieldName();


                    
					
                 
                } else {

                  
                   File f = new File(config.getServletContext().getRealPath("/") +"upload/");
                  //  File f = new File("D:/JSP/image_sharing/web/upload/");

                    if (f.exists() == false) {
                        f.mkdir();
                    }
                    File fullFile = new File(item.getName());
			File  fileType=new File(item.getContentType());
                  	ftype=""+fileType;
			double filesize=item.getSize();
                        double fs1=filesize/(1024*1024);
 
                   File savedFile = new File(getServletContext().getRealPath("/") +"upload/", fullFile.getName());
 
                    item.write(savedFile);
                    fileName=fullFile.getName();
                    fileSize=""+savedFile.length();
                                     
                   	stmt.executeUpdate("update user_reg set report='"+fullFile.getName()+"' where id='"+uid+"'");
  
                    response.sendRedirect("user.jsp");
                    
                }
            }

	


	
	
	
	
	

}
catch(Exception e)
{
   //out.print(e.getMessage());
}
%>  
</form>
</body></div>
		      </div>
	        </div>
		  </div>
		</div>
	</div>
</div>
<!--about end here-->
<!--about advantages start here-->
<!--about advantages end here-->
<!-- team start here-->
<!--team end here-->
<!--footer start here-->
<div class="footer">
	<div class="container">
		<div class="footer-main">
		  <div class="clearfix"> </div>
	  </div>
	</div>
</div>
<!--footer end here-->
<!--copy rights start here-->
<div class="copy-right">
	<div class="container">
		 <div class="copy-rights-main wow zoomIn" data-wow-delay="0.3s">
    	    <p>� 2016 Mr Hotel. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
    	 </div>
    </div>
</div>
</body>
</html>
