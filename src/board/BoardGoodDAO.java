package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.DBConnectionMgr;

public class BoardGoodDAO {
	DBConnectionMgr mgr;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	BoardDTO dto = null;
	int res;
	String sql = null;
	
	public BoardGoodDAO() {
		mgr = DBConnectionMgr.getInstance();

	}
	
	public int insertBoardGood(BoardGoodDTO dto) {
		sql = "insert into board_good values(?, ?)";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getUser());
			ps.setInt(1, dto.getBoard_num());
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
