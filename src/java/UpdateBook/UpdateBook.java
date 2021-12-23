/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UpdateBook;

import AddBook.AddBookBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;

/**
 *
 * @author nsivaakumaar
 */
public class UpdateBook {
    public static boolean update(AddBookBean ob){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE","system","oracle");
            String query="update lmsbook set book=?,fname=?,lname=?,total=?,reserve=?,available=?,category=? where isbn=?";  
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1,ob.getbook_name());
            pstmt.setString(2,ob.getauthor_first_name());
            pstmt.setString(3,ob.getauthor_last_name());
            pstmt.setString(4,ob.gettotal_copies());
            pstmt.setString(5,ob.getreserve_copies());
            pstmt.setString(6,ob.getavailable_copies());
            pstmt.setString(7,ob.getcategory());
            pstmt.setString(8,ob.getisbn_number());
            pstmt.executeUpdate();
            con.setAutoCommit(true);
            return true;
        }
        catch(Exception ex){
            return false;
        }
    }
}
