/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddBook;

/**
 *
 * @author nsivaakumaar
 */
import java.io.*;
import java.sql.*;

public class AddBook {
    public static boolean getdetails(AddBookBean ob) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE","system","oracle");
            String query = "select fname from lmsbook where isbn=?";            
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,ob.getisbn_number());
            ResultSet rst = pstmt.executeQuery();
            if (rst.next()) {
                return false;     
            }            
            con.close();
            System.out.println("success");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean insert(AddBookBean ob) {
        if(!getdetails(ob)){
            return false;
        }
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE","system","oracle");
            Statement  st = con.createStatement();
            String query="insert into lmsbook values('"+ob.getisbn_number()+"','"+ob.getbook_name()+"','"+ob.getauthor_first_name()+"','"+ob.getauthor_last_name()+"','"+ob.gettotal_copies()+"','"+ob.getreserve_copies()+"','"+ob.getavailable_copies()+"','"+ob.getcategory()+"')";
            st.executeUpdate(query);
            con.close();
            System.out.println("Success!");
            return true;
        }
        catch(Exception e){
            System.out.println("---------->  "+e);
            return false;
        }
    }
}


