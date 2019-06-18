package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DBConnectionMgr;

public class BoardCommentDAO {
	DBConnectionMgr mgr;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	BoardCommentDTO dto = null;
	int res;
	String sql = null;
	
	public BoardCommentDAO() {
		mgr = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<BoardCommentDTO> makeList(ResultSet rs) throws Exception{
		ArrayList<BoardCommentDTO> list = new ArrayList<>();
		while(rs.next()) {
			dto = new BoardCommentDTO();
			dto.setNum(rs.getInt("num"));
			dto.setBoard_num(rs.getInt("board_num"));
			dto.setWriter(rs.getString("writer"));
			dto.setContent(rs.getString("content"));
			dto.setReg_date(rs.getString("reg_date"));
			list.add(dto);
		}
		return list;
	}

	public ArrayList<BoardCommentDTO> listComment(int board_num) {
		ArrayList<BoardCommentDTO> list = new ArrayList<>();
		sql = "select * from board_comment where board_num = ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_num);
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
	
	public int insertComment(BoardCommentDTO dto) {
		sql = "insert into board_comment values( (select * from (select count(*) from board_comment where board_num = ?) count )+1 ,?,?,?,current_timestamp)";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getBoard_num());
			ps.setInt(2, dto.getBoard_num());
			ps.setString(3, dto.getWriter());
			ps.setString(4, dto.getContent());
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
