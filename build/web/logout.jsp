
<%
try
{
 session.removeAttribute("username");
response.sendRedirect("index.jsp");
}
catch(Exception e)
        {
    }
%>

