/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.BookingStatusDAO;
import dal.BookingDAO;
import dal.PackageDAO;
import dal.TestimonialDAO;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Booking;
import model.BookingStatus;
import model.Testimonial;

/**
 *
 * @author admin
 */
public class homeAdmin extends HttpServlet {

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
        doGet(request, response);
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

        TestimonialDAO tes = new TestimonialDAO();
        int numTes = tes.countNewTestimonial();
        request.setAttribute("numTes", numTes);

        BookingDAO cusBooking = new BookingDAO();
        int numBook = cusBooking.countNewBooking();
        request.setAttribute("numBook", numBook);
        
        PackageDAO pac = new PackageDAO();

        BookingStatusDAO bookSta = new BookingStatusDAO();
        List<BookingStatus> lisStatus = bookSta.doneBookingStatus(userid);
        double totalMoney = 0;
        for (int i = 0; i < lisStatus.size(); i++){
            Booking aBooking = cusBooking.findBooking(lisStatus.get(i).getBookingID());
            totalMoney += pac.findPackage(aBooking.getPackageID()).getPrice();
        }
        request.setAttribute("totalMoney", "$"+totalMoney);
        
        request.getRequestDispatcher("home_staff.jsp").forward(request, response);
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
