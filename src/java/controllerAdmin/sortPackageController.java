package controllerAdmin;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.PackageDAO;
import model.Package;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author admin
 */
public class sortPackageController extends HttpServlet {

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
            out.println("<title>Servlet sortPackageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sortPackageController at " + request.getContextPath() + "</h1>");
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
        PackageDAO des = new PackageDAO();
        List<Package> pacList = des.getAll();

        HttpSession session = request.getSession(false);
        Integer count4 = (Integer) session.getAttribute("count4");

        if (count4 == null) {
            count4 = 1;
        } else if (count4 == 1) {
            count4 = 2;
        } else if (count4 == 2) {
            count4 = 3;
        } else {
            count4 = 1;
        }

        session.setAttribute("count4", count4);

        if (count4 == 3) {
            pacList = des.getAll();
        } else if (count4 == 1) {
            Collections.sort(pacList, new Comparator<Package>() {
                @Override
                public int compare(Package u1, Package u2) {
                    return Double.compare(u1.getPrice(), u2.getPrice());
                }
            });
        } else {
            Collections.sort(pacList, new Comparator<Package>() {
                @Override
                public int compare(Package u1, Package u2) {
                    return Double.compare(u2.getPrice(), u1.getPrice());
                }
            });
        }

        request.setAttribute("pacList", pacList);
        request.getRequestDispatcher("packageStaff.jsp").forward(request, response);
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
