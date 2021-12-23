<%-- 
    Document   : View
    Created on : Dec 22, 2021, 9:35:50 AM
    Author     : nsivaakumaar
--%>

<%@ page import="java.sql.*" %> 

<%
    String isbn_number = request.getParameter("ISBN_Number");
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "oracle");
        String query = "select isbn,book,fname,lname,total,reserve,available ,category from lmsbook where isbn=?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, isbn_number);
        ResultSet rst = pstmt.executeQuery();
        if (rst.next()) {
            out.println("<html>");
            out.println("<title>SKCT|View Book</title>");
            out.println("<style>");
            out.println("body{");
            out.println("font-family: Calibri, Helvetica, sans-serif;");
            out.println("background-image: url('Library.gif');");
            out.println("background-repeat: no-repeat;");
            out.println("background-attachment: fixed;");
            out.println("background-size: cover;");
            out.println("}");
            out.println(".container {");
            out.println("padding: 50px;");
            out.println("background-image: url('Images/book.gif');");
            out.println("background-size: cover;");
            out.println("}");
            out.println("input[type=text],button{");
            out.println("width: 100%;");
            out.println("padding: 15px;");
            out.println("margin: 5px 0 22px 0;");
            out.println("display: inline-block;");
            out.println("border: none;");
            out.println("background: #f1f1f1;");
            out.println("}");
            out.println("input[type=text]:focus{");
            out.println("background-color: orange;");
            out.println("outline: none;");
            out.println("}");
            out.println(".registerbtn {");
            out.println("background-color: #4CAF50;");
            out.println("color: white;");
            out.println("width: 25%;");
            out.println(" margin-left: 38%;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action='index.html'>");
            out.println("<div class='container'>");
            out.println("<center>  <h1> View Book Details</h1> </center>");
            out.println("<center>  <h2> Central Library, SKCT </h2> </center>");
            out.println("<hr>");
            out.println("<label> ISBN Number </label>");
            out.println("<input type='text' value='"+rst.getString("isbn")+"' name='ISBN_Number' placeholder= 'ISBN Number' size='6' pattern='^([a-zA-Z]{2})+([0-9]{4})$' disabled oninvalid='this.setCustomValidity('ISBN Number must contain 2 characters and 4 digits')' oninput='this.setCustomValidity('')'/>");
            out.println("<label> Book Name </label>");
            out.println("<input type='text' value='"+rst.getString("book")+"' name='Book_Name' placeholder='Book Name' size='15' disabled/>");
            out.println("<label> Author First Name </label>");
            out.println("<input type='text' value='"+rst.getString("fname")+"' name='Author_First_Name' placeholder='Author First Name' size='15' pattern = '^([a-zA-Z]{3,10})$' disabled oninvalid='this.setCustomValidity('First Name must contain atleast 3 charecters')' oninput='this.setCustomValidity('')'/>");
            out.println("<label> Author Last Name </label>");
            out.println("<input type='text' value='"+rst.getString("lname")+"' name='Author_Last_Name'  placeholder='Author Last Name' size='15' pattern = '^([a-zA-Z]{3,10})$' disabled oninvalid='this.setCustomValidity('Last Name must contain atleast 3 charecters')' oninput='this.setCustomValidity('')'/>");
            out.println("<label> Total Copies </label>");
            out.println("<input type='text' value='"+rst.getString("total")+"' name='Total_Copies' placeholder='Total Copies' size='15' pattern = '^[0-9]$' disabled oninvalid='this.setCustomValidity('Total Copies Must be an integer')' oninput='this.setCustomValidity('')'/>");
            out.println("<label> Reserve Copies </label>");
            out.println("<input type='text' value='"+rst.getString("reserve")+"' name='Reserve_Copies'  placeholder='Reserve Copies' size='15' pattern = '^[0-9]$' disabled oninvalid='this.setCustomValidity('Reserve Copies Must be an integer')' oninput='this.setCustomValidity('')'/>");
            out.println("<label> Available Copies </label>");
            out.println("<input type='text' value='"+rst.getString("available")+"' name='Available_Copies'  placeholder='Available Copies' size='15' pattern = '^[0-9]$' disabled oninvalid='this.setCustomValidity('Available Copies Must be an integer')' oninput='this.setCustomValidity('')'/>");
            out.println("<label> Category </label>");
            out.println("<input type='text' value='"+rst.getString("category")+"' name='Category'  placeholder='Category' size='15' pattern = '^([a-zA-Z]{3,10})$' disabled oninvalid='this.setCustomValidity('Category must contain atleast 3 charecters')' oninput='this.setCustomValidity('')'/>");
            out.println("<button type='submit' class='registerbtn'>Go back</button>");
            out.println("<h1></h1>");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
        }
    } catch (Exception ex) {
        System.out.println(ex);
    }
%>  

