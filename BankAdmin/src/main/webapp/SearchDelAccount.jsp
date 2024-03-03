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
<body style="margin-top: 35px;">
    <div class="container">
        
        <br><br>      
        <%
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        int accno,ano;
        try
        {
        	accno=Integer.parseInt(request.getParameter("accno"));
        	Class.forName("com.mysql.cj.jdbc.Driver");
    		con=DriverManager.getConnection("jdbc:mysql://bvtzpajcieav1rbhaza2-mysql.services.clever-cloud.com:3306/bvtzpajcieav1rbhaza2?user=u7ptalsi27bkc2nd&password=KhghuYckjM6CsNhqBGJn");
    		pst=con.prepareStatement("select * from accounts where accno=?");
    		pst.setInt(1,accno);
    		rs=pst.executeQuery();
    		
    		if(rs.next())
    		{
    			ano=rs.getInt("accno");
    			%>
    			<table class="table table-bordered">
                    <tr>
                        <td>Account Number</td>
                        <td><%=ano %></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><%=rs.getString("accnm") %></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><%=rs.getString("acctype") %></td>
                    </tr>
                    <tr>
                        <td>Balance</td>
                        <td><b><%=rs.getFloat("balance") %></b></td>
                    </tr>
                    <tr>
                    <td colspan="2">
                    <form method="post" action="DeleteAccount">
                    <input type="hidden" name="accno" value="<%=ano%>"> 
                    <input type="submit" value="Delete" class="btn btn-danger">
                    </form>
                    </td>
                    </tr>
                </table>
    			
    			<%
    		}
    		else
    			out.println("<h4>Account does not exist</h4>");
    		
        }
        catch(Exception e)
        {
        	out.println(e);
        }
        %>

<br>
<a href="CloseAccount.html">Clear</a>

    </div>

</body>
</html>