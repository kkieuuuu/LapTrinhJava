/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Frm;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Admin
 */
public class ConnectDB {
    public Connection getConnection() throws ClassNotFoundException{
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlsever.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433; databaseName = QuanLyBanVeMayBay1";
            String user = "sa";
            String pass = "123";
            conn = DriverManager.getConnection(url,user,pass);
            if(conn != null){
                System.out.println("Ket noi thanh cong!");
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return conn;
    }
}
