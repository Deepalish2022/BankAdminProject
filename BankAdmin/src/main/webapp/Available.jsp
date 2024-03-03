<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
int no=Integer.parseInt(request.getParameter("accno"));

Connection con;
PreparedStatement pst;
ResultSet rs;

try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://bqfvarvkjdsqxwgeglcx-mysql.services.clever-cloud.com:3306/bqfvarvkjdsqxwgeglcx?user=udpvngf7y1eji9zz&password=VUIRBNc3ZJUJ1vXNxLzq");	pst=con.prepareStatement("select * from accounts where accno=?");
	pst.setInt(1,no);
	rs=pst.executeQuery();
	if(rs.next())
	{
		%>
		<span style="color:red">Sorry!!! Account Number Not available</span>
		<%
	}
	else
	{
		%>
		<span style="color:green">Congrats!!! Available for use</span>
		<%
	}
	con.close();
}
catch(Exception e)
{
	out.println("server down");
}

%>

</body>
</html>