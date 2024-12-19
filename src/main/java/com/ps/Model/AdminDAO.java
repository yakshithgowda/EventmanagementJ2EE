package com.ps.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class AdminDAO {
	private Connection con;
	HttpSession s;
	
	public AdminDAO(HttpSession s){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","tiger");
			this.s=s;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//adding new event by admin
	public String addEvent(String name, String des, String img) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		int re=0;
		try {
			ps=con.prepareStatement("insert into eventlist values(0,?,?,?)");//pre-compiled
			//setting data to the placeHolders(?).
			ps.setString(1, name);
			ps.setString(2, des);
			ps.setString(3, img);
			re=ps.executeUpdate();//inserting data to patient database
			if(re>0) {
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
	
	public ArrayList<EventList> getEventList(){
		ArrayList<EventList> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from eventlist";
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			EventList e=null;
			while(rs.next()) {
				e=new EventList();
				e.setEid(rs.getInt(1));
				e.setName(rs.getString(2));
				e.setDes(rs.getString(3));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<BookEventList> getBookEventList(){
		ArrayList<BookEventList> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select bid,e.ename,c.cname,mail,phone,eventdate,dateOfBooked,status from bookevent b join customer c on c.cid=b.cid join eventlist e on e.eid=b.eid";
		
		try {
			ps=con.prepareStatement(query);
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
	
	public ArrayList<BookEventList> getCancelledEventList(){
		ArrayList<BookEventList> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select bid,e.ename,c.cname,mail,phone,eventdate,dateOfBooked,status from cancelledbookevent b join customer c on c.cid=b.cid join eventlist e on e.eid=b.eid";
		
		try {
			ps=con.prepareStatement(query);
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
	
	public ArrayList<Customer> getCustomerList(){
		ArrayList<Customer> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from customer where authentication=2";
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			Customer e=null;
			while(rs.next()) {
				e=new Customer();
				e.setCid(rs.getInt(1));
				e.setName(rs.getString(2));
				e.setMail(rs.getString(4));
				e.setPhone(rs.getLong(3));
				e.setPwd(rs.getString(5));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	//method taking event details
	public ArrayList<EventList> getEventInfo(){
		ArrayList<EventList> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select * from eventlist";
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			EventList e=null;
			while(rs.next()) {
				e=new EventList();
				e.setName(rs.getString(2));
				e.setDes(rs.getString(3));
				e.setImg(rs.getString(4));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	public String bookEvent(int cid, int evnetType, String edate) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		Statement s=null;
		ResultSet rs=null;
		//int pntId=Integer.parseInt(pid);
		
		try {
			s=con.createStatement();
			rs=s.executeQuery("select * from bookevent where eventdate='"+edate+"'");	
			if(rs.next()) {//checking weather the record exist or not
				status="exist";
			}else {
				ps=con.prepareStatement("insert into bookevent values(0,?,?,?,now(),'Pending')");//precompiled
				//setting data to the placeHolders(?).
				ps.setInt(1, evnetType);
				ps.setInt(2, cid);
				ps.setString(3, edate);
				int re=ps.executeUpdate();//inserting data to patient database
				if(re>0) {
					status="success";
				}else {
					status="failed";
				}
			}
				
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	
	public String updateBookEvent(int id, String name) {
		// TODO Auto-generated method stub
		String status="";
		PreparedStatement ps=null;
		Statement s=null;
		ResultSet rs=null;
		int re=0;
		try {
			if(name.equals("Cancel")) {
				
				s=con.createStatement();
				rs=s.executeQuery("select eventdate from bookevent where eventdate>curdate() and bid="+id );	
				if(rs.next()) {//checking weather the record exist or not
					ps=con.prepareStatement("update bookevent set status='Cancelled' where bid=? ");
					ps.setInt(1, id);
					re=ps.executeUpdate();
					if(re>0) {
						status="success";
					}else {
						status="failed";
					}
				}else {
					status="failed";
				}
				
				
			}else {
				s=con.createStatement();
				rs=s.executeQuery("select eventdate from bookevent where eventdate<=curdate() and bid="+id );	
				if(rs.next()) {//checking weather the record exist or not
					ps=con.prepareStatement("update bookevent set status='Completed' where bid=? ");
					ps.setInt(1, id);
					re=ps.executeUpdate();
					if(re>0) {
						status="success";
					}else {
						status="failed";
					}
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
	
	
	
	public int deleteRecord(int id, String tname) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		ResultSet rs=null;
		int rc=0;
		try {
			if(tname.equals("employee")) {
				ps=con.prepareStatement("delete from customer where cid=?");
				ps.setInt(1, id);
				rc=ps.executeUpdate();
			}else {
				ps=con.prepareStatement("delete from eventlist where eid=?");
				ps.setInt(1, id);
				rc=ps.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return rc;
		}
		return rc;
	}
	public int deleteBookedRecord(int id) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		ResultSet rs=null;
		int rc=0;
		try {
				ps=con.prepareStatement("delete from bookevent where bid=?");
				ps.setInt(1, id);
				rc=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return rc;
		}
		return rc;
	}
	
	public boolean ifPresent(int bid) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Feedback f=null;
		try {
				ps=con.prepareStatement("select * from feedback where bookid=?");
				ps.setInt(1, bid);
				rs=ps.executeQuery();
				if(rs.next()) {
//					f=new Feedback();
//					f.setRating(rs.getInt(2));
//					f.setComment(rs.getString(3));
//					return f;
					
					return true;
					
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			return f;
			return false;
		}
		return false;
	}
	
	
	public Feedback getFeedback(int bid) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Feedback f=null;
		String query="select f.bookid,cname,ename,rating,comment "
				+ "from feedback f "
				+ "join bookevent b on b.bid=f.bookID and b.bid=? "
				+ "join eventlist e on b.eid=e.eid "
				+ "join customer c on b.cid=c.cid";
		try {
				ps=con.prepareStatement(query);
				ps.setInt(1, bid);
				rs=ps.executeQuery();
				if(rs.next()) {
					f=new Feedback();
					f.seteName(rs.getString(3));
					f.setRating(rs.getInt(4));
					f.setComment(rs.getString(5));
					return f;
					
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			return f;
			return f;
		}
		return f;
	}
	
	public ArrayList<Feedback> getFeedbackList(){
		ArrayList<Feedback> al=new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="select f.bookid,cname,ename,rating,comment "
				+ "from feedback f "
				+ "join bookevent b on b.bid=f.bookID "
				+ "join eventlist e on b.eid=e.eid "
				+ "join customer c on b.cid=c.cid";
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			Feedback e=null;
			while(rs.next()) {
				e=new Feedback();
				e.setBid(rs.getInt(1));
				e.setcName(rs.getString(2));
				e.seteName(rs.getString(3));
				e.setRating(rs.getInt(4));
				e.setComment(rs.getString(5));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
}
