/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ReturnBook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author nsivaakumaar
 */
public class ReturnBook {
    public static boolean increment(String S) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
            String query = "select available from lmsbook where isbn=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, S);
            ResultSet rst = pstmt.executeQuery();
            int c;
            if (rst.next()) {
                c = Integer.parseInt(rst.getString("available"));
                if (c == 0) {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
                    String query1 = "update lmsbook set available=? where isbn=?";
                    PreparedStatement pstmt1 = con.prepareStatement(query1);
                    c++;
                    System.out.println(c);
                    pstmt1.setString(1, String.valueOf(c));
                    pstmt1.setString(2, S);
                    pstmt1.executeUpdate();
                    conn.setAutoCommit(true);
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "@@@@@@@@@@@@@@@" + ex.toString());
            return false;
        }
        return true;
    }
    public static boolean bookreturn(ReturnBookBean ob){
        ReturnBook.increment(ob.getisbn_number());
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
            String query = "delete from bookmanage where isbn=? and rollno=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, ob.getisbn_number());
            pstmt.setString(2, ob.getroll_number());
            pstmt.executeUpdate();
            con.setAutoCommit(true);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
