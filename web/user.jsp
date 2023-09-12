<%@page import="bank.Mail"%>
<%@page import="bank.RC5"%>
<%@page import="bank.SHAExample"%>
<%@page import="bank.uniquePassword"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="include/dbconnect.jsp" %>
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
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
.style2 {color: #CCCCCC}
.style4 {color: #FFFF00}
.style5 {color: #FFFFFF}
</style>
</head>
<body>
<%
String msg="";
String trans=(String)session.getAttribute("trans");


try
{
String btn=request.getParameter("btn");
           
    String key="0afmb54";
    String ency="";
    String ency1="";

	if(btn.equals("Submit"))
	{
		String uname=request.getParameter("name");
				String pass=request.getParameter("pass");
         
       // String negative="0123456789abcdef";
       // String neg="";
        long code=uniquePassword.Code();
        String securePass=SHAExample.get_SHA_256_SecurePassword(pass);
        
        for (char ch : securePass.toCharArray()) 
        {
        if (ch >= 'a' && ch <= 'f')
        { // <-- validate input
            ency += 1 + ch - 'a' ;      // <-- 'A' - 'A' == 0, 'B' - 'A' == 1, etc.
        }
        }
         ency1+=ency.replaceAll("-", "");
         System.out.println(ency1);
      
      
        byte[] encrypted = RC5.encrypt(securePass,key);
        String enc=String.valueOf(encrypted);
        //ency=securePass;
        System.out.println(encrypted);
        String qry="select * from user_reg where username='"+uname+"' && pass='"+securePass+"'";
        String qry1="select * from user_reg where username='"+uname+"'";
        String email;
		ResultSet rs=stmt.executeQuery(qry);
                ResultSet rs1=stmt1.executeQuery(qry1);
                if(rs1.next())
                        {
                    
                
                 email=rs1.getString(4);
                  System.out.println("email");
			if(rs.next())
			{
                           
                            session.setAttribute("name",uname);
                            response.sendRedirect("user_ver2.jsp");
			}
			else
			{ 
                           
                          
%>

<script language="javascript">
    alert("user name/ pass  Rong!");
</script>
<% email=rs1.getString("email");
                         Mail.SendMail(email, "Alert Message..", "Password Attempt failure :  "+uname, "");   
                        }
                        }
                        rs.close();
        }	

}
catch(Exception e)
{

}


%>
<div class="main">
  <div class="header">
    <div class="block_header">
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
  
            <form id="form1" name="form1" method="post" action="">
              <table width="100%" border="0" align="center">
                <tr>
                  <td width="49%" height="87">&nbsp;</td>
                  <td width="51%" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="3"><div align="center" class="style1">
                    <h3>USER LOGIN </h3>
                  </div></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>USER NAME </h3>
                  </div></td>
                  <td><label></label></td>
                  <td><input name="name" type="text" id="name" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>PASSWORD</h3>
                  </div></td>
                  <td><label></label></td>
                  <td><input name="pass" type="password" id="pass" /></td>
                </tr>
                <tr>
                  <td height="34">&nbsp;</td>
                  <td colspan="2"><span class="style4">
                    <label>
                      <input name="btn" type="submit" id="btn" value="Submit" />
                      </label>
                  </span><label><a href="user_reg.jsp" class="style5">sigup</a></label>
                  <span class="style4">
                  </span></td>
                </tr>
              </table>
            </form>
         
      
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
        <p class="footer_logo"><i style="color:#FC0">Secure </i><i style="color:#FFF">Online banking</i></p>
      </div>
    </div>
    <p class="clr"></p>
  </div>
</div>
</html>