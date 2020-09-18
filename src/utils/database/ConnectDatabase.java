/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Const;

/**
 *
 * @author tuanc
 */
public class ConnectDatabase {

    private static Connection conn;

    public Connection getConn() {
        return conn;
    }

    private ConnectDatabase() {
        if (conn == null) {
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = Const.DB_URL + ";user=" + Const.USER_NAME + ";password=" + Const.PASSWORD;
                conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ReadingBookMS","sa","123456789");
            } catch (SQLException | ClassNotFoundException e) {
                Logger.getLogger(ConnectDatabase.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    public static ConnectDatabase getInstance() {
        return ConnectDatabaseHelp.CONNECT_DATABASE;
    }

    private static class ConnectDatabaseHelp {

        private static final ConnectDatabase CONNECT_DATABASE = new ConnectDatabase();
    }
}
