package dal;

import java.security.SecureRandom;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class CustomerDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [User] WHERE RoleID = 1";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                User nd = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all users", e);
        }
        return list;
    }

    public List<User> getAllAdmin() {
        List<User> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [User] WHERE RoleID = 2";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                User nd = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all users", e);
        }
        return list;
    }

    public Integer checkLogin(String your_name, String password) {
        String sql = "SELECT UserID FROM [User] WHERE (Email = ? OR Username = ?) AND password = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, your_name);
            pstmt.setString(2, your_name);
            pstmt.setString(3, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("UserID"); // Return the UserID
                } else {
                    return null; // No matching user found
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking login", e);
            return null; // Return null if there's an error
        }
    }

    public String checkEmail(String email) {
        String sql = "SELECT FullName FROM [User] WHERE Email = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("FullName"); // Return the FullName
                } else {
                    return "Nothing"; // No matching user found
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking email", e);
            return "Nothing"; // Return "Nothing" if there's an error
        }
    }

    public String updatePass(String email) {
        String sql = "UPDATE [User] SET Password = ? WHERE Email LIKE ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            String newPass = generateNewPassword();
            pstmt.setString(1, newPass);
            pstmt.setString(2, email);
            pstmt.executeUpdate();
            return newPass;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating password", e);
            return ""; // Return empty string if there's an error
        }
    }

    public void updatePass(String email, String pass) {
        String sql = "UPDATE [User] SET Password = ? WHERE Email LIKE ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, pass);
            pstmt.setString(2, email);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating password", e);
        }
    }

    public String generateNewPassword() {
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?";
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < 7; i++) {
            int randomIndex = random.nextInt(chars.length());
            sb.append(chars.charAt(randomIndex));
        }

        return sb.toString();
    }

    public void addCustomer(String name, String email, String phone, String pass) {
        String sql = "INSERT INTO [User] (FullName, Email, Password, Username, PhoneNumber, RoleID) VALUES (?, ?, ?, ?, ?, 1)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            String localPart = email.substring(0, email.indexOf('@'));
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, pass);
            pstmt.setString(4, localPart);
            pstmt.setString(5, phone);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User findCustomer(int userId) {
        String sql = "SELECT FullName, Email, Password, Username, PhoneNumber, RoleID, avatar_url FROM [User] WHERE UserID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String username = rs.getString("Username");
                String phoneNumber = rs.getString("PhoneNumber");
                int roleId = rs.getInt("RoleID");
                String avatar_url = rs.getString("avatar_url");

                User user = new User();
                user.setFullName(fullName);
                user.setEmail(email);
                user.setPassword(password);
                user.setUsername(username);
                user.setPhoneNumber(phoneNumber);
                user.setRoleID(roleId);
                user.setAvatar_url(avatar_url);

                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<User> findCustomersByName(String name) {
        String sql = "SELECT UserID, FullName, Email, Password, Username, PhoneNumber, RoleID, avatar_url FROM [User] WHERE FullName LIKE ?";
        List<User> users = new ArrayList<>();

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, "%" + name + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String username = rs.getString("Username");
                String phoneNumber = rs.getString("PhoneNumber");
                int roleId = rs.getInt("RoleID");
                String avatar_url = rs.getString("avatar_url");

                User user = new User();
                user.setUserID(UserID);
                user.setFullName(fullName);
                user.setEmail(email);
                user.setPassword(password);
                user.setUsername(username);
                user.setPhoneNumber(phoneNumber);
                user.setRoleID(roleId);
                user.setAvatar_url(avatar_url);

                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return users;
    }

    public void updateCustomer(int userId, String name, String email, String username, String phone) {
        String sql = "UPDATE [User] SET FullName = ?, Email = ?, Username = ?, PhoneNumber = ? WHERE UserID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, username);
            pstmt.setString(4, phone);
            pstmt.setInt(5, userId);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCustomerAvatar(String avatar_url, int userid) {
        String sql = "UPDATE [User] SET avatar_url = ? WHERE UserID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, avatar_url);
            pstmt.setInt(2, userid);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) {
//        CustomerDAO cs = new CustomerDAO();
//        System.out.println(cs.findCustomer(10).getAvatar_url());
//    }
}
