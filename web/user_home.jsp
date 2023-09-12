<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@ include file="include/dbconnect.jsp" %>

<%
String name=(String)session.getAttribute("name");
session.setAttribute("name",name);
//String pass=(String)session.getAttribute("pass");
String my_acc="";
//session.setAttribute("pass",pass);

//out.print(name+""+pass);
String qry="select * from amount where name='"+name+"'  ";
		ResultSet rs=stmt.executeQuery(qry);
			if(rs.next())
			{
                            
                           my_acc= rs.getString("accnumber");
                        	 	 //out.print(my_acc);
                           session.setAttribute("my_acc",my_acc);


                        }

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
.style5 {color: #400000}
.style4 {color: #910048}
.style6 {color: #1A3B5C}
.style7 {color: #9B004E}
.style8 {color: #FFFFFF}
</style>
</head>
<body>

<div class="main">
  <div class="header">
    <div class="block_header">
      
      <div class="clr">
        <h1><b style="color:#FC0">Online</b> <b style="color:#FFF">Banking</b></h1>
      </div>
      <div class="menu">
        <ul>
          <li><a href="user_home.jsp" class="active">Home</a></li>
          <li><a href="user_deposit.jsp">Deposit</a></li>
          <li><a href="user_withdraw.jsp">withdraw</a></li>
          <li><a href="user_transaction.jsp">Transaction</a></li>
		  <li><a href="userdatereport.jsp">Date Report </a></li>
          <li><a href="logout.jsp">Logout</a></li>
          
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  
            <table width="887" border="0">
          <tr>
            <td width="136">&nbsp;</td>
            <td width="26"><h4>&nbsp;</h4></td>
            <td width="376"><p><span class="style8"><font size="2" color="white"><span class="style8">Welcome</span></span> 
                <span class="style8">
                <%
			
			out.print(name);
			
			
			%>
                </span></p>
            <p class="style8"><font size="2" color="white">Acc- 
              <%
			
			out.print(my_acc);
			
			
			%>
            </p></td>
          </tr>
          <tr>
            <td>&nbsp;	</td>
            <td>&nbsp;</td>
           <td><form action="" method="post" enctype="multipart/form-data" name="form1" id="form1" align="center">
             <table width="362" border="0" align="center">
               <tr>
                   <td width="209"align="center"><h2 class="style5" ><font color="white">Available balance </font></h2></td>
                   <td width="126"align="center"><span class="style4"><font color="white">
                   <%
                  String bal="-"; String accnumber="-";
		   ResultSet rs4=stmt3.executeQuery("select * from amount where name='"+name+"'");
			
                   if(rs4.next())
			{
                          // out.print("****"); 
			   bal=rs4.getString("balance");
                           accnumber=rs4.getString("accnumber");
                            out.print(bal);
                        }
		  
		 
		  
		  %>
                 </span></td>
                 <td width="13"><span class="style4"></span></td>
               </tr>
             </table>
             <p>             </p>
             <table width="800" border="0">
               <tr>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 <td>&nbsp;</td>
                 
                 <td>&nbsp;</td>
               </tr>
               <tr>
                 <td><h4><span class="style6"><font size="2" color="white">Id</span></h4></td>
                 <td><h4><span class="style6"><font size="2" color="white">Event</span></h4></td>
                 <td><h4><span class="style6"><font size="2" color="white">Amount</span></h4></td>
                 <td><h4><span class="style6"><font size="2" color="white">ACC_number</span></h4></td>
                 <td><h4><span class="style6"><font size="2" color="white">Date</span></h4></td>
               </tr>
               <%
  ResultSet rs0=stmt3.executeQuery("select * from mini where accnumber='"+accnumber+"'");
		int s=0;	
                   while(rs0.next())
			{
                          // out.print("****"); 
			  s++;

%>
               <tr>
                 <td><span class="style7"><font size="2" color="white">
                   <% out.print(s);%>
                 </span></td>
                 <td><span class="style7"><font size="2" color="white">
                   <% out.print(rs0.getString("evnt"));%>
                 </span></td>
                 <td><span class="style7"><font size="2" color="white">
                   <% out.print(rs0.getString("amount"));%>
                 </span></td>
                 <td><span class="style7"><font size="2" color="white">
                   <% out.print(rs0.getString("trans_to"));%>
                 </span></td>
                 <td><span class="style7"><font size="2" color="white">
                   <% out.print(rs0.getString("rdate"));%>
                 </span></td>
               </tr>
               <%
		
		
		}
		%>
             </table>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>&nbsp;         </p>
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
        <p class="footer_logo"><i style="color:#FC0">Secure </i><i style="color:#FFF">Online banking</i></p>
      </div>
    </div>
    <p class="clr"></p>
  </div>
</div>
</body>       
</html>
