package board_editor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DBConnectionMgr;

public class BoardEditorDAO {
	DBConnectionMgr mgr;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	BoardEditorDTO dto = null;
	int res;
	String sql = null;

	public BoardEditorDAO() {
		mgr = DBConnectionMgr.getInstance();

	}

	public ArrayList<BoardEditorDTO> makeList(ResultSet rs) throws Exception {
		ArrayList<BoardEditorDTO> list = new ArrayList<BoardEditorDTO>();
		while (rs.next()) {
			dto = new BoardEditorDTO();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			list.add(dto);
		}
		return list;
	}

	public ArrayList<BoardEditorDTO> listBoard(int startRow, int pageSize) {
		ArrayList<BoardEditorDTO> list = new ArrayList<BoardEditorDTO>();
		sql = "select * from board_editor order by num desc limit ?, ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			list = makeList(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int listCount() {
		int cnt = 0;
		sql = "select count(*) from board_editor";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int searchCount(String select, String keyword) {
		int cnt = 0;
		sql = "select count(*) from board_editor where " + select + " like '%" + keyword + "%'";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	public ArrayList<BoardEditorDTO> search(String select, String keyword, int startRow, int pageSize) {
		ArrayList<BoardEditorDTO> list = new ArrayList<BoardEditorDTO>();
		sql = "select * from board_editor where " + select + " like '%" + keyword + "%' order by num desc limit ?, ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			list = makeList(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public BoardEditorDTO selectSubject(String fromSubject, int num) {
		if (!(fromSubject == null || fromSubject.trim().equals(""))) { // 제목을 눌러서 게시글 확인할때만 조회수 증가
			readCountPlus(num);
		}
		sql = "select * from board_editor where num = ?";
		BoardEditorDTO dto = new BoardEditorDTO();
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public int readCountPlus(int num) {
		sql = "update board_editor set readcount = readcount + 1 where num = ? ";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			res = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

	public int insertBoard(BoardEditorDTO dto) {
		sql = "insert into board_editor values(null,?,?,?,current_timestamp, 0)";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			res = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

	public int updateBoard(BoardEditorDTO dto) {
		sql = "update board_editor set subject = ?, content = ? where num = ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getNum());
			res = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

	public int deleteBoard(int num) {
		sql = "delete from board_editor where num = ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			res = ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

}
