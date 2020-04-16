package vaalikone;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class PoistaK extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String ehdokas = request.getParameter("id");
       

        try {
            //Tehdään yhteys databaseen
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root", "root");
            //Valmistellaan sql-komento
            //String sql = "INSERT INTO admins (email, password) VALUES (?, ?)";
            String sql = "DELETE FROM EHDOKKAAT WHERE EHDOKAS_ID=?";
            
            //luodaan komento
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ehdokas);
            int i = ps.executeUpdate();
            if (i > 0) {
            	RequestDispatcher rs = request.getRequestDispatcher("Poista.jsp");
                rs.forward(request, response);
            }

        } catch (Exception se) {
            se.printStackTrace();
        }

    }
}