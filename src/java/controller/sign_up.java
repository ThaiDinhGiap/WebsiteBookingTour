/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CustomerDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.User;

import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author admin
 */
public class sign_up extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String rePass = request.getParameter("re_pass");

        if (name == null || email == null || phone == null || pass == null || rePass == null
                || name.isEmpty() || email.isEmpty() || phone.isEmpty() || pass.isEmpty() || rePass.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (!pass.equals(rePass)) {
            request.setAttribute("error", "Passwords do not match.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (pass.length() <= 6) {
            request.setAttribute("error", "Password must be longer than 6 characters.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        CustomerDAO account = new CustomerDAO();
        List<User> listCus = account.getAll();

        for (User user : listCus) {
            if (user.getEmail().equals(email)) {
                request.setAttribute("error", "Email already exists.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
                return;
            }
            if (user.getPhoneNumber().equals(phone)) {
                request.setAttribute("error", "Phone number already exists.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }

        String otp = String.valueOf(new Random().nextInt(900000) + 100000);

        sendOtpEmail(email, otp);

        request.getSession().setAttribute("name", name);
        request.getSession().setAttribute("email", email);
        request.getSession().setAttribute("phone", phone);
        request.getSession().setAttribute("pass", pass);
        request.getSession().setAttribute("otp", otp);

        response.sendRedirect("verify_otp.jsp");
    }

    private void sendOtpEmail(String email, String otp) {
        String to = email;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); 
        props.put("mail.smtp.port", "587"); 
        props.put("mail.smtp.auth", "true"); 
        props.put("mail.smtp.starttls.enable", "true"); 

        String user = "giaptdhe186094@fpt.edu.vn";
        String password = "voqfdcwtvasoucxx"; 

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Your OTP Code");
            message.setText("Your OTP code is: " + otp);

            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
