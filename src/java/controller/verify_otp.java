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
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author admin
 */
public class verify_otp extends HttpServlet {

    private static final int MAX_ATTEMPTS = 3;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); 
        String otp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("otp");
        Integer attemptsLeft = (Integer) session.getAttribute("attemptsLeft");

        if (sessionOtp == null) {
            request.setAttribute("error", "Session expired. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("verify_otp.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (attemptsLeft == null) {
            attemptsLeft = MAX_ATTEMPTS;
        }

        if (otp.equals(sessionOtp)) {
            User user = new User();
            user.setFullName((String) session.getAttribute("name"));
            user.setEmail((String) session.getAttribute("email"));
            user.setPassword((String) session.getAttribute("pass"));
            user.setPhoneNumber((String) session.getAttribute("phone"));
            
            CustomerDAO customerDAO = new CustomerDAO();
            customerDAO.addCustomer(user.getFullName(), user.getEmail(), user.getPhoneNumber(), user.getPassword());
            
            session.removeAttribute("otp"); 
            session.removeAttribute("attemptsLeft"); 
            session.invalidate(); 

            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        } else {
            attemptsLeft--;
            if (attemptsLeft <= 0) {
                session.invalidate(); 
                request.setAttribute("error", "You have exceeded the maximum number of attempts. Please sign up again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);
            } else {
                session.setAttribute("attemptsLeft", attemptsLeft);
                request.setAttribute("error", "Invalid OTP. You have " + attemptsLeft + " attempts left. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("verify_otp.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
