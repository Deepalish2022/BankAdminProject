package com.admin.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class DepositAmount
 */
public class DepositAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepositAmount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int accno;
		float amount;
		
		Connection con;
		PreparedStatement pst;
		
		try
		{
		accno=Integer.parseInt(request.getParameter("accno"));
		amount=Float.parseFloat(request.getParameter("amount"));
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://bqfvarvkjdsqxwgeglcx-mysql.services.clever-cloud.com:3306/bqfvarvkjdsqxwgeglcx?user=udpvngf7y1eji9zz&password=VUIRBNc3ZJUJ1vXNxLzq");		
		pst=con.prepareStatement("update accounts set balance=balance+? where accno=?");
		pst.setFloat(1, amount);
		pst.setInt(2, accno);
		int cnt=pst.executeUpdate();
		con.close();
		
		if(cnt==1)
			response.sendRedirect("TransactionSuccess.jsp");
		else
			response.sendRedirect("TransactionFailed.jsp");
		
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("TransactionFailed.jsp");
		}
		
	}

}
