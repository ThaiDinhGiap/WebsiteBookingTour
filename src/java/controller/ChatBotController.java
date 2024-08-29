package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import dal.CustomerDAO;
import dal.DestinationDAO;
import dal.PackageDAO;
import java.util.Collections;
import java.util.List;
import model.Destination;
import model.Package;
import model.User;
import org.json.JSONArray;

public class ChatBotController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChatBotController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChatBotController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            jsonBuffer.append(line);
        }

        JSONObject jsonObject = new JSONObject(jsonBuffer.toString());
        String category = jsonObject.getString("category");

        JSONObject jsonResponse = new JSONObject();
        switch (category) {
            case "destinations":
                DestinationDAO destinationDAO = new DestinationDAO();
                List<Destination> destinations = destinationDAO.getAll();
                JSONArray names = new JSONArray();
                for (Destination destination : destinations) {
                    names.put(destination.getName());
                }
                jsonResponse.put("title", Collections.singletonList("Please select a destination category"));
                jsonResponse.put("options", names);
                break;
            case "packages":
                PackageDAO packageDAO = new PackageDAO();
                List<Package> packages = packageDAO.getAll();
                JSONArray packageNames = new JSONArray();
                for (Package p : packages) {
                    packageNames.put(p.getDescription());
                }
                jsonResponse.put("title", Collections.singletonList("Please choose a package"));
                jsonResponse.put("options", packageNames);
                break;
            case "contact":
                CustomerDAO cusDAO = new CustomerDAO();
                List<User> supportTeam = cusDAO.getAllAdmin();
                JSONArray admins = new JSONArray();
                for (User us : supportTeam) {
                    JSONObject admin = new JSONObject();
                    admin.put("name", us.getFullName());
                    admin.put("email", us.getEmail());
                    admin.put("phone", us.getPhoneNumber());
                    admins.put(admin);
                }
                jsonResponse.put("title", Collections.singletonList("Contact Support Team"));
                jsonResponse.put("admins", admins);
                break;
            default:
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\":\"Invalid category\"}");
                return;
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
