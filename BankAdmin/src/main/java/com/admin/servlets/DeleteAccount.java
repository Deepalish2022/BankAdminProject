package com.admin.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
/**
 * Servlet implementation class DeleteAccount
 */
public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int accno,cnt=0;
		Connection con;
		PreparedStatement pst;
		
		try
		{
			accno=Integer.parseInt(request.getParameter("accno"));
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://bqfvarvkjdsqxwgeglcx-mysql.services.clever-cloud.com:3306/bqfvarvkjdsqxwgeglcx?user=udpvngf7y1eji9zz&password=VUIRBNc3ZJUJ1vXNxLzq");			pst=con.prepareStatement("delete from accounts where accno=?");
			pst.setInt(1, accno);
			cnt=pst.executeUpdate();
			if(cnt==1)
			{
			System.out.println("account deleted successfully");	
			response.sendRedirect("OpenCloseSuccess.jsp");
			}
			else
			{
			System.out.println("account number does not exist");	
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
