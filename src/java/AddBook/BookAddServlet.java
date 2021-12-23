/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddBook;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nsivaakumaar
 */
@WebServlet("/BookAddServlet")
public class BookAddServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            AddBookBean ob = new AddBookBean();
            ob.setisbn_number(request.getParameter("ISBN_Number"));
            ob.setauthor_first_name(request.getParameter("Author_First_Name"));
            ob.setauthor_last_name(request.getParameter("Author_Last_Name"));
            ob.settotal_copies(request.getParameter("Total_Copies"));
            ob.setavailable_copies(request.getParameter("Available_Copies"));
            ob.setcategory(request.getParameter("Category"));
            ob.setreserve_copies(request.getParameter("Reserve_Copies"));
            ob.setbook_name(request.getParameter("Book_Name"));
            if(AddBook.insert(ob)){
                response.sendRedirect("AddBookSuccess.html");
            }
            else{
                response.sendRedirect("AddBookFail.html");
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
