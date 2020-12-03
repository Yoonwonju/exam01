package exam_01_02;

import java.sql.Connection;

import exam_01_02.ds.JdbcUtill;

public class TestMain {

	public static void main(String[] args) {
		Connection con = JdbcUtill.getConnection();
		System.out.println(con);
	}

}
