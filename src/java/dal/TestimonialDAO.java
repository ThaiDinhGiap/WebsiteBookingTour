package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Testimonial;

public class TestimonialDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public List<Testimonial> getAll() {
        List<Testimonial> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [Testimonial]";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                Testimonial nd = new Testimonial(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all Testimonials", e);
        }
        return list;
    }

    public void addTes(int userid, String content, String time) {
        String sql = "INSERT INTO [Testimonial] (CustomerID, Content, CreatedDate, Status) VALUES (?, ?, ?, 'Pending')";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userid);
            pstmt.setString(2, content);
            pstmt.setString(3, time);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateTestimonial(int id, String content) {
        String sql = "UPDATE [Testimonial] SET Content = ? WHERE TestimonialID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, content);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteTestimonial(int testimonialID) {
        String strDelete = "DELETE FROM [Testimonial] WHERE TestimonialID = ?";
        try (PreparedStatement stm = connection.prepareStatement(strDelete)) {
            stm.setInt(1, testimonialID);
            stm.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting Testimonial", e);
        }
    }

    public Integer countNewTestimonial() {
        String strSelect = "SELECT * FROM [Testimonial] WHERE Status LIKE 'PENDING'";
        int count = 0;
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all Testimonial", e);
        }
        return count;
    }

    public int countTestimonialsApprovedByCustomerID(int CustomerID) {
        String sql = "SELECT * FROM [Testimonial] WHERE CustomerID = ? AND Status = 'Approved'";
        int count = 0;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, CustomerID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public int countTestimonialsCancelledByCustomerID(int CustomerID) {
        String sql = "SELECT * FROM [Testimonial] WHERE CustomerID = ? AND Status = 'Rejected'";
        int count = 0;

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, CustomerID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                count++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return count;
    }

    public void approveStatus(int TestimonialID) {
        String sql = "UPDATE [Testimonial] SET Status = 'Approved' WHERE TestimonialID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, TestimonialID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void rejectStatus(int TestimonialID) {
        String sql = "UPDATE [Testimonial] SET Status = 'Rejected' WHERE TestimonialID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, TestimonialID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public boolean checkLogin(String your_name, String password) {
//        String sql = "SELECT * FROM [Testimonial] WHERE (Email = ? OR Testimonialname = ?) AND password = ?";
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
    public static void main(String[] args) {
        TestimonialDAO account = new TestimonialDAO();
        System.out.println(account.countNewTestimonial());
    }
}
