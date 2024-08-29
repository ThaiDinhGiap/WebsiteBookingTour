package controller;

import java.io.IOException;
import java.io.PrintWriter;
import dal.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class sign_in extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("your_name");
        String password = request.getParameter("your_pass");
        String remember = request.getParameter("remember-me");

        CustomerDAO account = new CustomerDAO();
        HttpSession session1 = request.getSession();
        session1.invalidate();

        if (account.checkLogin(name, password) != null) {
            HttpSession session2 = request.getSession();
            session2.setAttribute("name", account.checkLogin(name, password));
            CustomerDAO cs = new CustomerDAO();

            Cookie cu = new Cookie("cu", name);
            Cookie cp = new Cookie("cp", password);
            Cookie cr = new Cookie("cr", remember);
            if (remember != null) {
                cu.setMaxAge(60 * 60 * 24 * 7);
                cp.setMaxAge(60 * 60 * 24 * 7);
                cr.setMaxAge(60 * 60 * 24 * 7);
            } else {
                cu.setMaxAge(0);
                cp.setMaxAge(0);
                cr.setMaxAge(0);
            }
            response.addCookie(cu);
            response.addCookie(cp);
            response.addCookie(cr);

            User us = cs.findCustomer(account.checkLogin(name, password));
            session2.setAttribute("us", us);
            session2.setAttribute("full_name", us.getFullName());
            session2.setAttribute("email", us.getEmail());
            session2.setAttribute("isLoggedIn", true);


            if (us.getRoleID() == 1) response.sendRedirect("home");
            else if (us.getRoleID() == 2) request.getRequestDispatcher("homeAdmin").forward(request, response);
        } else {
            request.setAttribute("error", "Invalid username/email or password.");
            request.getRequestDispatcher("sign_in.jsp").forward(request, response);
        }
        out.close();
    }
}
