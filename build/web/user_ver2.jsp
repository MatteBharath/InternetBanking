<%@page import="java.util.Random"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@ page import="org.apache.commons.fileupload.*, java.util.List, java.io.File, java.util.Iterator"%>
<%@ page import="org.apache.commons.io.*" %><%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%@ include file="include/dbconnect.jsp" %>
<%
String name=(String)session.getAttribute("name");

		session.setAttribute("name",name);


 java.util.Calendar calendar = java.util.Calendar.getInstance();

             String day=String.valueOf(calendar.get(java.util.Calendar.DATE));
             String month=String.valueOf(calendar.get(java.util.Calendar.MONTH)+1);
             String year=String.valueOf(calendar.get(java.util.Calendar.YEAR));
			 
			String rdate=day+"-"+month+"-"+year; 
			//out.print(rdate);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easySlider1.5.js"></script>
<script type="text/javascript" charset="utf-8">
// <![CDATA[
$(document).ready(function(){	
	$("#slider").easySlider({
		controlsBefore:	'<p id="controls">',
		controlsAfter:	'</p>',
		auto: true, 
		continuous: true
	});	
});
// ]]>
</script>
 
<style type="text/css">
#slider { margin:0; padding:0; list-style:none; }
#slider ul,
#slider li { margin:0; padding:0; list-style:none; }
/* 
    define width and height of list item (slide)
    entire slider area will adjust according to the parameters provided here
*/
#slider li { width:966px; height:348px; overflow:hidden; }
p#controls { margin:0; position:relative; }
#prevBtn,
#nextBtn { display:block; margin:0; overflow:hidden; width:13px; height:28px; position:absolute; left: -13px; top:-210px; }
#nextBtn { left:966px; }
#prevBtn a { display:block; width:13px; height:28px; background:url(images/l_arrow.gif) no-repeat 0 0; }
#nextBtn a { display:block; width:13px; height:28px; background:url(images/r_arrow.gif) no-repeat 0 0; }
.style3 {
	color: #FFFFFF;
	font-size: 18px;
}
</style>
</head>
<body>

<div class="main">
  <div class="header">
    <div class="block_header">
      <strong> </strong>
      <div class="clr">
        <h1><b style="color:#FC0">Online</b> <b style="color:#FFF">Banking</b></h1>
      </div>
      <div class="menu">
        <ul>
          <li><a href="index.jsp" class="active">Home</a></li>
          <li><a href="user.jsp">user</a></li>
          <li><a href="Admin.jsp">Admin</a></li>
          <li><a href="#about.html">About us</a></li>
          <li><a href="#portfolio.html">Blog</a></li>
          <li><a href="#contact.html">Contact us</a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  
            <table width="887" border="0">
          <tr>
            <td width="136">&nbsp;</td>
            <td width="26"><h4>&nbsp;</h4></td>
            <td width="376"><span class="style8 style3">Welcome</span> 
              <span class="style3">
              <%
			
			out.print(name);
			
			
			%>
            </span></td>
          </tr>
          <tr>
            <td>&nbsp;	</td>
            <td>&nbsp;</td>
           <td><form action="" method="post" enctype="multipart/form-data" name="form1" id="form1">
      <table width="466" height="144" border="0" align="center">
        <tr>
          <td colspan="2"><div align="center" class="style5">
            <h3>INPUT FILE </h3>
          </div></td>
        </tr>
        <tr>
          <td height="37"><span class="style7">Select File </span></td>
          <td><label>
          <input type="file" name="file" />
          </label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><label></label></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><label>
            <input name="Submit" type="submit" class="button" value="Submit" />
          </label></td>
        </tr>
      </table>
        <%
String upfile_name="";

try
{
String fileContent ="";
String fileName="";
String fileSize="";
String ftype="";
	
  	
            String ImagePath = "";
            boolean isMultipart = FileUpload.isMultipartContent(request);

           
            if (!isMultipart) {
                request.getRequestDispatcher("user_ver2.jsp").forward(request, response);
                return;
            }

           
            DiskFileUpload upload = new DiskFileUpload();

            List items = upload.parseRequest(request);

        
           Iterator itr = items.iterator();

            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
             
                
                {

                  
                   File f = new File(config.getServletContext().getRealPath("/") +"upload/");
                
                    if (f.exists() == false) {
                        f.mkdir();
                    }
                    File fullFile = new File(item.getName());
                   // String  tmp=item.getName();
                    
                 
                    upfile_name=""+fullFile;
			File  fileType=new File(item.getContentType());
                  	ftype=""+fileType;
                       
                        
                           double filesize=item.getSize();
                        double fs1=filesize/(1024*1024);
               //   out.print(ftype);

if(ftype.equals("image\\jpeg"))
                        {
                   File savedFile = new File(getServletContext().getRealPath("/") +"upload/", fullFile.getName());
                  
                    item.write(savedFile);
                    
                    String f_name=""+fullFile.getName();
                    String f_size=""+fs1;
                    BufferedImage bimg = ImageIO.read(new File(""+savedFile));
                    int width  = bimg.getWidth();
                    String wid=""+width;
                    int height = bimg.getHeight();
                    String h1=""+height;
                   // String f_name1="";
                    String f_size1="";
                    String width1  ="";
                    String height1 ="";
             
                    
                    
                    String qry="select * from user_reg where username='"+name+"'";
	//	out.print(qry);
		ResultSet rs1=stmt1.executeQuery(qry);
			if(rs1.next())
			{
                            f_size1=rs1.getString("image_size");
                            width1=rs1.getString("image_width");
                            height1=rs1.getString("image_height");
                            
			}
                        if((f_size.equals(f_size1))&&(width1.equals(wid))&&(height1.equals(h1)))
                        {
                            		session.setAttribute("name",name);

                           response.sendRedirect("user_home.jsp");     
                        }
                        else
                        {
                         %>
						<script language="javascript">
		alert("Failed");
		</script>
						
						<%   
                        }
                    
                    
                    
                    
                  
                 //  response.sendRedirect("user_home.jsp");  
                        
                        }
else
{
     %>
						<script language="javascript">
		alert("Format Failed");
		</script>
						
						<%
}
                }
            }                   
     
}
            catch(Exception e)
                    {
                    
                    }

%> 

    </form></td>
          </tr>
      </table>
         
      
  <div class="clr"></div>
  <div class="body">
    <div class="topi">
      <div class="clr"></div>
    </div>
    <div class="body_resize">
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="footer">
    <div class="resize">
      <div>
        <p class="footer_logo"><i style="color:#FC0">Smart </i><i style="color:#FFF">WebDesign</i></p>
        <p>Copyright Â© Your Sitename || <a href="http://cds.com.co.in/">CDS</a> || All Rights Reserved<br />
          <a href="index.html">Home</a> | <a href="contact.html">Contact</a> | <a href="blog.html">RSS</a></p>
      </div>
    </div>
    <p class="clr"></p>
  </div>
</div>
</html>
