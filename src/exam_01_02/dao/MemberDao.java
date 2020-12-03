package exam_01_02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import exam_01_02.ds.JdbcUtill;
import exam_01_02.dto.Member;

public class MemberDao {
	
	//SingleTon
	private static final MemberDao instance = new MemberDao();

	public MemberDao() {
		super();
	}

	public static MemberDao getInstance() {
		return instance;
	}
	
	//회원 전체 정보 조회
	public List<Member> selectMemberByAll() {
		String sql = "select custno, custname, phone, address, joindate, grade, city from MEMBER_TBL";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				List<Member> list = new ArrayList<Member>();
				do {
					list.add(getMember(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	};
	
	private Member getMember(ResultSet rs) throws SQLException {
		int custNo = rs.getInt("custno");
		String custName = rs.getString("custname");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		Date joinDate = rs.getDate("joindate");
		String grade = rs.getString("grade");
		String city = rs.getString("city");
		
		return new Member(custNo, custName, phone, address, joinDate, grade, city);
	}

	//회원 정보 조회
	public Member selectMemberByNo(int custNo) {
		String sql = "select custno, custname, phone, address, joindate, grade, city from MEMBER_TBL" + 
				" where custno = ?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, custNo);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getMember(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	};
	
	//회원 정보 등록
	public int insertMember(Member member) {
		String sql = "insert into MEMBER_TBL values(member_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, member.getCustName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			//pstmt.setTimestamp(4, new Timestamp(new Date().getTime()));
			// 타입을 TimeStamp로 주었을때는 단순히 ↓
			// Timestamp regDate = rs.getTimestamp("regDate");
			pstmt.setString(4, member.getGrade());
			pstmt.setString(5, member.getCity());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	};
	
	//회원 정보 수정
	public int updateMember(Member member) {
		String sql = "update MEMBER_TBL" + 
				"   set custname=?, phone=?, address=?, joindate=?, grade=?, city=?" + 
				" where custno = ?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, member.getCustName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setTimestamp(4, new Timestamp(new Date().getTime()));
			pstmt.setString(5, member.getGrade());
			pstmt.setString(6, member.getCity());
			pstmt.setInt(7, member.getCustNo());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	};
	
	//회원 정보 삭제
	public int deleteMember(int custNo) {
		String sql = "delete from MEMBER_TBL where custno = ?";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, custNo);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return custNo;
	};
	
	//회원 번호 자동생성
	public int nextCustNo() {
		String sql = "select max(custno) + 1 from MEMBER_TBL";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	};
}
