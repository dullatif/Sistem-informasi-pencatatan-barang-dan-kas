/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Latif
 */
public class koneksi {

    private static Connection koneksi;
    public static Connection connect() {
    try {
        Class.forName ("com.mysql.cj.jdbc.Driver");
        System.out.println("Berhasil Koneksi");
    } catch (ClassNotFoundException ex) {
        System.out.println("Gagal Koneksi"+ex);
    }
    String URL = "jdbc:mysql://localhost:3306/tugas_akhir";
    try {
        koneksi = DriverManager.getConnection(URL,"root","");
        System.out.println("Berhasil Koneksi Database");
    } catch (SQLException ex) {
        System.out.println("Gagal Koneksi Database"+ex);
    }
    return koneksi;
    }

       
}
