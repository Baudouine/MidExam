
import java.sql.Connection;
import java.sql.DriverManager;

public class TestJdbc {

	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/aucadb";
		String user = "root";
		String password = "root";
		
		try {
			Connection con = DriverManager.getConnection(url, user, password);
			
			if(con != null) System.out.println("Connection Successful!");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
