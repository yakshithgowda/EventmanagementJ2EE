package com.ps.controllerServlet;

import java.io.IOException;
import java.util.ArrayList;

import com.ps.Model.RegisterDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/register")

public class RegisterServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(req,resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(req,resp);
	}
	
	
	
	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession s=req.getSession();
		RegisterDAO rdao=new RegisterDAO(s);

		//getting the data from the user when he click on register
		if(req.getParameter("register")!=null) {
			String name=req.getParameter("name");//getParameter() method is used for getting the user entered data from JSP
			String email=req.getParameter("email");
			long phone=Long.parseLong(req.getParameter("phone"));
			String pwd=req.getParameter("pwd");
			String conpwd=req.getParameter("conpwd");
			String c=req.getParameter("c");
			
			
			if(pwd.equals(conpwd)) {//checking password & confirm password are same
				String status="";
				status=rdao.getRegister(name,email,phone,pwd,c);
				
				if(status.equals("exist")) {
					req.setAttribute("msge", "record already exist");
					RequestDispatcher rd=req.getRequestDispatcher("Registration.jsp");
					rd.forward(req, resp);
				}else if(status.equals("success")) {
					if(s.getAttribute("cid")!=null && s.getAttribute("cid").equals(501)) {
						req.setAttribute("msg", "Employee Add successfull");
						RequestDispatcher rd=req.getRequestDispatcher("Registration.jsp");
						rd.forward(req, resp);
					}else {
						req.setAttribute("msg", "Registration successfull");
						RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
						rd.forward(req, resp);
					}
					
					
				}else if(status.equals("failed")) {
					req.setAttribute("msge", "Failed to register");
					RequestDispatcher rd=req.getRequestDispatcher("Registration.jsp");
					rd.forward(req, resp);
				}
			}
			
		}else if(req.getParameter("login")!=null) {
			String pm=req.getParameter("pm");
			String pwd=req.getParameter("pwd");
			String status=rdao.getLogin(pm,pwd);//control going to patientDAO class
			if(status.equals("success")) {
				RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
				rd.forward(req, resp);
			}else if(status.equals("failed")) {
				req.setAttribute("msge", "Invalid login details");
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
				rd.forward(req, resp);
			}		
		}//this logout from the patient account and invalidate the session
		else if(req.getParameter("logout")!=null) {
			s.invalidate();
			RequestDispatcher rd=req.getRequestDispatcher("Home.jsp");
			rd.forward(req, resp);	
		}
		else if(req.getParameter("update")!=null) {//Updating the details
			String name=req.getParameter("name");//getParameter() method is used for getting the user entered data from JSP
			String mail=req.getParameter("email");
			int id=Integer.parseInt(req.getParameter("id"));
			long phone=Long.parseLong(req.getParameter("phone"));
			String status=rdao.updateCustData(id,name,mail,phone);//control going to patientDAO class
			if(status.equals("true")) {
				req.setAttribute("msg", "Data updated successfully");
				RequestDispatcher rd=req.getRequestDispatcher("EditProfile.jsp");
				rd.forward(req, resp);
			}else if(status.equals("false")) {
				req.setAttribute("msge", "Failed to Update Data");
				RequestDispatcher rd=req.getRequestDispatcher("EditProfile.jsp");
				rd.forward(req, resp);
			}
		}
		else if(req.getParameter("pass")!=null) {
			String mail=req.getParameter("email");
			String pwd=req.getParameter("pwd");
			String conpwd=req.getParameter("conpwd");
			
			if(pwd.equals(conpwd)) {
				String stus=rdao.getPassword(mail);
				if(stus.equals("success")) {
					if(s.getAttribute("pwd").equals(pwd)) {
						req.setAttribute("msge","Password Same has old Password");
						RequestDispatcher rd=req.getRequestDispatcher("ForgorChangePwd.jsp");
						rd.forward(req, resp);
					}else {
						String status=rdao.resetPassword(mail,pwd);
						if(status.equals("success")) {
							if(s.getAttribute("cid")!=null) {
								req.setAttribute("msg","Password changed successfully");
								RequestDispatcher rd=req.getRequestDispatcher("ForgorChangePwd.jsp");
								rd.forward(req, resp);
							}else {
								req.setAttribute("msg","Password changed successfully");
								RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
								rd.forward(req, resp);
							}
						}else if(status.equals("failed")) {
							req.setAttribute("msge", "Failed to change password");
							RequestDispatcher rd=req.getRequestDispatcher("ForgorChangePwd.jsp");
							rd.forward(req, resp);
						}
					}
				}else {
					req.setAttribute("msge","Invalid ID");
					RequestDispatcher rd=req.getRequestDispatcher("ForgorChangePwd.jsp");
					rd.forward(req, resp);
				}
				
				
			}else {
				req.setAttribute("msge", "Both password are same");
				RequestDispatcher rd=req.getRequestDispatcher("ForgorChangePwd.jsp");
				rd.forward(req, resp);
			}
			
		}
		else if(req.getParameter("feedback")!=null) {//feedback details
			String comment=req.getParameter("com");//getParameter() method is used for getting the user entered data from JSP
			int bid=Integer.parseInt(req.getParameter("bid"));
			int rating=Integer.parseInt(req.getParameter("rating"));
			System.out.println(rating);
			String status=rdao.addToFeedback(bid,rating,comment);//control going to patientDAO class
			if(status.equals("exist")) {
				req.setAttribute("msge", "Feedback already given");
				RequestDispatcher rd=req.getRequestDispatcher("ClientBookedEvents.jsp");
				rd.forward(req, resp);
			}else if(status.equals("success")) {
				req.setAttribute("msg", "Feedback given successfull");
				RequestDispatcher rd=req.getRequestDispatcher("ClientBookedEvents.jsp");
				rd.forward(req, resp);
				
			}else if(status.equals("failed")) {
				req.setAttribute("msge", "Failed to Process, Try again....");
				RequestDispatcher rd=req.getRequestDispatcher("ClientBookedEvents.jsp");
				rd.forward(req, resp);
			}
		}
		
		
		
	}
}
