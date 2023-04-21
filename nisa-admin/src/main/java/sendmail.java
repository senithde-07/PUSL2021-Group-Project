import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.sql.*;
import java.util.Enumeration;
import java.util.Properties;

;

@WebServlet(name = "sendmail", value = "/sendmail")
public class sendmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // send mail
        PrintWriter out = response.getWriter();

        String student_id = request.getParameter("id");
        String msg = request.getParameter("message");

        String domain = "localhost";
        String port = "8080";

        final String username = "nsbmnisa@gmail.com"; // your email
        final String password = "zsffsxjohcsatyss";  // your password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
            while (interfaces.hasMoreElements()) {
                NetworkInterface ni = interfaces.nextElement();
                if ("wlan0".equals(ni.getName())) {
                    Enumeration<InetAddress> addresses = ni.getInetAddresses();
                    while (addresses.hasMoreElements()) {
                        InetAddress address = addresses.nextElement();
                        if (!address.isLinkLocalAddress() && !address.isLoopbackAddress() && address.getAddress().length == 4) {
                            domain = address.getHostAddress();
                        }
                    }
                }
            }


            Connection con = null;
            Statement statement = null;

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://aws.connect.psdb.cloud/nisa_nsbm?sslMode=VERIFY_IDENTITY",
                    "qs4crtkibjprhmu4i9dj",
                    "pscale_pw_f08qdZccW8WsjG2qvf2PpVR4LZu3Nj22jAPkhOlDmf9");
            statement = con.createStatement();

            ResultSet resultSet = null;
            ResultSet resultSet1 = null;
            PreparedStatement ps = con.prepareStatement("SELECT * FROM template_message WHERE message=?");
            ps.setString(1, msg);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String subject = rs.getString(2);

                String sql = "SELECT * FROM student WHERE student_id=" + student_id;
                resultSet = statement.executeQuery(sql);

                if (resultSet.next()) {

                    String email = resultSet.getString("email");

                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(username));
                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse(email));
                    message.setSubject("Regarding " + "'" + subject + "'");
                    message.setText("" +
                            "Dear Student\n"
                            + "\n"
                            + msg + "\n"
                            + "\n"
                            + "Best Regards,\n"
                            + "NSBM Support Team");

                    Transport.send(message);
                    String msg1 = "Email Sent Successfully!!";
                    request.setAttribute("message", msg1);
                    request.getRequestDispatcher("solution.jsp").forward(request, response);
                } else {
                    String msg2 = "Email sending Failed! Please Check the Student ID and try again later!";
                    request.setAttribute("ermessage", msg2);
                    request.getRequestDispatcher("solution.jsp").forward(request, response);
                }
            } else {


                String sql1 = "SELECT * FROM student WHERE student_id=" + student_id;
                resultSet = statement.executeQuery(sql1);

                if (resultSet.next()) {

                    String email = resultSet.getString("email");

                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(username));
                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse(email));
                    message.setSubject("NSBM Support");
                    message.setText("" +
                            "Dear Student\n"
                            + "\n"
                            + msg + "\n"
                            + "\n"
                            + "Best Regards,\n"
                            + "NSBM Support Team");

                    Transport.send(message);
                    String msg1 = "Email Sent Successfully!!";
                    request.setAttribute("message", msg1);
                    request.getRequestDispatcher("solution.jsp").forward(request, response);
                } else {
                    String msg2 = "Email sending Failed! Please Check the Student ID and try again later!";
                    request.setAttribute("ermessage", msg2);
                    request.getRequestDispatcher("solution.jsp").forward(request, response);
                }
            }
        } catch (MessagingException | SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

//        request.getRequestDispatcher(url).forward(request, response);

    }
}
