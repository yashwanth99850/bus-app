

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;

public class CPUtilsyash {
	private static BasicDataSource bds = null;
	static{
		try {
			bds = new BasicDataSource();
			bds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
			bds.setUrl("jdbc:oracle:thin:@aatrng1.appsassociates.com:1521:VIS");
			bds.setUsername("apps");
			bds.setPassword("apps");
			bds.setInitialSize(4);
			bds.setMaxActive(5);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}	
	public static Connection getLogicalConnection() throws Exception{
		return bds.getConnection(); //returns logical connection
	}
}

