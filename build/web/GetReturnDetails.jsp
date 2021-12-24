<%-- 
    Document   : newjspGetReturnDetails
    Created on : Dec 24, 2021, 8:42:36 AM
    Author     : nsivaakumaar
--%>

<%@page import="ReturnBook.ReturnBookBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    <form name="myForm" action="ReturnBookServlet" method="post">  
        <div class="container">  
            <center>  <h1> Issue Book</h1> </center>  
            <center>  <h2> Central Library, SKCT </h2> </center>
            <hr>
            <label> Roll Number </label>    
            <%
                String roll_number = request.getParameter("Roll_Number");
                out.print("<input type='text' name='roll_number'  placeholder='Roll Number' value='"+roll_number+"' readonly='readonly'/>");
            %>
            <br>
            <label> Student details </label> 
            <br><br>
            <%
                String roll_num = request.getParameter("Roll_Number");
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
                    String query = "select fname,lname,mobile,emailid from user_details where rollno=?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setString(1, roll_num);
                    ResultSet rst = pstmt.executeQuery();

                    if (!rst.isBeforeFirst()) {
                        out.println("<p>No Student Found!</p>");
                    } else {
                        out.print("<table border='1' cellpadding='2' width='100%'>");
                        out.print("<tr style='background-color:white'>");
                        out.print("<tr style='background-color:white'><th>First Name</th><th>Last Name</th><th>Mobile No</th><th>Email</th></tr>");
                        while (rst.next()) {
                            out.print("<tr style='background-color:white'><td>" + rst.getString(1) + "</td><td>" + rst.getString(2) + "</td> <td>" + rst.getString(3) + "</td> <td>" + rst.getString(4) + "</td></tr>");
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
            <label> Book Details </label>   
            <br><br>
            <%
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
                    String query = "select isbn,issue,due from bookmanage where rollno=?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setString(1, roll_number);
                    ResultSet rst = pstmt.executeQuery();
                    out.print("<table border='1' cellpadding='2' width='100%'>");
                    out.print("<tr style='background-color:white'>");
                    out.print("<tr style='background-color:white'><th>ISBN Number</th><th>Book Name</th><th>Author First Name</th><th>Author Last Name</th><th>Issue Date</th><th>Due Date</th></tr>");    
                    while (rst.next()) {
                        ReturnBookBean ob = new ReturnBookBean();
                        ob.setisbn_number(rst.getString("isbn"));
                        ob.setissue_date(rst.getString("issue"));
                        ob.setdue_date(rst.getString("due"));
                        try {
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
                            String query1 = "select book,fname,lname from lmsbook where isbn=?";
                            PreparedStatement pstmt1 = con.prepareStatement(query1);
                            pstmt1.setString(1, ob.getisbn_number());
                            ResultSet rst1 = pstmt1.executeQuery();
                            while (rst1.next()) {
                                ob.setbook_name(rst1.getString("book"));
                                ob.setauthor_first_name(rst1.getString("fname"));
                                ob.setauthor_last_name(rst1.getString("lname"));
                            }
                            conn.close();
                        } catch (Exception ex) {
                            System.out.println(ex);
                        }
                        out.print("<tr style='background-color:white'><td>" + ob.getisbn_number() + "</td><td>" + ob.getbook_name() + "</td><td>" +ob.getauthor_first_name() + "</td> <td>" + ob.getauthor_last_name() + "</td> <td>" + ob.getissue_date() + "</td> <td>" + ob.getdue_date() + "</td></tr>");          
                    }
                    out.print("</tr>");
                    out.print("</table>");
                    con.close();
                } catch (Exception ex) {
                    System.out.println(ex);
                }
            %>
            <br><br>
            <label> ISBN Number </label>   
            <input type="text" name="ISBN_Number" placeholder= "ISBN Number" onkeyup="searchBookInfo()" size="6" pattern="^(\w{2})+(\d{4})$" required oninvalid="this.setCustomValidity('ISBN Number must contain 2 characters and 4 digits')" oninput="this.setCustomValidity('')"/>   
            <button type="submit" class="registerbtn">Return</button> 
            <h1></h1>   
    </form> 
    <span id="mylocation"></span> 
</body>  
</html>  

