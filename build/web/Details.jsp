<%-- 
    Document   : Details
    Created on : Dec 22, 2021, 10:45:06 AM
    Author     : nsivaakumaar
--%>
<%@ page import="java.sql.*" %>  
<%
    String isbn_number = request.getParameter("val");
    if (isbn_number == null || isbn_number.trim().equals("")) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
            PreparedStatement ps = con.prepareStatement("select isbn,book,fname,lname,total,reserve,available ,category from lmsbook");
            ResultSet rst = ps.executeQuery();

            if (!rst.isBeforeFirst()) {
                out.println("<p>No Book Found!</p>");
            } else {
                out.print("<table border='1' cellpadding='2' width='100%'");
                out.print("<tr style='background-color:white'>");
                out.print("<tr style='background-color:white'><th>ISBN Number</th><th>Book Name</th><th>Author First Name</th><th>Author Last Name</th><th>Total Copies</th><th>Reserve Copies</th><th>Available Copies</th><th>Category</th></tr>");
                while (rst.next()) {
                    out.print("<tr style='background-color:white'><td>" + rst.getString(1) + "</td><td>" + rst.getString(2) + "</td><td>" + rst.getString(3) + "</td> <td>" + rst.getString(4) + "</td> <td>" + rst.getString(5) + "</td> <td>" + rst.getString(6) + "</td> <td>" + rst.getString(7) + "</td> <td>" + rst.getString(8) + "</td></tr>");
                }
                out.print("</tr>");
                out.print("</table>");
            }//end of else for rst.isBeforeFirst  
            con.close();
        } catch (Exception e) {
            out.print(e);
        }
    } else {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
            String query = "select isbn,book,fname,lname,total,reserve,available ,category from lmsbook where isbn=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, isbn_number);
            ResultSet rst = pstmt.executeQuery();

            if (!rst.isBeforeFirst()) {
                out.println("<p>No Book Found!</p>");
            } else {
                out.print("<table border='1' cellpadding='2' width='100%'>");
                out.print("<tr style='background-color:white'>");
                out.print("<tr style='background-color:white'><th>ISBN Number</th><th>Book Name</th><th>Author First Name</th><th>Author Last Name</th><th>Total Copies</th><th>Reserve Copies</th><th>Available Copies</th><th>Category</th></tr>");
                while (rst.next()) {
                    out.print("<tr style='background-color:white'><td>" + rst.getString(1) + "</td><td>" + rst.getString(2) + "</td><td>" + rst.getString(3) + "</td> <td>" + rst.getString(4) + "</td> <td>" + rst.getString(5) + "</td> <td>" + rst.getString(6) + "</td> <td>" + rst.getString(7) + "</td> <td>" + rst.getString(8) + "</td></tr>");
                }
                out.print("</tr>");
                out.print("</table>");
            }//end of else for rst.isBeforeFirst  
            con.close();
        } catch (Exception e) {
            out.print(e);
        }
    }//end of else  
%>  

