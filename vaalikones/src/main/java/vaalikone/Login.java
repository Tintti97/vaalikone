package vaalikone;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Login extends HttpServlet {
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //Testi kommentti
        
        //Saadaan parametrit login.jsp sivulta testi
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        
        //k‰ytet‰‰n k‰ytt‰j‰tunnukset validointiohjelmassa, jos menee l‰pi niin ohjataan admin sivulle
        if(Validate.checkUser(email, pass))
        {
            RequestDispatcher rs = request.getRequestDispatcher("AdminPage.jsp");
            rs.forward(request, response);
        }
        //jos k‰ytt‰j‰tunnukset ei t‰sm‰‰ niin n‰ytet‰‰n "error" viesti
        else
        {
           out.println("V‰‰r‰ s‰hkˆpostiosoite tai salasana!");
           RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
           rs.include(request, response);
        }
    }  
}