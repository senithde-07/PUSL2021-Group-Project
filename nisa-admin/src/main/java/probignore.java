import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "prob.ignore", value = "/prob.ignore")
public class probignore extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String student_id = request.getParameter("id");
        PrintWriter out = response.getWriter();

        // db configurations
        Connection con = null;
        Statement st = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            st = con.createStatement();
            PreparedStatement ps1 = con.prepareStatement("UPDATE problem SET status = 'ig' WHERE student_id=?;");
            ps1.setString(1, student_id);
            ps1.executeUpdate();
            response.sendRedirect("problem.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
