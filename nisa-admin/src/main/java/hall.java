import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "hall", value = "/hall")
public class hall extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String date = request.getParameter("date");
        String link = request.getParameter("link");
        try {
            Connection con = null;
            Statement st = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            st = con.createStatement();

            // insert the feedback message into the database
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO daily_hall_allocation VALUES(?,?)");
            ps1.setString(1, date);
            ps1.setString(2, link);
            ps1.executeUpdate();

            String sucessmsg = "Data was entered successfully!!";
            request.setAttribute("message", sucessmsg);
            request.getRequestDispatcher("hall.jsp").forward(request, response);


        } catch (ClassNotFoundException | SQLException e) {

            PrintWriter out = response.getWriter();
            out.print(e);

        }
    }
}
