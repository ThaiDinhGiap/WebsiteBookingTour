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
import model.TestimonialStatus;

public class TestimonialStatusDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public List<TestimonialStatus> getAll() {
        List<TestimonialStatus> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [TestimonialStatusHistory]";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                TestimonialStatus nd = new TestimonialStatus(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all TestimonialStatusHistory", e);
        }
        return list;
    }

//    public List<TestimonialStatus> doneBookingStatus(int AdminID) {
//        String strSelect = "SELECT * FROM [TestimonialStatusHistory] WHERE AdminID = ? AND Status LIKE 'Approved'";
//        List<TestimonialStatus> list = new ArrayList<>();
//
//        try (PreparedStatement stm = connection.prepareStatement(strSelect)) {
//            stm.setInt(1, AdminID); // Đặt tham số AdminID
//            try (ResultSet rs = stm.executeQuery()) {
//                while (rs.next()) {
//                    TestimonialStatus nd = new TestimonialStatus(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
//                    list.add(nd);
//                }
//            }
//        } catch (SQLException e) {
//            LOGGER.log(Level.SEVERE, "Error getting all users", e);
//        }
//        return list;
//    }

    public void approveStatus(int TestimonialID, int AdminID) {
        String updateTestimonialSql = "UPDATE [Testimonial] SET Status = 'Approved' WHERE TestimonialID = ?";
        String insertHistorySql = "INSERT INTO [TestimonialStatusHistory] (TestimonialID, AdminID, Status, UpdatedDate, Notes) VALUES (?, ?, 'Approved', GETDATE(), 'Testimonial approved by admin')";

        try (PreparedStatement updatePstmt = connection.prepareStatement(updateTestimonialSql); PreparedStatement insertPstmt = connection.prepareStatement(insertHistorySql)) {

            // Update the Booking status to 'Approved'
            updatePstmt.setInt(1, TestimonialID);
            updatePstmt.executeUpdate();

            // Insert a new record into BookingStatusHistory
            insertPstmt.setInt(1, TestimonialID);
            insertPstmt.setInt(2, AdminID);
            insertPstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void rejectStatus(int TestimonialID, int AdminID) {
        String updateTestimonialSql = "UPDATE [Testimonial] SET Status = 'Rejected' WHERE TestimonialID = ?";
        String insertHistorySql = "INSERT INTO [TestimonialStatusHistory] (TestimonialID, AdminID, Status, UpdatedDate, Notes) VALUES (?, ?, 'Rejected', GETDATE(), 'Testimonial rejected by admin')";

        try (PreparedStatement updatePstmt = connection.prepareStatement(updateTestimonialSql); PreparedStatement insertPstmt = connection.prepareStatement(insertHistorySql)) {

            // Update the Booking status to 'Approved'
            updatePstmt.setInt(1, TestimonialID);
            updatePstmt.executeUpdate();

            // Insert a new record into BookingStatusHistory
            insertPstmt.setInt(1, TestimonialID);
            insertPstmt.setInt(2, AdminID);
            insertPstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
