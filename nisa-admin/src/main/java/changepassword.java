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

@WebServlet(name = "changepassword", value = "/changepassword")
public class changepassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out=response.getWriter();
        HttpSession empsession = request.getSession(false);
        String sessionmail = (String) empsession.getAttribute("email");
        String CurrentPw = request.getParameter("currentpw");
        String NewPw = request.getParameter("newpw");

        try {

            String HashedCurrentPassword = null;
            // MessageDigest instance for MD5.
            MessageDigest m = MessageDigest.getInstance("MD5");
            // Add plain-text password bytes to digest using MD5 update() method.
            m.update(CurrentPw.getBytes());
            // Convert the hash value into bytes
            byte[] bytes = m.digest();
            // The bytes array has bytes in decimal form. Converting it into hexadecimal format.
            StringBuilder s = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            // Complete hashed password in hexadecimal format
            HashedCurrentPassword = s.toString();


            // db configurations
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT email FROM admin_account WHERE email=? AND password=?");
            ps.setString(1, sessionmail);
            ps.setString(2, HashedCurrentPassword);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String HashedNewPassword = null;
                // MessageDigest instance for MD5.
                MessageDigest m1 = MessageDigest.getInstance("MD5");
                // Add plain-text password bytes to digest using MD5 update() method.
                m1.update(NewPw.getBytes());
                // Convert the hash value into bytes
                byte[] bytes1 = m1.digest();
                // The bytes array has bytes in decimal form. Converting it into hexadecimal format.
                StringBuilder s1 = new StringBuilder();
                for (int i = 0; i < bytes1.length; i++) {
                    s1.append(Integer.toString((bytes1[i] & 0xff) + 0x100, 16).substring(1));
                }
                // Complete hashed password in hexadecimal format
                HashedNewPassword = s1.toString();

                PreparedStatement ps1 = con.prepareStatement("UPDATE admin_account SET password=? WHERE email=?");
                ps1.setString(1, HashedNewPassword);
                ps1.setString(2, sessionmail);

                int rowsAffected = ps1.executeUpdate();

                if (rowsAffected > 0) {
                    String message = "Password Changed Sucessfully!";
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("password.jsp").forward(request, response);

                } else {
                    String message = "Password Changing Failed!";
                    request.setAttribute("errmessage", message);
                    request.getRequestDispatcher("password.jsp").forward(request, response);

                }


            } else {
                String message = "Invalid current password!";
                request.setAttribute("errmessage", message);
                request.getRequestDispatcher("password.jsp").forward(request, response);
            }


        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException e) {

            out.print(e);
        }


    }
}
