package com.ps.controllerServlet;

import java.io.IOException;

import com.ps.Model.AdminDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")

public class AdminServlet extends HttpServlet {
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
		AdminDAO ad=new AdminDAO(s);

		//getting the data from the user when he click on register
		if(req.getParameter("book")!=null) {
			int cid=Integer.parseInt(req.getParameter("cid"));
			String edate=req.getParameter("edate");
			int EvnetType=Integer.parseInt(req.getParameter("et"));
			System.out.println(edate);
			String status=ad.bookEvent(cid,EvnetType,edate);//control going to AdminDAO class
			if(status.equals("exist")) {
				req.setAttribute("msge", "Date not available for event");
				RequestDispatcher rd=req.getRequestDispatcher("BookEvent.jsp");
				rd.forward(req, resp);
			}else if(status.equals("success")) {
				req.setAttribute("msg", "Event Booked Successfully");
				RequestDispatcher rd=req.getRequestDispatcher("BookEvent.jsp");
				rd.forward(req, resp);
			}else if(status.equals("failed")) {
				req.setAttribute("msge", "Failed to Book Event");
				RequestDispatcher rd=req.getRequestDispatcher("BookEvent.jsp");
				rd.forward(req, resp);
			}		
		}else if(req.getParameter("addevent")!=null) {
			String name=req.getParameter("name");
			String des=req.getParameter("des");
			String img=req.getParameter("img");
			String status=ad.addEvent(name,des,img);//control going to AdminDAO class
			
			if(status.equals("success")) {
				req.setAttribute("msg", "Event Added Successfully");
				RequestDispatcher rd=req.getRequestDispatcher("AddEvent.jsp");
				rd.forward(req, resp);
			}else if(status.equals("failed")) {
				req.setAttribute("msge", "Failed to Add Event");
				RequestDispatcher rd=req.getRequestDispatcher("AddEvent.jsp");
				rd.forward(req, resp);
			}
		}
		else if(req.getParameter("update")!=null) {//updating event done
			String name=req.getParameter("update");
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println(name+"---------------");
			String status=ad.updateBookEvent(id,name);//control going to AdminDAO class
			if(name.equals("Cancel")) {
				if(status.equals("success")) {
					int sts=ad.deleteBookedRecord(id);
					if(sts>0) {
						req.setAttribute("msg", "Event Cancelled Successfully");
						RequestDispatcher rd=req.getRequestDispatcher("ClientBookedEvents.jsp");
						rd.forward(req, resp);
					}else {
						req.setAttribute("msge", "Event cancelled but not inserted");
						RequestDispatcher rd=req.getRequestDispatcher("ClientBookedEvents.jsp");
						rd.forward(req, resp);
					}
					
				}else if(status.equals("failed")) {
					req.setAttribute("msge", "Event can't be cancelled");
					RequestDispatcher rd=req.getRequestDispatcher("ClientBookedEvents.jsp");
					rd.forward(req, resp);
				}
			}else {
				if(status.equals("success")) {
					req.setAttribute("msg", "status updated Successfully");
					RequestDispatcher rd=req.getRequestDispatcher("ViewBookEvent.jsp");
					rd.forward(req, resp);
				}else if(status.equals("failed")) {
					req.setAttribute("msge", "Event not completed,Status can't be updated");
					RequestDispatcher rd=req.getRequestDispatcher("ViewBookEvent.jsp");
					rd.forward(req, resp);
				}
			}
			
		}
		else if(req.getParameter("delete")!=null) {//Deleting Events or customer
			String tname=req.getParameter("tname");
			int id=Integer.parseInt(req.getParameter("id"));
			int status=ad.deleteRecord(id,tname);//control going to AdminDAO class
			
			if(tname.equals("employee")) {
				if(status>0) {
					req.setAttribute("msg", tname+" deleted Successfully");
					RequestDispatcher rd=req.getRequestDispatcher("ViewClient.jsp");
					rd.forward(req, resp);
				}else{
					req.setAttribute("msge", "Failed to deleted record of "+tname);
					RequestDispatcher rd=req.getRequestDispatcher("ViewClient.jsp");
					rd.forward(req, resp);
				}
			}else {
				if(status>0) {
					req.setAttribute("msg", tname+" deleted Successfully");
					RequestDispatcher rd=req.getRequestDispatcher("ViewEvent.jsp");
					rd.forward(req, resp);
				}else{
					req.setAttribute("msge", "Failed to deleted record of "+tname);
					RequestDispatcher rd=req.getRequestDispatcher("ViewEvent.jsp");
					rd.forward(req, resp);
				}
			}
		}
		
		
	}
}
