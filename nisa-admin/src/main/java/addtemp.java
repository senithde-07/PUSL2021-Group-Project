import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "addtemp", value = "/addtemp")
public class addtemp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String temp_name = request.getParameter("name");
        String message = request.getParameter("message");
        try {
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            st = con.createStatement();

            // insert the feedback message into the database
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO template_message (template_name, message) VALUES(?,?)");
            ps1.setString(1, temp_name);
            ps1.setString(2, message);
            ps1.executeUpdate();

            String sucessmsg = "Template was entered successfully!!";
            request.setAttribute("message", sucessmsg);
            request.getRequestDispatcher("mail.jsp").forward(request, response);


        } catch (ClassNotFoundException | SQLException e) {

            PrintWriter out = response.getWriter();
            out.print(e);

        }
    }
}
