<%@page import="bank.MD5"%>
<%@page import="bank.uniquePassword"%>
<%@page import="bank.SHAExample"%>
<%@page import="bank.RC5"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
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
 <script language="javascript">
            function validate()
            {
              //  alert("");
                if (document.form1.name.value == "")
                {
                    alert("Enter the Name");
                    document.form1.name.focus();
                    return false;
                }
                if (document.form1.fname.value == "")
                {
                    alert("Enter the Father name");
                    document.form1.fname.focus();
                    return false;
                }
                if (document.form1.cont.value == "")
                {
                    alert("Enter the Contact");
                    document.form1.cont.focus();
                    return false;
                }
                if (document.form1.email.value == "")
                {
                    alert("Enter the Email-Id");
                    document.form1.email.focus();
                    return false;
                }
  if (document.form1.address.value == "")
                {
                    alert("Enter the Address");
                    document.form1.address.focus();
                    return false;
                }
                if (document.form1.uname.value == "")
                {
                    alert("Enter the Username");
                    document.form1.uname.focus();
                    return false;
                }
                if (document.form1.pass.value == "")
                {
                    alert("Enter the Password");
                    document.form1.pass.focus();
                    return false;
                }
                if (document.form1.pass.value != document.form1.cpass.value)
                {
                    alert("Both password are not equals!");
                    document.form1.cpass.select();
                    return false;
                }
                //finishMD();
                return true;
            }
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
</style>
</head>
<body>
 <%   
      try {
                String btn = request.getParameter("btn");
              
    String key="0afmb54";
    String ency="";
    String ency1="";
    if (btn.equals("Submit")) 
    {
        String pass = request.getParameter("pass");
       // String negative="0123456789abcdef";
      //  String neg="";
        long code=uniquePassword.Code();
        String securePass=SHAExample.get_SHA_256_SecurePassword(pass);
        System.out.println("sha256"+securePass);
        for (char ch : securePass.toCharArray()) {
        if (ch >= 'a' && ch <= 'f' ) { // <-- validate input
            ency += 1 + ch - 'a';      // <-- 'A' - 'A' == 0, 'B' - 'A' == 1, etc.
        }
       
        }
        ency1+=ency.replaceAll("-", "");
         System.out.println(ency1);
        
      
      
        byte[] encrypted = RC5.encrypt(securePass,key);
//         String encrypted=MD5.getMd5(ency1);
       
        //ency=securePass;
        System.out.println(encrypted);
                
                   

                    

                    String name = request.getParameter("name");
                                 String fname = request.getParameter("fname");

                  
                    String email = request.getParameter("email");
                    String contact = request.getParameter("cont");
                    String address = request.getParameter("address");

                    String uname = request.getParameter("uname");
       String cpass = request.getParameter("cpass");
java.util.Calendar calendar = java.util.Calendar.getInstance();

                    String day = String.valueOf(calendar.get(java.util.Calendar.DATE));
                    String month = String.valueOf(calendar.get(java.util.Calendar.MONTH) + 1);
                    String year = String.valueOf(calendar.get(java.util.Calendar.YEAR));

                    String cdate = day + "-" + month + "-" + year;
                   if(pass.equals(cpass))
				   {
				    String qry = "select max(id) as maxid from user_reg";
                    ResultSet rs = stmt.executeQuery(qry);
                    int id1 = 0;
                    if (rs.next()) {
                        id1 = rs.getInt("maxid");
                    }
                    int id2 = id1 + 1;
         
                        String ins = "insert into user_reg values('"+id2+"','" + name + "','"+fname+"','"+contact+"','" + email + "','" + address + "','" + uname + "','" + securePass + "','" + encrypted + "','0','0','" + cdate + "','0','0','0','0','0','0')";
                        //out.print(ins);
                        int n = stmt.executeUpdate(ins);
                         Random rand = new Random();
int r = rand.nextInt(10) + 1000;
                    String uid=""+month+day+r;
                          String insg = "insert into amount values('"+id2+"','"+uid+"','" + uname + "','"+securePass+"','" + encrypted + "','0','" + cdate + "','0','0','0')";
                        //out.print(ins);
                         int ng = stmt5.executeUpdate(insg);
                      		session.setAttribute("name",name);
                      		session.setAttribute("acc",uid);
                                
 //response.sendRedirect("user_reg2.jsp");
                 }  
                   else
                   {
                       %>
						<script language="javascript">
		alert("Failed");
		</script>
						
						<%		                               
                   }

                }
//  response.sendRedirect("user.jsp");
  response.sendRedirect("user_reg2.jsp");

            } 
    catch (Exception e) {
              out.print(e.getMessage());
            }
        %>
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
  
            <form id="form1" name="form1" method="post" action="">
              <table width="100%" border="0" align="center">
                <tr>
                  <td width="539">&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="3"><div align="center" class="style1">
                    <h3>USER REGISTRATION </h3>
                  </div></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3> Name </h3>
                  </div></td>
                  <td width="10"><label></label></td>
                  <td width="549"><input name="name" type="text" id="name" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3> Father Name </h3>
                  </div></td>
                  <td>&nbsp;</td>
                  <td><input name="fname" type="text" id="fname" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>Contact</h3>
                  </div></td>
                  <td><label></label></td>
                  <td><input name="cont" type="text" id="cont" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>E-mail</h3>
                  </div></td>
                  <td>&nbsp;</td>
                  <td><input name="email" type="text" id="email" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>Address</h3>
                  </div></td>
                  <td>&nbsp;</td>
                  <td><input name="address" type="text" id="address" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>User name </h3>
                  </div></td>
                  <td>&nbsp;</td>
                  <td><input name="uname" type="text" id="uname" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>Password</h3>
                  </div></td>
                  <td>&nbsp;</td>
                  <td><input name="pass" type="password" id="pass" /></td>
                </tr>
                <tr>
                  <td height="35"><div align="right" class="style2">
                    <h3>C-Password</h3>
                  </div></td>
                  <td>&nbsp;</td>
                  <td><input name="cpass" type="password" id="cpass" /></td>
                </tr>
                <tr>
                  <td height="21">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="35">&nbsp;</td>
                  <td colspan="2"><input name="btn" type="submit" id="btn" value="Submit" onclick="return validate()" /></td>
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
        <p>Copyright Â© Your Sitename || <a href="http://cds.com.co.in/">CDS</a> || All Rights Reserved<br />
          <a href="index.html">Home</a> | <a href="contact.html">Contact</a> | <a href="blog.html">RSS</a></p>
      </div>
    </div>
    <p class="clr"></p>
  </div>
</div>
</html>