package com.cos.board.config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Test {
	public void 데이터추가() {
		Connection conn = null;
		
		try {
			PreparedStatement ps = conn.prepareStatement("insert");
			ps.executeUpdate();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
}
