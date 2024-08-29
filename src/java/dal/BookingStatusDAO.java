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
import model.BookingStatus;

public class BookingStatusDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public List<BookingStatus> getAll() {
        List<BookingStatus> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [BookingStatusHistory]";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                BookingStatus nd = new BookingStatus(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all BookingStatusHistory", e);
        }
        return list;
    }

    public List<BookingStatus> doneBookingStatus(int AdminID) {
        String strSelect = "SELECT * FROM [BookingStatusHistory] WHERE AdminID = ? AND Status LIKE 'Approved'";
        List<BookingStatus> list = new ArrayList<>();

        try (PreparedStatement stm = connection.prepareStatement(strSelect)) {
            stm.setInt(1, AdminID); // Đặt tham số AdminID
            try (ResultSet rs = stm.executeQuery()) {
                while (rs.next()) {
                    BookingStatus nd = new BookingStatus(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
                    list.add(nd);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all users", e);
        }
        return list;
    }

    public void approveStatus(int BookingID, int AdminID) {
        String updateBookingSql = "UPDATE [Booking] SET BookingStatus = 'Approved' WHERE BookingID = ?";
        String insertHistorySql = "INSERT INTO [BookingStatusHistory] (BookingID, AdminID, Status, UpdatedDate, Notes) VALUES (?, ?, 'Approved', GETDATE(), 'Booking approved by admin')";

        try (PreparedStatement updatePstmt = connection.prepareStatement(updateBookingSql); PreparedStatement insertPstmt = connection.prepareStatement(insertHistorySql)) {

            // Update the Booking status to 'Approved'
            updatePstmt.setInt(1, BookingID);
            updatePstmt.executeUpdate();

            // Insert a new record into BookingStatusHistory
            insertPstmt.setInt(1, BookingID);
            insertPstmt.setInt(2, AdminID);
            insertPstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteStatus(int BookingID, int AdminID) {
        String updateBookingSql = "UPDATE [Booking] SET BookingStatus = 'Cancelled' WHERE BookingID = ?";
        String insertHistorySql = "INSERT INTO [BookingStatusHistory] (BookingID, AdminID, Status, UpdatedDate, Notes) VALUES (?, ?, 'Cancelled', GETDATE(), 'Booking cancelled by admin')";

        try (PreparedStatement updatePstmt = connection.prepareStatement(updateBookingSql); PreparedStatement insertPstmt = connection.prepareStatement(insertHistorySql)) {

            // Update the Booking status to 'Approved'
            updatePstmt.setInt(1, BookingID);
            updatePstmt.executeUpdate();

            // Insert a new record into BookingStatusHistory
            insertPstmt.setInt(1, BookingID);
            insertPstmt.setInt(2, AdminID);
            insertPstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
