package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc:OracleDB");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public Boolean insert(MemberVO vo) throws SQLException {

		String sql = "";

		int result = 0;

		try {

			con = ds.getConnection();

			sql = "insert into member(name,id,pwd,email,phone, cname, usernum) values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getCname());
			pstmt.setInt(7, vo.getUsernum());
			result = pstmt.executeUpdate();

			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}

		return false;

	}

	public Boolean cinsert(MemberVO vo) throws SQLException {

		String sql = "";

		int result = 0;

		try {

			con = ds.getConnection();

			sql = "insert into member(name,id,pwd,email,phone, cname, usernum) values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getCname());
			pstmt.setInt(7, vo.getUsernum());
			result = pstmt.executeUpdate();

			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}

		return false;

	}

	public int loginCheck(String id, String pwd) {

		String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
		int x = 0;

		try {
			// ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
			String sql = "SELECT PWD FROM MEMBER WHERE ID=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
			{
				dbPW = rs.getString("pwd"); // ����� ������ �ִ´�.
				if (dbPW.equals(pwd)) {
					x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������

				} else {
					x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������

				}
			} else {

				x = 0; // �ش� ���̵� ���� ���
			}

			return x;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return x;

	}

	public int idCheck(String id) {
		int result = 0;

		try {

			String sql = "SELECT ID FROM MEMBER WHERE ID=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next() || id.equals("")) {
				result = 0; //�̹� �ִ� ���̵�
			} else {
				result = 1;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}

		return result;
	}
	
	public int emailCheck(String email) {

		int result = 0;

		try {

			String sql = "SELECT EMAIL FROM MEMBER WHERE EMAIL=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next() || email.equals("")) {
				result = 0; //�̹� �ִ� �̸���
			} else {
				result = 1;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}

		return result;
	}
	
	public int pwdCheck(String id, String pwd) {
		int result = 0;
		String dbPwd = "";
		
		try {

			String sql = "SELECT PWD FROM MEMBER WHERE ID=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbPwd = rs.getString("pwd");
				if (pwd.equals(dbPwd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = 0;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		
		return result;
	}
	
	public int emailCheck(String id, String email) {
		int result = 0;
		String dbEmail = "";
		try {

			String sql = "SELECT * FROM MEMBER WHERE ID=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbEmail = rs.getString("email");
				if(email.equals(dbEmail)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = 0;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		
		return result;
	}
	
	public void delete(String id) {
		try {
			String sql = "delete FROM MEMBER WHERE ID=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	
	}
	
	public String idSearch(String name, String email, String phone) {
		
		String result = "";
		
		try {
			String sql = "select id from member where name=? and email=? and phone=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("id");
			} else {
				result = "";
			}
			

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		
		return result;
	}
	
	public String pwdSearch(String name, String id, String email, String phone) {
		
		String result = "";
		
		try {
			String sql = "select * from member where name=? and id=? and email=? and phone=?";

			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString("pwd");
			} else {
				result = "";
			}
			

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		
		return result;
	}

}