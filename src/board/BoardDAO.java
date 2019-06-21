package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.DBConnectionMgr;

public class BoardDAO {
	DBConnectionMgr mgr;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	BoardDTO dto = null;
	int res;
	String sql = null;

	public BoardDAO() {
		mgr = DBConnectionMgr.getInstance();

	}

	public ArrayList<BoardDTO> makeList(ResultSet rs) throws Exception {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		while (rs.next()) {
			dto = new BoardDTO();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setPreface(rs.getString("preface"));
			dto.setSubject(rs.getString("subject"));
			dto.setContent(rs.getString("content"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setGood(rs.getInt("good"));
			list.add(dto);
		}
		return list;
	}

	public ArrayList<BoardDTO> listBoard() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		sql = "select * from board order by num desc";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
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

	public ArrayList<BoardDTO> listBoard_life() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		sql = "select * from board where preface = '일상' order by num desc";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
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

	public ArrayList<BoardDTO> listBoard_reco() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		sql = "select * from board where preface = '추천' order by num desc";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
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

	public ArrayList<BoardDTO> listBoard_quest() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		sql = "select * from board where preface = '질문' order by num desc";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
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

	public ArrayList<BoardDTO> search(String select, String keyword) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		sql = "select * from board where " + select + " like '%" + keyword + "%' order by num desc";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
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

	public BoardDTO selectSubject(String fromSubject, int num) {
		if (!(fromSubject == null || fromSubject.trim().equals(""))) { // 제목을 눌러서 게시글 확인할때만 조회수 증가
			readCountPlus(num);
		}
		sql = "select * from board where num = ?";
		BoardDTO dto = new BoardDTO();
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setPreface(rs.getString("preface"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setGood(rs.getInt("good"));
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
		sql = "update board set readcount = readcount + 1 where num = ? ";
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

	public int insertBoard(BoardDTO dto) {
		sql = "insert into board values(null,?,?,?,?,current_timestamp, 0, 0)";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPreface());
			ps.setString(3, dto.getSubject());
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

	public int updateBoard(BoardDTO dto) {
		sql = "update board set preface = ?, subject = ?, content = ? where num = ?";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPreface());
			ps.setString(2, dto.getSubject());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getNum());
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
		sql = "delete from board where num = ?";
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

	public int plusGood(int num) { // 추천수 증가
		sql = "update board set good = good + 1 where num = ?";
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

	public ArrayList<BoardPopularDTO> listPopular(String popularDate) {
		ArrayList<BoardPopularDTO> list = new ArrayList<>();
		BoardPopularDTO bpdto = null;
		sql = "select num, nullif(good, 0) as good_chk from board where reg_date like ('" + popularDate
				+ "%') order by good desc limit 3";
		try {
			con = mgr.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			for (int i = 0; i < 3; i++) {
				if (rs.next()) {
					bpdto = new BoardPopularDTO();
					bpdto.setNum(rs.getInt("num"));
					bpdto.setGood_chk(rs.getInt("good_chk"));
					list.add(bpdto);
				} else {
					bpdto = new BoardPopularDTO();
					bpdto.setNum(0);
					bpdto.setGood_chk(0);
					list.add(bpdto);
				}
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
		return list;
	}
}
