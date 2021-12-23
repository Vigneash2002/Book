/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DeleteBook;

import AddBook.AddBookBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author nsivaakumaar
 */
public class BookDelete {

    public static boolean delete(AddBookBean ob) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
            String query = "delete from lmsbook where isbn=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, ob.getisbn_number());
            pstmt.executeUpdate();
            con.setAutoCommit(true);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
