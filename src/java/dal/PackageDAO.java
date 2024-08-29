package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Package;

public class PackageDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public List<Package> getAll() {
        List<Package> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [Package]";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                Package nd = new Package(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all Packages", e);
        }
        return list;
    }

    public void addPackage(String description, double price, String duration, String start_date, String end_date, String included_services, String itinerary, int number_of_people, String image_url) {
        String sql = "INSERT INTO [Package] (package_id, description, price, duration, start_date, end_date, included_services, itinerary, number_of_people, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PackageDAO packageDAO = new PackageDAO();
        List<Package> list = packageDAO.getAll();
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            int newPackageId = list.get(list.size() - 1).getPackage_id() + 1;
            pstmt.setInt(1, newPackageId);
            pstmt.setString(2, description);
            pstmt.setDouble(3, price);
            pstmt.setString(4, duration);
            pstmt.setString(5, start_date);
            pstmt.setString(6, end_date);
            pstmt.setString(7, included_services);
            pstmt.setString(8, itinerary);
            pstmt.setInt(9, number_of_people);
            pstmt.setString(10, image_url);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Package> searchPackagesByDestination(String destinationName) {
        List<Package> packages = new ArrayList<>();
        String sql = "SELECT p.* FROM Package p "
                + "JOIN Package_Destination pd ON p.package_id = pd.package_id "
                + "JOIN Destination d ON pd.destination_id = d.destination_id "
                + "WHERE d.name LIKE ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "%" + destinationName + "%");
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Package pack = new Package();
                    pack.setPackage_id(rs.getInt("package_id"));
                    pack.setDescription(rs.getString("description"));
                    pack.setPrice(rs.getDouble("price"));
                    pack.setDuration(rs.getString("duration"));
                    pack.setStart_date(rs.getString("start_date"));
                    pack.setEnd_date(rs.getString("end_date"));
                    pack.setIncluded_services(rs.getString("included_services"));
                    pack.setItinerary(rs.getString("itinerary"));
                    pack.setNumber_of_people(rs.getInt("number_of_people"));
                    pack.setImage_url(rs.getString("image_url"));
                    packages.add(pack);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return packages;
    }

    public Package findPackage(int package_id) {
        String sql = "SELECT * FROM [Package] WHERE package_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, package_id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String duration = rs.getString("duration");
                String start_date = rs.getString("start_date");
                String end_date = rs.getString("end_date");
                String included_services = rs.getString("included_services");
                String itinerary = rs.getString("itinerary");
                int number_of_people = rs.getInt("number_of_people");
                String image_url = rs.getString("image_url");

                Package aPackage = new Package();
                aPackage.setPackage_id(package_id);
                aPackage.setDescription(description);
                aPackage.setPrice(price);
                aPackage.setDuration(duration);
                aPackage.setStart_date(start_date);
                aPackage.setEnd_date(end_date);
                aPackage.setIncluded_services(included_services);
                aPackage.setItinerary(itinerary);
                aPackage.setNumber_of_people(number_of_people);
                aPackage.setImage_url(image_url);

                return aPackage;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updatePackage(int package_id, int numberOfPeople, String description, double price) {
        String sql = "UPDATE [Package] SET number_of_people = ?, description = ?, price = ? WHERE package_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, numberOfPeople);
            pstmt.setString(2, description);
            pstmt.setDouble(3, price);
            pstmt.setInt(4, package_id);

            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deletePackage(int package_id) {
        String sql = "DELETE FROM [Package] WHERE package_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, package_id);

            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) {
//        PackageDAO pac = new PackageDAO();
//        List<Package> packages = pac.searchPackagesByDestination("Thai");
//        for (int i = 0; i < packages.size(); i++){
//            System.out.println(packages.get(i).getPackage_id());
//        }
//        
//    }
//    public boolean checkLogin(String your_name, String password) {
//        String sql = "SELECT * FROM [Package] WHERE (Email = ? OR Packagename = ?) AND password = ?";
//        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
//            pstmt.setString(1, your_name);
//            pstmt.setString(2, your_name);
//            pstmt.setString(3, password);
//            try (ResultSet rs = pstmt.executeQuery()) {
//                return rs.next();
//            }
//        } catch (SQLException e) {
//            LOGGER.log(Level.SEVERE, "Error checking login", e);
//            return false;
//        }
//    }
}
