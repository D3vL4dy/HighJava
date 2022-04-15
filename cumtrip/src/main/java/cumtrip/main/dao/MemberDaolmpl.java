package cumtrip.main.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import cumtrip.util.SqlMapClientFactory;
import cumtrip.vo.Lo_searchVO;
import cumtrip.vo.MemberVO;


//mapper접근 - SqlMapClient객체가 필요
//dao클래스 객체 생성 - 리턴 - service에서 사용


public class MemberDaolmpl implements IMemberDao {

	private SqlMapClient client;
	private static IMemberDao dao;
	
	private MemberDaolmpl() {
		client = SqlMapClientFactory.getsqlMapClient();
	}
	
	public static IMemberDao getInstance() {
		if( dao == null ) dao = new MemberDaolmpl();
		return dao;
	}
	


	

	@Override
	public List<MemberVO> Count(String id) throws SQLException {

		return client.queryForList("member.memberCount", id);
	}


	
	
	@Override
	public String insert(MemberVO vo) throws SQLException {

			return (String)client.insert("member.memberInsert", vo);
		}
	
	//로그인
	public List<MemberVO> getMember(MemberVO memVo)throws SQLException{
		return client.queryForList("member.memberLogin", memVo);
	
	}

	@Override
	public List<Lo_searchVO> getSido(Lo_searchVO sidoVo){
		
		return client.queryForList("main.sidomain",sidoVo);
	}
	
	
//	public MemberVO getMember(MemberVO memVo){
//		MemberVO returnMemberVo = null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBUtil3.getConnection();
//			
//			String sql = "select * from mymember where mem_id=? and mem_pass=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, memVo.getMem_id());
//			pstmt.setString(2, memVo.getMem_pass());
//
//			/*
//			 * select * from mymember
//				where mem_id='입력한ID' and mem_pass='입력한 pass';
//				
//				위의 쿼리문을 처리한 결과를 반환하도록 구현한다.
//			 * 
//			*/
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				returnMemberVo = new MemberVO();
//				returnMemberVo.setMem_id(rs.getString("mem_id"));
//				returnMemberVo.setMem_name(rs.getString("mem_name"));
//				returnMemberVo.setMem_pass(rs.getString("mem_pass"));
//				returnMemberVo.setMem_tel(rs.getString("mem_tel"));
//				returnMemberVo.setMem_addr(rs.getString("mem_addr"));
//			}
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//			returnMemberVo = null;
//		}finally {
//			if(rs!=null) try {rs.close(); }catch(SQLException e){}
//			if(pstmt!=null) try {pstmt.close(); }catch(SQLException e){}
//			if(conn!=null) try {conn.close(); }catch(SQLException e){}
//		}
//		
//		return returnMemberVo;
//		
//		
//	}
	
	
	
	
	
	
	}







