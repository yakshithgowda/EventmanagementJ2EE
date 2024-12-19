package com.ps.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class RegisterDAO {
	private Connection con;
	HttpSession s;
	
	public RegisterDAO(HttpSession s){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","tiger");
			this.s=s;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getRegister(String name, String email, long phone, String pwd, String c) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		Statement s=null;
		ResultSet rs=null;
		int re=0;
		try {
			s=con.createStatement();
			rs=s.executeQuery("select * from customer where phone="+phone);	
			if(rs.next()) {//checking weather the record exist or not
				status="exist";
			}else {
				if(c.equals("client")) {
					ps=con.prepareStatement("insert into customer values(0,?,?,?,?,2)");//precompiled
					//setting data to the placeHolders(?).
					ps.setString(1, name);
					ps.setLong(2, phone);
					ps.setString(3, email);
					ps.setString(4, pwd);
					re=ps.executeUpdate();//inserting data to patient database
				}else {
					ps=con.prepareStatement("insert into customer values(0,?,?,?,?,3)");//precompiled
					//setting data to the placeHolders(?).
					ps.setString(1, name);
					ps.setLong(2, phone);
					ps.setString(3, email);
					ps.setString(4, pwd);
					re=ps.executeUpdate();//inserting data to patient database
					
				}
				if(re>0) {
					status="success";
				}else {
					status="failed";
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status="failed";
			return status;
		}
		
		return status;
	}

	public String getLogin(String pm, String pwd) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement("select * from customer where (phone=? or mail=?) and password=?");//precompied
			//setting data to the placeHolders(?).
			ps.setString(1, pm);
			ps.setString(2, pm);
			ps.setString(3, pwd);
			rs=ps.executeQuery();
			if(rs.next()) {
				//adding patient data to the session from the patient DB using resultset(rs).
				s.setAttribute("cid", rs.getInt("cid"));
				s.setAttribute("cname", rs.getString("cname"));
				s.setAttribute("cphone", rs.getLong("phone"));
				s.setAttribute("cmail", rs.getString("mail"));
				s.setAttribute("cpwd", rs.getString("password"));
				status="success";
			}else {
				status="failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status="failed";
			return status;
		}
		
		return status;
	}
	
	public ArrayList<BookEventList> getClientBookEvent(int id){
		ArrayList<BookEventList> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select bid,e.ename,c.cname,mail,phone,eventdate,dateOfBooked,status from bookevent b join customer c on c.cid=b.cid join eventlist e on e.eid=b.eid where b.cid=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			BookEventList e=null;
			while(rs.next()) {
				e=new BookEventList();
				e.setBid(rs.getInt(1));
				e.setEname(rs.getString(2));
				e.setCname(rs.getString(3));
				e.setMail(rs.getString(4));
				e.setPhone(rs.getLong(5));
				e.setDate(rs.getString(6));
				e.setBdate(rs.getString(7));
				e.setStatus(rs.getString(8));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<BookEventList> getClientCancelledEvent(int id){
		ArrayList<BookEventList> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select bid,e.ename,c.cname,mail,phone,eventdate,dateOfBooked,status from cancelledbookevent b join customer c on c.cid=b.cid join eventlist e on e.eid=b.eid where b.cid=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			BookEventList e=null;
			while(rs.next()) {
				e=new BookEventList();
				e.setBid(rs.getInt(1));
				e.setEname(rs.getString(2));
				e.setCname(rs.getString(3));
				e.setMail(rs.getString(4));
				e.setPhone(rs.getLong(5));
				e.setDate(rs.getString(6));
				e.setBdate(rs.getString(7));
				e.setStatus(rs.getString(8));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}

	public String updateCustData(int id, String name, String mail, long phone) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		
		boolean res;
		try {
				ps=con.prepareStatement("update customer set cname=?,mail=?,phone=? where cid=?");
				ps.setString(1, name);
				ps.setString(2, mail);
				ps.setLong(3, phone);
				ps.setLong(4, id);
				int rc=ps.executeUpdate();
				if(rc>0) {
					status="true";
					s.setAttribute("cname", name);
					s.setAttribute("cmail", mail);
					s.setAttribute("cphone", phone);
				}else {
					status="false";
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status="false";
			return status;
		}
		
		return status;
	}
	
//	storing password to the session
	public String getPassword(String mail) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from customer where mail=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, mail);
			rs=ps.executeQuery();
			if(rs.next()) {
				s.setAttribute("pwd", rs.getString(5));
				status="success";
			}else {
				status="failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	
//	resetting current pwd into new password
	public String resetPassword(String mail, String pwd) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		
		boolean res;
		try {
				ps=con.prepareStatement("update customer set password=? where mail=?");
				ps.setString(1, pwd);
				ps.setString(2, mail);
				int rc=ps.executeUpdate();
				if(rc>0) {
					status="success";
				}else {
					status="failed";
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	

	public String addToFeedback(int bid, int rating, String comment) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		Statement s=null;
		ResultSet rs=null;
		int re=0;
		try {
			s=con.createStatement();
			rs=s.executeQuery("select * from feedback where bookID="+bid);	
			if(rs.next()) {//checking weather the record exist or not
				status="exist";
			}else {
					ps=con.prepareStatement("insert into feedback values(?,?,?)");//precompiled
					//setting data to the placeHolders(?).
					ps.setInt(1, bid);
					ps.setInt(2, rating);
					ps.setString(3, comment);
					re=ps.executeUpdate();//inserting data to feedback table
				if(re>0) {
					status="success";
				}else {
					status="failed";
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			status="failed";
			return status;
		}
		
		return status;
	}
	
	public boolean checkFeedback(int bid) {
		Statement s=null;
		ResultSet rs=null;
		int re=0;
		try {
			s=con.createStatement();
			rs=s.executeQuery("select * from feedback where bookID="+bid);	
			if(rs.next()) {//checking weather the record exist or not
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return false;
	}
}
