package vaalikone;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class MuokkaaK extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String ehdokas = request.getParameter("id");
        String Snimi = request.getParameter("snimi");
        String Enimi = request.getParameter("enimi");
        String puolue = request.getParameter("puolue");
        String kotip = request.getParameter("kotip");
        String ika = request.getParameter("id");
        String me = request.getParameter("me");
        String mie = request.getParameter("mie");
        String ammatti = request.getParameter("ammatti");
       

        try {
            //Tehdään yhteys databaseen
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root", "Qwerty1!");
            //Valmistellaan sql-komento
            //String sql = "INSERT INTO admins (email, password) VALUES (?, ?)";
            String sql = "UPDATE ehdokkaat SET SUKUNIMI = ?, ETUNIMI = ?, PUOLUE = ?, KOTIPAIKKAKUNTA = ?, IKA = ?, MIKSI_EDUSKUNTAAN = ?, MITA_ASIOITA_HALUAT_EDISTAA = ?, AMMATTI = ? WHERE EHDOKAS_ID = ?";
            
            //luodaan komento
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, Snimi);
            ps.setString(2, Enimi);
            ps.setString(3, puolue);
            ps.setString(4, kotip);
            ps.setString(5, ika);
            ps.setString(6, me);
            ps.setString(7, mie);
            ps.setString(8, ammatti);
            ps.setString(9, ehdokas);
            int i = ps.executeUpdate();
            if (i > 0) {
            	RequestDispatcher rs = request.getRequestDispatcher("Muokkaa.jsp");
                rs.forward(request, response);
            }

        } catch (Exception se) {
            se.printStackTrace();
        }

    }
}