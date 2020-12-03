package exam_01_02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exam_01_02.ds.JdbcUtill;
import exam_01_02.dto.Sale;

public class SaleDao {

	// SingleTon
	
	private static SaleDao instance = new SaleDao();

	private SaleDao() {
		super();
	}

	public static SaleDao getInstance() {
		return instance;
	}
	
	// 회원 전체 매출 조회
	public List<Sale> selectSaleByAll(){
		String sql = "select custno, custname, grade, total\r\n" + 
				"  from vw_sale";
		try(Connection con = JdbcUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				List<Sale> list = new ArrayList<Sale>();
				do {
					list.add(getSale(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Sale getSale(ResultSet rs) throws SQLException {
		int custNo = rs.getInt("custno");
		String custName = rs.getString("custname");
		String grade = rs.getString("grade");
		int total = rs.getInt("total");
		
		return new Sale(custNo, custName, grade, total);
	}
}
