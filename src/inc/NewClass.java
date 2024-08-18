/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inc;
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.SQLException;
    import java.sql.Statement;
    import inc.koneksi;
/**
 *
 * @author Latif
 */
public class NewClass {
    public Connection con=null;
    public ResultSet rs=null;
    public PreparedStatement ps=null;
    public Statement pst=null;
    private String sql;
    
    public ResultSet Totalkasm()throws SQLException{
        con=koneksi.connect();
        sql="SELECT SUM(jumlah) FROM kas_masuk";
        ps= con.prepareStatement(sql);
        rs=ps.executeQuery();
        return rs;
    }
    
    public ResultSet Totalkask()throws SQLException{
        con=koneksi.connect();
        sql="SELECT SUM(jumlah) FROM kas_keluar";
        ps= con.prepareStatement(sql);
        rs=ps.executeQuery();
        return rs;
    }
}


