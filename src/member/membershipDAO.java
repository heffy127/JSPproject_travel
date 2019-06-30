package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class membershipDAO {
	Connection con;
	
	DBConnectionMgr mgr;

	public int insert(membershipDTO dto) {
		int res = 0;
		mgr = DBConnectionMgr.getInstance();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "insert into membership values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getSsn());
			ps.setString(3, dto.getSsn2());
			ps.setString(4, dto.getId());
			ps.setString(5, dto.getPw());
			ps.setString(6, dto.getPwhint());
			ps.setString(7, dto.getPwan());
			ps.setString(8, dto.getMail());
			ps.setString(9, dto.getMail2());
			ps.setString(10, dto.getAddress());
			ps.setString(11, dto.getAddress2());
			ps.setString(12, dto.getPostcode());
			ps.setString(13, dto.getAddress3());
			ps.setString(14, dto.getTel());
			ps.setString(15, dto.getTel2());
			ps.setString(16, dto.getTel3());
			
			res = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
		return res;
	}
	public String select(String inputId) {
		
		String id = null;
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "select * from membership where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, inputId);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
			}else {
				id = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
		return id;
	}
	
	public ArrayList login(String inputId, String inputPw) {
		
		ArrayList list = new ArrayList();
		
		String id = null;
		String pw = null;
		String name = null;
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "select * from membership where id=? and pw=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, inputId); 
			ps.setString(2, inputPw);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				list.add(id);
				list.add(pw);
				list.add(name);
			}else {
				list.add(id);
				list.add(pw);
				list.add(name);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
		/*
		 * boolean check = (inputId.equals(id)); System.out.println(inputId);
		 * System.out.println(inputPw); System.out.println(id); System.out.println(pw);
		 * System.out.println(check); System.out.println(list.size());
		 */
		return list;
	}
	
	public ArrayList Id_Tel_Serch(String inputName, String inputTel, String inputTel2, String inputTel3) {
		
		ArrayList list = new ArrayList();
		
		String name = null;
		String tel = null;
		String tel2 = null;
		String tel3 = null;
		String id = null;
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "select * from membership where name=? and tel=? and tel2=? and tel3=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, inputName); 
			ps.setString(2, inputTel);
			ps.setString(3, inputTel2);
			ps.setString(4, inputTel3);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
				tel = rs.getString("tel");
				tel2 = rs.getString("tel2");
				tel3 = rs.getString("tel3");
				id = rs.getString("id");
				list.add(name);
				list.add(tel);
				list.add(tel2);
				list.add(tel3);
				list.add(id);
			}else {
				list.add(name);
				list.add(tel);
				list.add(tel2);
				list.add(tel3);
				list.add(id);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
		return list;
	}
	
	public ArrayList Id_Mail_Serch(String inputName, String inputMail, String inputMail2) {
		
		ArrayList list = new ArrayList();
		
		String name = null;
		String mail = null;
		String mail2 = null;
		String id = null;
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "select * from membership where name=? and mail=? and mail2=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, inputName); 
			ps.setString(2, inputMail);
			ps.setString(3, inputMail2);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
				mail = rs.getString("mail");
				mail2 = rs.getString("mail2");
				id = rs.getString("id");
				list.add(name);
				list.add(mail);
				list.add(mail2);
				list.add(id);
			}else {
				list.add(name);
				list.add(mail);
				list.add(mail2);
				list.add(id);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
		return list;
	}
	
	public ArrayList Id_Pwhint_Serch(String inputId, String inputPwhint, String inputPwan) {
		
		ArrayList list = new ArrayList();
		
		String id = null;
		String pwhint = null;
		String pwan = null;
		String pw = null;
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "select * from membership where id=? and pwhint=? and pwan=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, inputId); 
			ps.setString(2, inputPwhint);
			ps.setString(3, inputPwan);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				pwhint = rs.getString("pwhint");
				pwan = rs.getString("pwan");
				pw = rs.getString("pw");
				list.add(id);
				list.add(pwhint);
				list.add(pwan);
				list.add(pw);
			}else {
				list.add(id);
				list.add(pwhint);
				list.add(pwan);
				list.add(pw);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
		return list;
	}
	
	public membershipDTO ShowInfo(String sessionId) {
		
		membershipDTO dto = null;
		
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "select * from membership where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, sessionId);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				dto = new membershipDTO();
				String name = rs.getString(1);
				String ssn = rs.getString(2);
				String ssn2 = rs.getString(3);
				String id = rs.getString(4);
				String pw = rs.getString(5);
				String pwhint = rs.getString(6);
				String pwan = rs.getString(7);
				String mail = rs.getString(8);
				String mail2 = rs.getString(9);
				String address = rs.getString(10);
				String address2 = rs.getString(11);
				String address3 = rs.getString("address3");
				String postcode = rs.getString("postcode");
				String tel = rs.getString(14);
				String tel2 = rs.getString(15);
				String tel3 = rs.getString(16);
				
				dto.setName(name);
				dto.setSsn(ssn);
				dto.setSsn2(ssn2);
				dto.setId(id);
				dto.setPw(pw);
				dto.setPwhint(pwhint);
				dto.setPwan(pwan);
				dto.setMail(mail);
				dto.setMail2(mail2);
				dto.setAddress(address);
				dto.setAddress2(address2);
				dto.setAddress3(address3);
				dto.setPostcode(postcode);
				dto.setTel(tel);
				dto.setTel2(tel2);
				dto.setTel3(tel3);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
		/*
		 * boolean check = (inputId.equals(id)); System.out.println(inputId);
		 * System.out.println(inputPw); System.out.println(id); System.out.println(pw);
		 * System.out.println(check); System.out.println(list.size());
		 */
		return dto;
	}
	
	public void UpdateInfo(membershipDTO dto) {
		
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "update membership set name=?, pw=?, pwhint=?, pwan=?, mail=?, mail2=?, "
					+ "address=?, address2=?, address3=?, postcode=?, tel=?, tel2=?, tel3=? where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getPwhint());
			ps.setString(4, dto.getPwan());
			ps.setString(5, dto.getMail());
			ps.setString(6, dto.getMail2());
			ps.setString(7, dto.getAddress());
			ps.setString(8, dto.getAddress2());
			ps.setString(9, dto.getAddress3());
			ps.setString(10, dto.getPostcode());
			ps.setString(11, dto.getTel());
			ps.setString(12, dto.getTel2());
			ps.setString(13, dto.getTel3());
			ps.setString(14, dto.getId());
			
			ps.executeUpdate();	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
	}
	
	public void DeleteInfo(String sessinoId) {
		
		mgr = DBConnectionMgr.getInstance();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url= "jdbc:mysql://localhost:3306/site";
			String user = "root";
			String password = "1234";
			con = mgr.getConnection();
			
			String sql = "delete from membership where id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, sessinoId);
			
			ps.executeUpdate();	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			mgr.freeConnection(con);
		}
	}
}