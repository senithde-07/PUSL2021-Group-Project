import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession empsession = request.getSession();
        PrintWriter out = response.getWriter();

        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            //response.sendRedirect("/date_time.jsp");
            String HashedPassword = null;
            // MessageDigest instance for MD5.
            MessageDigest m = MessageDigest.getInstance("MD5");
            // Add plain-text password bytes to digest using MD5 update() method.
            m.update(password.getBytes());
            // Convert the hash value into bytes
            byte[] bytes = m.digest();
            // The bytes array has bytes in decimal form. Converting it into hexadecimal format.
            StringBuilder s = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            // Complete hashed password in hexadecimal format
            HashedPassword = s.toString();

            // db configurations
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin_account WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, HashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String name= rs.getString("name");
                request.getSession().setAttribute("name", name);
                empsession.setAttribute("email", email);
                response.sendRedirect("index.jsp");

            } else {
                String message = "Invalid email or password!";
                request.setAttribute("message", message);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | NoSuchAlgorithmException | SQLException e) {

            out.print(e);


        }
    }
}
