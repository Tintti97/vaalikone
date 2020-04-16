package vaalikone;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Register extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        try {
            //Tehdään yhteys databaseen
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "root", "Qwerty1!");
            //Valmistellaan sql-komento
            String sql = "INSERT INTO admins (email, password) VALUES (?, ?)";
            //luodaan komento
            PreparedStatement ps = con.prepareStatement(sql);
            // annetaan arvot sähköposti sekä MD5 -salauksen luona käytetty salasana
            ps.setString(1, email);
            ps.setString(2, (MD5.getMd5(pass)));
            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("Uusi admin käyttäjä luotu!");
                RequestDispatcher rs = request.getRequestDispatcher("AdminPage.jsp");
                rs.forward(request, response);
            }

        } catch (Exception se) {
            se.printStackTrace();
        }

    }
}