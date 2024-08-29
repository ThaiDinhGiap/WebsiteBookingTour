/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import static controller.avatarController.save_directory;
import dal.DestinationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author admin
 */
@MultipartConfig
public class controlDestinationController extends HttpServlet {

    public static final String save_directory = "img";

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
            out.println("<title>Servlet insertDestinationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insertDestinationController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String desName = request.getParameter("destinationName");
        String desDes = request.getParameter("destinationDescription");
        String desLo = request.getParameter("destinationLocation");

        DestinationDAO des = new DestinationDAO();
        String uploadDirectory = request.getServletContext().getRealPath("") + File.separator + save_directory; //lấy ra đường dẫn của project sau đó vào thư mục Avatar_user_upload
        Part filePart = request.getPart("img"); //lấy ra file theo tên field(trong form html) là file
        // Tạo thư mục nếu nó không tồn tại
        Path uploadPath = Paths.get(uploadDirectory);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }
        if (filePart != null) {
            String fileName = filePart.getSubmittedFileName(); //tạo tên file VD: HE186719_avatar_IMG7073.jpg
            String filePath = uploadDirectory + File.separator + fileName; //File.separator là tạo ra dấu \ (tạo đường dẫn cho file này)
            String uploadDirectoryForSQL = save_directory + File.separator + fileName; //tạo đường dẫn khi lưu vào database(chỉ cần tên folder và tên file)
            filePart.write(filePath); //lưu file vào thư mục theo đường dẫn là filePath
            des.addDestination(desName, desDes, desLo, uploadDirectoryForSQL);
        }
        response.sendRedirect("destinationStaffController");
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
