package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Destination;

public class DestinationDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public List<Destination> getAll() {
        List<Destination> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [Destination]";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                Destination nd = new Destination(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all Destinations", e);
        }
        return list;
    }

    public List<Destination> findDestinationsByName(String name) {
        String sql = "SELECT * FROM [Destination] WHERE name LIKE ?";
        List<Destination> users = new ArrayList<>();

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "%" + name + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int destination_id = rs.getInt("destination_id");
                String name2 = rs.getString("name");
                String description = rs.getString("description");
                String location = rs.getString("location");
                String image_url = rs.getString("image_url");

                Destination user = new Destination();
                user.setDestination_id(destination_id);
                user.setName(name2);
                user.setDescription(description);
                user.setLocation(location);
                user.setImage_url(image_url);

                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return users;
    }

    public void addDestination(String name, String description, String location, String image_url) {
        String sql = "INSERT INTO [Destination] (destination_id, name, description, location, image_url) VALUES (?, ?, ?, ?, ?)";
        DestinationDAO account = new DestinationDAO();
        List<Destination> list = account.getAll();
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, list.get(list.size() - 1).getDestination_id() + 1);
            pstmt.setString(2, name);
            pstmt.setString(3, description);
            pstmt.setString(4, location);
            pstmt.setString(5, image_url);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateDestination(int destination_id, String name, String description, String location) {
        String sql = "UPDATE [Destination] SET name = ?, description = ?, location = ? WHERE destination_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, description);
            pstmt.setString(3, location);
            pstmt.setInt(4, destination_id);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DestinationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteDestination(int destination_id) {
        String sql = "DELETE FROM [Destination] WHERE destination_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, destination_id);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DestinationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public boolean checkLogin(String your_name, String password) {
//        String sql = "SELECT * FROM [Destination] WHERE (Email = ? OR Destinationname = ?) AND password = ?";
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
//    public static void main(String[] args) {
//        DestinationDAO account = new DestinationDAO();
//        List<Destination> list = account.getAll();
//
//        System.out.println(list.get(2).getDescription() + " " + list.get(2).getLocation());
//    }
}
