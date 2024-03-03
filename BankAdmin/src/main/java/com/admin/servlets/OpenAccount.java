package com.admin.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class OpenAccount
 */
public class OpenAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpenAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int accno;
		String accnm,acctype;
		float balance;
		
		Connection con;
		PreparedStatement pst;
		
		accno=Integer.parseInt(request.getParameter("accno"));
		accnm=request.getParameter("accnm");
		acctype=request.getParameter("acctype");
		balance=Float.parseFloat(request.getParameter("balance"));
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://bqfvarvkjdsqxwgeglcx-mysql.services.clever-cloud.com:3306/bqfvarvkjdsqxwgeglcx?user=udpvngf7y1eji9zz&password=VUIRBNc3ZJUJ1vXNxLzq");			
			pst=con.prepareStatement("insert into accounts values(?,?,?,?)");
			pst.setInt(1, accno);
			pst.setString(2,accnm);
			pst.setString(3, acctype);
			pst.setFloat(4, balance);
			
			pst.executeUpdate();
			con.close();
			System.out.println("done...");
			response.sendRedirect("OpenCloseSuccess.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("AccountCreationFailed.jsp");
		}
		
	}

}
