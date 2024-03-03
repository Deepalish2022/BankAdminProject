package com.admin.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class CheckAdmin
 */
public class CheckAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id,ps;
		id=request.getParameter("uid");
		ps=request.getParameter("psw");
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://bqfvarvkjdsqxwgeglcx-mysql.services.clever-cloud.com:3306/bqfvarvkjdsqxwgeglcx?user=udpvngf7y1eji9zz&password=VUIRBNc3ZJUJ1vXNxLzq");			
			pst=con.prepareStatement("select * from adminusers where usweid=? and pswd=? and userstatus='active'");
			pst.setString(1, id);
			pst.setString(2, ps);
			rs=pst.executeQuery();
			
			if(rs.next())
			{
				HttpSession ses=request.getSession(true);
				ses.setAttribute("usweid", id);
				
				if(rs.getString("usertype").equals("manager"))
					response.sendRedirect("Manager.jsp");
				if(rs.getString("usertype").equals("cashier"))
					response.sendRedirect("Cashier.jsp");
			}
			else
			{
				response.sendRedirect("Failure.jsp");
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
	}

}
