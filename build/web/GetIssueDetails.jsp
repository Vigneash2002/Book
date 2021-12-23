<%-- 
    Document   : GetIssueDetails
    Created on : Dec 23, 2021, 7:59:48 AM
    Author     : nsivaakumaar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKCT|Upload Book</title>
    <style>  
        body{  
            font-family: Calibri, Helvetica, sans-serif;  
            background-image: url('Library.gif');  
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }  
        .container {  
            padding: 50px;  
            background-image: url('Images/book.gif');   
            background-size: cover;
        }  

        input[type=text],button{  
            width: 100%;  
            padding: 15px;  
            margin: 5px 0 22px 0;  
            display: inline-block;  
            border: none;  
            background: #f1f1f1;  
        }  
        input[type=text]:focus{  
            background-color: orange;  
            outline: none;  
        }  
        .registerbtn { 
            width: 25%;
            margin-left: 38%;
            background-color: #4CAF50;  
            color: white;  
        }   
    </style> 
</head>  
<body>  
    <form name="myForm">  
        <div class="container">  
            <center>  <h1> Add New Book</h1> </center>  
            <center>  <h2> Central Library, SKCT </h2> </center>
            <hr> 
            <br>
            <label> Student details </label> 
            <br><br>
            <%
                String roll_num = request.getParameter("Roll_Number");
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
            %>
            <br><br>
            <label> ISBN Number </label>   
            <br><br>
            <%
                String isbn_number = request.getParameter("ISBN_Number");
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
            %>
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                Calendar c = Calendar.getInstance();
                String issue_date = sdf.format(c.getTime());
                c.add(Calendar.DAY_OF_MONTH, 7);
                String due_date = sdf.format(c.getTime());
            %>
            <br><br>
            <label> Issue Date </label> 
            <%
                out.print("<input type='text' name='Tssue_Date' value='"+issue_date+"' disabled/>");
            %>
            <label> Return Date </label> 
            <%
                out.print("<input type='text' name='Return_Date' value='"+due_date+"' disabled/>");
            %>
            <button type="submit" class="registerbtn">Register</button> 
            <h1></h1>   
    </form> 
    <span id="mylocation"></span> 
</body>  
</html>  
