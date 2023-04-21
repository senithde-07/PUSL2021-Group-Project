import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "loadtemp", value = "/loadtemp")
public class loadtemp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String template = request.getParameter("template");

        // db configurations
        Connection con = null;
        Statement st = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            st = con.createStatement();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM template_message WHERE template_name=? ");
            ps.setString(1, template);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String emailmsg = rs.getString("message");
                String subject=rs.getString("template_name");
                request.setAttribute("mail", emailmsg);
                request.setAttribute("subject", subject);
                request.getRequestDispatcher("solution.jsp").forward(request, response);


            } else {

                String message = "Please Select a template to continue!";
                request.setAttribute("ermessage", message);
                request.getRequestDispatcher("/solution.jsp").forward(request, response);
            }

        } catch (IOException | ClassNotFoundException | SQLException e) {

            out.print(e);
        }
    }


}
