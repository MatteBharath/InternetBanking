<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*, java.util.List, java.io.File, java.util.Iterator"%>
<%@ page import="org.apache.commons.io.*" %>
<%@ include file="include/dbconnect.jsp" %>
<%
String uname=(String)session.getAttribute("uname");

		session.setAttribute("uname",uname);


 java.util.Calendar calendar = java.util.Calendar.getInstance();

             String day=String.valueOf(calendar.get(java.util.Calendar.DATE));
             String month=String.valueOf(calendar.get(java.util.Calendar.MONTH)+1);
             String year=String.valueOf(calendar.get(java.util.Calendar.YEAR));
			 
			String rdate=day+"-"+month+"-"+year; 
			out.print(rdate);
%>


<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Swis721_Cn_BT_400.font.js"></script>
<script type="text/javascript" src="js/Swis721_Cn_BT_700.font.js"></script>
<script type="text/javascript" src="js/tabs.js"></script>


</head>

</head>

<body id="page2">
<form action="" method="post" name="form1" id="form1" enctype="multipart/form-data">

			  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                <tr>
                  <th align="left" class="hd" scope="col"></th>
                </tr>
                <tr>
                  <th align="left" class="sd" scope="col"></th>
                </tr>
                <tr>
                  <th scope="col">	
		    <h3 align="center">&nbsp;</h3>
		    <h3 align="center">Upload Files </h3>
		    <table width="380" height="170" border="0" align="center" cellpadding="5" cellspacing="0" class="bg2">
              <tr>
                <td align="left">Content</td>
                <td align="left"><input type="text" name="content2" /></td>
              </tr>
              <tr>
                <td align="left">Select File </td>
                <td align="left"><input type="file" name="file" /></td>
              </tr>
              <tr>
                <td align="left">&nbsp;</td>
                <td align="left"><input type="submit" name="btn" value="Upload" /></td>
              </tr>
            </table>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		    <p>&nbsp;</p>
		  </th>
                </tr>
                <tr>
                  <th class="fd" scope="col">
				  <a href="logout.jsp">Logout</a></th>
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
                request.getRequestDispatcher("user_file_up.jsp").forward(request, response);
                return;
            }

           
            DiskFileUpload upload = new DiskFileUpload();

            List items = upload.parseRequest(request);

        
            Iterator itr = items.iterator();

            while (itr.hasNext()) {

                FileItem item = (FileItem) itr.next();

                if (item.isFormField()) {

                 
                    String fieldName = item.getFieldName();


                    if (fieldName.equals("content2")) {
                        fileContent = item.getString();
                    }
					
                 
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


                        
                    //    ResultSet rs2=stmt2.executeQuery("select * from user_reg where username='"+uname+"'");
                      //  rs2.next();
                   //     double t_space=rs2.getDouble("tot_space");
                   //     double u_space=rs2.getDouble("used_space");
                   ///     double f_space=t_space-u_space;
                        
                        //if(f_space>fs1)
                        //{
                   File savedFile = new File(getServletContext().getRealPath("/") +"upload/", fullFile.getName());
                // File savedFile = new File("D:/JSP/image_sharing/web/upload/", fullFile.getName());

                    item.write(savedFile);
                    fileName=fullFile.getName();
                    fileSize=""+savedFile.length();
                    
                 
                    ResultSet ns=stmt.executeQuery("select max(id) as maxid from user_files");
                    ns.next();
                    int id1=ns.getInt("maxid");
                    int id2=id1+1;

                    String qq="insert into user_files(id,uname,file_type,file_size,file_content,upload_file,rdate,accept,status,report,	view,command,download) values("+id2+",'"+uname+"','"+ftype+"','"+fileSize+"','"+fileContent+"','"+fileName+"','"+rdate+"','0','0','0','0','0','0')";
                    stmt.executeUpdate(qq);
					
				//	stmt.executeUpdate("update user_reg set used_space=used_space+"+fs1+" where username='"+uname+"'");
	session.setAttribute("id",id2);
        session.setAttribute("fsize",fileSize);
        session.setAttribute("fname",fileName);
//out.print();

                    response.sendRedirect("file_limit.jsp");
                   // }
                   // else
                
                   
                }
            }

	


	
	
	
	
	

}
catch(Exception e)
{
   // out.print(e.getMessage());
}
%>  
</form>
</body>
</html>