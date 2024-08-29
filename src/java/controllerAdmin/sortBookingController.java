/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.BookingDAO;
import dal.CustomerDAO;
import dal.PackageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import model.Booking;
import model.User;

/**
 *
 * @author admin
 */
public class sortBookingController extends HttpServlet {

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
            out.println("<title>Servlet sortBookingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sortBookingController at " + request.getContextPath() + "</h1>");
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
        PackageDAO pac = new PackageDAO();
        BookingDAO book = new BookingDAO();

        List<Booking> bookList = book.getAll();
        List<User> cusList = new ArrayList<>();
        List<model.Package> pacList = new ArrayList<>();

// Lọc và sắp xếp theo yêu cầu từ người dùng
        String statusFilter = request.getParameter("statusFilter");
        String priceFilter = request.getParameter("priceFilter");

        if (statusFilter != null && !statusFilter.isEmpty()) {
            bookList = bookList.stream()
                    .filter(booking -> booking.getBookingStatus().equalsIgnoreCase(statusFilter))
                    .collect(Collectors.toList());
        }

        for (int i = 0; i < bookList.size(); i++) {
            cusList.add(cus.findCustomer(bookList.get(i).getCustomerID()));
            pacList.add(pac.findPackage(bookList.get(i).getPackageID()));
        }

        if (priceFilter != null && !priceFilter.isEmpty()) {
            if (priceFilter.equals("lowToHigh")) {
                pacList.sort(Comparator.comparing(model.Package::getPrice));
            } else if (priceFilter.equals("highToLow")) {
                pacList.sort(Comparator.comparing(model.Package::getPrice).reversed());
            }
        }

// Cập nhật lại danh sách bookList theo thứ tự của pacList
        List<Booking> sortedBookList = new ArrayList<>();
        for (model.Package pkg : pacList) {
            for (Booking booking : bookList) {
                if (booking.getPackageID() == pkg.getPackage_id()) {
                    sortedBookList.add(booking);
                    break;
                }
            }
        }

// Truyền danh sách đã sắp xếp và các thuộc tính khác tới JSP
        request.setAttribute("cusList", cusList);
        request.setAttribute("pacList", pacList);
        request.setAttribute("bookList", sortedBookList);
        request.setAttribute("lengthList", sortedBookList.size() - 1);

        request.getRequestDispatcher("bookingStaff.jsp").forward(request, response);
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
