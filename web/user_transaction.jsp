<%@page import="java.sql.ResultSet"%><%@ include file="include/dbconnect.jsp" %>

<%
String name=(String)session.getAttribute("name");
session.setAttribute("name",name);
String pass=(String)session.getAttribute("pass");
int check=0;
session.setAttribute("pass",pass);
String to_number="";
String to_bal="";
String to_name="";
//out.print(name+""+pass);

  String bal="-"; String accnumber="-";
  ResultSet rs4=stmt3.executeQuery("select * from amount where name='"+name+"' ");
			
                   if(rs4.next())
			{
                          // out.print("****"); 
			   bal=rs4.getString("balance");
                             accnumber=rs4.getString("accnumber");
                        }
		  

%>

<%
try
{
    String btn=request.getParameter("btn");
    if(btn.equals("Submit"))       
    {
           String amount=request.getParameter("amount");   
                     
            to_number=request.getParameter("to_nember");
           
           ResultSet rs41=stmt3.executeQuery("select * from amount where accnumber='"+to_number+"'  ");
			
                   while(rs41.next())
			{
                          // out.print("****"); 
			   to_bal=rs41.getString("balance");
                           to_name=rs41.getString("name");
                       // out.print(to_bal);
                           check=1;
                             //accnumber=rs4.getString("accnumber");
                        }
                  
           if(check>0)
           {
               
           
           int dep=Integer.parseInt(amount);
          
 java.util.Calendar calendar = java.util.Calendar.getInstance();

                    String day = String.valueOf(calendar.get(java.util.Calendar.DATE));
                    String month = String.valueOf(calendar.get(java.util.Calendar.MONTH) + 1);
                    String year = String.valueOf(calendar.get(java.util.Calendar.YEAR));

                    String cdate = year + "-" + month + "-" + day;
                 
           // String bal="-";
		  // ResultSet rs4=stmt3.executeQuery("select * from amount where name='"+name+"' and pass='"+pass+"' ");
			
                   //if(rs4.next())
			//{
                          // out.print("****"); 
			//   bal=rs4.getString("balance");
                            //out.print(bal);
                      //  }
            int a=Integer.parseInt(bal);
           int total=a-dep;
          // out.print(total);
stmt5.executeUpdate("update amount set balance='"+total+"' where name='"+name+"' ");
 String inso = "insert into mini(name,accnumber,evnt,amount,trans_to,rdate,report) values('"+name+"','" + accnumber + "','trans_to','" + dep + "','"+to_number+"','"+cdate+"','0')";
               // out.print(inso);        
                    int n = stmt4.executeUpdate(inso);
          String insoq = "insert into mini(name,accnumber,evnt,amount,trans_to,rdate,report) values('"+to_name+"','" + to_number + "','trans_from','" + dep + "','"+accnumber+"','"+cdate+"','0')";
           int nq = stmt4.executeUpdate(insoq);
                   int x=Integer.parseInt(to_bal);
                    int y=Integer.parseInt(amount);
                    int z=x+y;
                    stmt6.executeUpdate("update amount set balance='"+z+"' where 	accnumber='"+to_number+"' ");
 //String inso = "insert into mini(name,accnumber,evnt,amount,trans_to,rdate,report) values('"+name+"','" + accnumber + "','transaction','" + dep + "','"+to_number+"','"+cdate+"','0')";
               // out.print(inso);        
                   // int n = stmt4.executeUpdate(inso);
                    
                    
                         response.sendRedirect("user_transaction.jsp");
           }
           
           else
           {
               
%>
						<script language="javascript">
		alert("NOt valid number");
             								//		window.location.href="user_ver_2.jsp";
   
		</script>
						
						<%                         //response.sendRedirect("transaction.jsp");

           }
           
           

    }
}catch (Exception e)
{
    
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
.style1 {
	color: #FFFFFF;
	font-weight: bold;
}
.style2 {color: #CCCCCC}
.style5 {color: #400000}
.style4 {color: #910048}
.style6 {color: #1A3B5C}
.style7 {color: #9B004E}
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
          <li><a href="user_home.jsp" >Home</a></li>
          <li><a href="user_deposit.jsp">Deposit</a></li>
          <li><a href="user_withdraw.jsp">withdraw</a></li>
          <li><a href="user_transaction.jsp" class="active">Transaction</a></li>
		  <li><a href="userdatereport.jsp">Date Report </a></li>
          <li><a href="logout.jsp">Logout</a></li>
          
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="clr">	</div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <form id="form1" name="form1" method="post" action="">
      <table width="95%" border="0" align="center">
        <tr>
          <td width="14%"><div align="center" class="style1">
            <h2 class="style1">Welecome </h2>
          </div></td>
          <td width="25%"><H2 class="style1">
            <%
		  out.print(name);		    
		  
		  %>
          </H2></td>
          <td width="55%"><span class="style3"></span></td>
          <td width="6%">&nbsp;</td>
        </tr>
      </table>
      <table width="419" border="0" align="center">
        <tr>
          <td colspan="3"><h2 class="style1">Available balance </h2></td>
          <td colspan="6"><span class="style1">
            <%
                 
		  out.print(bal);
		  
		  %>
          </span></td>
          <td width="13" rowspan="7"><span class="style4"></span></td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
          <td colspan="6" rowspan="5">&nbsp;</td>
        </tr>
        <tr>
          <td><h3 align="center"><span class="style6"><font color="white">Account Number </span></h3></td>
          <td><input name="to_nember" type="text" id="to_nember" /></td>
          <td width="1">&nbsp;</td>
        </tr>
        <tr>
          <td width="177"><div align="center" class="style6"><font  color="white">
              <h3>Trans  Amount </h3>
          </div></td>
          <td width="152"><label>
            <input name="amount" type="text" id="amount" />
          </label></td>
        </tr>
        <tr>
          <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="3"><label>
              <div align="center">
                <input name="btn" type="submit" id="btn" value="Submit" />
              </div>
            </label></td>
        </tr>
        <tr>
          <td colspan="9">&nbsp;</td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </form>
  </div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
