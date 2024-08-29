/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerAdmin;

import dal.PackageDAO;
import java.io.IOException;
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

@MultipartConfig
public class addPackage extends HttpServlet {

    public static final String SAVE_DIRECTORY = "img";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các tham số từ request
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String duration = request.getParameter("duration");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String included_services = request.getParameter("included_services");
        String itinerary = request.getParameter("itinerary");
        int number_of_people = Integer.parseInt(request.getParameter("number_of_people"));

        // Lấy đường dẫn upload
        PackageDAO packageDAO = new PackageDAO();
        String uploadDirectory = request.getServletContext().getRealPath("") + File.separator + SAVE_DIRECTORY;
        Part filePart = request.getPart("image_url");

        // Tạo thư mục nếu nó không tồn tại
        Path uploadPath = Paths.get(uploadDirectory);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        if (filePart != null) {
            String fileName = filePart.getSubmittedFileName();
            String filePath = uploadDirectory + File.separator + fileName;
            String uploadDirectoryForSQL = SAVE_DIRECTORY + File.separator + fileName;
            filePart.write(filePath);

            // Thêm package vào database
            packageDAO.addPackage(description, price, duration, start_date, end_date, included_services, itinerary, number_of_people, uploadDirectoryForSQL);
        }
        // Chuyển hướng sau khi thêm thành công
        response.sendRedirect("packageStaffController");
    }

}
