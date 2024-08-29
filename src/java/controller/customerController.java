/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BookingDAO;
import dal.CustomerDAO;
import dal.TestimonialDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author admin
 */
public class customerController extends HttpServlet {

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
            out.println("<title>Servlet customerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet customerController at " + request.getContextPath() + "</h1>");
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
        CustomerDAO cus = new CustomerDAO();
        List<User> cusList = cus.getAll();
        BookingDAO book = new BookingDAO();
        TestimonialDAO tes = new TestimonialDAO();
        request.setAttribute("cusList", cusList);

        List<Integer> numBookApp = new ArrayList<>();
        List<Integer> numBookCan = new ArrayList<>();

        for (int i = 0; i < cusList.size(); i++) {
            numBookApp.add(book.countBookingsApprovedByCustomerID(cusList.get(i).getUserID()));
            numBookCan.add(book.countBookingsCancelledByCustomerID(cusList.get(i).getUserID()));
        }

        List<Integer> numTesApp = new ArrayList<>();
        List<Integer> numTesCan = new ArrayList<>();

        for (int i = 0; i < cusList.size(); i++) {
            numTesApp.add(tes.countTestimonialsApprovedByCustomerID(cusList.get(i).getUserID()));
            numTesCan.add(tes.countTestimonialsCancelledByCustomerID(cusList.get(i).getUserID()));
        }

        request.setAttribute("numTesApp", numTesApp);
        request.setAttribute("numTesCan", numTesCan);
        request.setAttribute("numBookApp", numBookApp);
        request.setAttribute("numBookCan", numBookCan);
        request.setAttribute("lengthList", cusList.size() - 1);
        request.getRequestDispatcher("customer.jsp").forward(request, response);

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
        String nameCus = request.getParameter("nameCus");
        CustomerDAO cus = new CustomerDAO();
        List<User> cusList = cus.findCustomersByName(nameCus);
        request.setAttribute("cusList", cusList);

        request.getRequestDispatcher("customer.jsp").forward(request, response);
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
