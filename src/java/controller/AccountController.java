/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BookingDAO;
import dal.CustomerDAO;
import dal.PackageDAO;
import dal.TestimonialDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.Testimonial;
import model.User;

/**
 *
 * @author admin
 */
public class AccountController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userid = (int) session.getAttribute("name");

        CustomerDAO cus = new CustomerDAO();
        User us = cus.findCustomer(userid);
        request.setAttribute("us", us);
        request.setAttribute("avatar_url", us.getAvatar_url());

        TestimonialDAO testi = new TestimonialDAO();
        List<Testimonial> list = testi.getAll();
        List<Testimonial> tes = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getCustomerID() == userid) {
                tes.add(list.get(i));
            }
        }
        request.setAttribute("tes", tes);

        BookingDAO book = new BookingDAO();
        List<Booking> listbook = book.getAll();
        List<Booking> bok = new ArrayList<>();
        for (int i = 0; i < listbook.size(); i++) {
            if (listbook.get(i).getCustomerID() == userid) {
                bok.add(listbook.get(i));
            }
        }
        request.setAttribute("bok", bok);

        PackageDAO pack = new PackageDAO();
        List<model.Package> pac = pack.getAll();
        request.setAttribute("pac", pac);
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        out.print(bok.get(0).getBookingStatus());

        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
