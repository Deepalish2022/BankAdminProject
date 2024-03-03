<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</head>
<body style="margin-top:35px">

<div class="container">
		<%
        String acctype=request.getParameter("acctype");
        %>
        <h1 class="display-6">Account Type Report for <%=acctype %></h1>
        <hr>
        
        <table class="table table-bordered table-hover">
            <tr>
                <th>Number</th>
                <th>Name</th>
                <th>Type</th>
                <th>Balance</th>
            </tr>
            
            <%
            Connection con;
        		PreparedStatement pst;
        		ResultSet rs;
        		
        		try
        		{
        			Class.forName("com.mysql.cj.jdbc.Driver");
        			con=DriverManager.getConnection("jdbc:mysql://bvtzpajcieav1rbhaza2-mysql.services.clever-cloud.com:3306/bvtzpajcieav1rbhaza2?user=u7ptalsi27bkc2nd&password=KhghuYckjM6CsNhqBGJn");
        			pst=con.prepareStatement("select * from accounts where acctype=?");
        			pst.setString(1,acctype);
        			rs=pst.executeQuery();
        			while(rs.next())
        			{
        				%>
        				<tr>
            <td><%=rs.getInt("accno") %></td>
            <td><%=rs.getString("accnm") %></td>
            <td><%=rs.getString("acctype") %></td>
            <td><%=rs.getFloat("balance") %></td>
        </tr>
        				<%
        			}
        			con.close();
        		}
        		catch(Exception e)
        		{
        			out.println(e);
        		}
            
            %>
            
        
        </table>
        </div>

</body>
</html>