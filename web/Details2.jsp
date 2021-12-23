<%-- 
    Document   : Details2
    Created on : Dec 23, 2021, 7:02:37 AM
    Author     : nsivaakumaar
--%>

<%@ page import="java.sql.*" %>  
<%
    String roll_num = request.getParameter("val");
    if (roll_num == null || roll_num.trim().equals("")) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
            PreparedStatement ps = con.prepareStatement("select rollno,fname,lname,mobile,emailid from user_details");
            ResultSet rst = ps.executeQuery();
            if (!rst.isBeforeFirst()) {
                out.println("<p>No Book Found!</p>");
            } else {
                out.print("<table border='1' cellpadding='2' width='100%'");
                out.print("<tr style='background-color:white'>");
                out.print("<tr style='background-color:white'><th>Roll Number</th><th>First Name</th><th>Last Name</th><th>Mobile No</th><th>Email</th></tr>");
                while (rst.next()) {
                    out.print("<tr style='background-color:white'><td>" + rst.getInt(1) + "</td><td>" + rst.getString(2) + "</td><td>" + rst.getString(3) + "</td> <td>" + rst.getString(4) + "</td> <td>" + rst.getString(5) + "</td></tr>");
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
            String query = "select rollno,fname,lname,mobile,emailid from user_details where rollno=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, roll_num);
            ResultSet rst = pstmt.executeQuery();

            if (!rst.isBeforeFirst()) {
                out.println("<p>No Book Found!</p>");
            } else {
                out.print("<table border='1' cellpadding='2' width='100%'>");
                out.print("<tr style='background-color:white'>");
                out.print("<tr style='background-color:white'><th>Roll Number</th><th>First Name</th><th>Last Name</th><th>Mobile No</th><th>Email</th></tr>");
                while (rst.next()) {
                    out.print("<tr style='background-color:white'><td>" + rst.getInt(1) + "</td><td>" + rst.getString(2) + "</td><td>" + rst.getString(3) + "</td> <td>" + rst.getString(4) + "</td> <td>" + rst.getString(5) + "</td></tr>");
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

