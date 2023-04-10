import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "prob.solved", value = "/prob.solved")
public class probsolved extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out=response.getWriter();
        String student_id = request.getParameter("id");

        // db configurations
        Connection con = null;
        Statement st = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/nisa_admin", "root", "");
            st = con.createStatement();
            PreparedStatement ps1 = con.prepareStatement("UPDATE problem SET status = 'ok' WHERE student_id=?;");
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
