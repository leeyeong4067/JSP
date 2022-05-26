package cs.dit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class loginDao {
	private Connection getConnection() throws Exception {
		//DBCP로 변경
    	Context initCtx = new InitialContext();
    	Context envCtx = (Context)initCtx.lookup("java:comp/env");
    	DataSource ds = (DataSource)envCtx.lookup("jdbc/jylee");
    	Connection con = ds.getConnection();
    	
		return con;
	}
	public void insert(loginDto dto) {
		
		String sql = "insert into login(id, pwd, name) values(?, ?, ?)";
		
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
		
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPwd());
		pstmt.setString(3, dto.getName());
		
		int i = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int checkUser(String id, String pwd) {
		
		String sql = "select pwd from login where id=? and pwd=?";
		int check = 0;
		
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setNString(1, id);
			pstmt.setNString(2, pwd);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					check=1;
				} else {
					check=0;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
		
	public ArrayList<loginDto> list() {
		ArrayList<loginDto> dtos = new ArrayList<loginDto>();
		String sql = "select id, name, pwd from login";
		
		try (Connection con = getConnection();
			Statement stmt = con.createStatement();
		){
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				//1. rs 에서 데이터를 가져온다
				loginDto dto = new loginDto();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
				//2. 가져온 데이터를 loginDto로 만든다
				//3  loginDto를 ArrayList에 추가한다.
				dtos.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dtos;
		
	}
}
