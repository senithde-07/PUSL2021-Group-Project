import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "prob-to-solution", value = "/prob-to-solution")
public class probtosolution extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        String student_id = request.getParameter("id");


        // db configurations
        Connection con = null;
        Statement st = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            st = con.createStatement();

            PreparedStatement ps1 = con.prepareStatement("UPDATE problem SET status = 'ok' WHERE student_id=?;");
            ps1.setString(1, student_id);
            ps1.executeUpdate();

            PreparedStatement ps = con.prepareStatement("SELECT template_message.message,template_message.template_name FROM template_message INNER JOIN problem WHERE template_message.template_name=problem.problem AND problem.student_id=?");
            ps.setString(1, student_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String emailmsg = rs.getString(1);
                String subject = rs.getString(2);
                request.setAttribute("subject", subject);
                request.setAttribute("mail", emailmsg);
                request.setAttribute("student_id", student_id);
                request.getRequestDispatcher("solution.jsp").forward(request, response);
            } else {
                String errormsg = "Select a template, or type a message and enter the student ID to send a mail to the required student!";
                request.setAttribute("message", errormsg);
                request.getRequestDispatcher("solution.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
