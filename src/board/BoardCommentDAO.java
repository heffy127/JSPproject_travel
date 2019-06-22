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
			dto.setComment_num(rs.getInt("comment_num"));
			dto.setBoard_num(rs.getInt("board_num"));
			dto.setWriter(rs.getString("writer"));
			dto.setContent(rs.getString("content"));
			dto.setReg_date(rs.getString("reg_date"));
			list.add(dto);
		}
		return list;
	}

	public int CommentCnt(int board_num) {
		int count = 0;
		sql = "select count(*) from board_comment where board_num = ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, board_num);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
	
	public ArrayList<BoardCommentDTO> listComment(int board_num) {
		ArrayList<BoardCommentDTO> list = new ArrayList<>();
		sql = "select * from comment_count left outer join board_comment on (comment_count.no_comment = board_comment.comment_num) where comment_count.no_board = ?";
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
		sql = "insert into board_comment values(null ,?,?,?,current_timestamp)";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getBoard_num());
			ps.setString(2, dto.getWriter());
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
	
	// 삭제된 댓글까지 목록 생성용
	public int insertCommentCnt(BoardCommentDTO dto) { 
		int chk = insertComment(dto);
		if(chk>0) {
		sql = "insert into comment_count values(?, ?)";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getComment_num());
			ps.setInt(2, dto.getBoard_num());
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
		}else {
			return res = 0;
		}
	}
	

	
	public int deleteComment(BoardCommentDTO dto) {
		sql = "delete from board_comment where comment_num = ? and board_num = ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getComment_num());
			ps.setInt(2, dto.getBoard_num());
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
