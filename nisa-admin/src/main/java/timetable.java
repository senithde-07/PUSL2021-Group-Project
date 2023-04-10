import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "timetable", value = "/timetable")
public class timetable extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String batch = request.getParameter("batch");
        String degree_offerer = request.getParameter("degree");
        String link = request.getParameter("link");
        String sem = request.getParameter("sem");
        try {
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/nisa_admin", "root", "");
            st = con.createStatement();

            // insert the feedback message into the database
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO time_table(batch_number,degree_offerer,timetable_link,year_sem) VALUES(?,?,?,?)");
            ps1.setString(1, batch);
            ps1.setString(2, degree_offerer);
            ps1.setString(3, link);
            ps1.setString(4, sem);
            ps1.executeUpdate();

            String sucessmsg = "Data was entered successfully!!";
            request.setAttribute("message", sucessmsg);
            request.getRequestDispatcher("timetable.jsp").forward(request, response);


        } catch (ClassNotFoundException | SQLException e) {

            PrintWriter out = response.getWriter();
            out.print(e);

        }
    }
}
