package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Booking;

public class BookingDAO extends DBContext {

    private static final Logger LOGGER = Logger.getLogger(CustomerDAO.class.getName());

    public List<Booking> getAll() {
        List<Booking> list = new ArrayList<>();
        String strSelect = "SELECT * FROM [Booking]";
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                Booking nd = new Booking(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                list.add(nd);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all Bookings", e);
        }
        return list;
    }

    public void addBooking(int userid, String BookingDate, int packageid, String Request) {
        String sql = "INSERT INTO [Booking] (CustomerID, BookingDate, PackageID, SpecialRequest) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, userid);
            pstmt.setString(2, BookingDate);
            pstmt.setInt(3, packageid);
            pstmt.setString(4, Request);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteBooking(int bookingID) {
        String strDelete = "DELETE FROM [Booking] WHERE BookingID = ?";
        try (PreparedStatement stm = connection.prepareStatement(strDelete)) {
            stm.setInt(1, bookingID);
            stm.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting Booking", e);
        }
    }

    public Integer countNewBooking() {
        String strSelect = "SELECT * FROM [Booking] WHERE BookingStatus LIKE 'PENDING'";
        int count = 0;
        try (PreparedStatement stm = connection.prepareStatement(strSelect); ResultSet rs = stm.executeQuery()) {
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error getting all Bookings", e);
        }
        return count;
    }

    public Booking findBooking(int BookingID) {
        String sql = "SELECT * FROM [Booking] WHERE BookingID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, BookingID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String BookingDate = rs.getString("BookingDate");
                int PackageID = rs.getInt("PackageID");
                String SpecialRequest = rs.getString("SpecialRequest");
                String BookingStatus = rs.getString("BookingStatus");
                String CreatedDate = rs.getString("CreatedDate");
                int CustomerID = rs.getInt("CustomerID");

                Booking aBook = new Booking();
                aBook.setBookingDate(BookingDate);
                aBook.setPackageID(PackageID);
                aBook.setSpecialRequest(SpecialRequest);
                aBook.setBookingStatus(BookingStatus);
                aBook.setCreatedDate(CreatedDate);
                aBook.setCustomerID(CustomerID);

                return aBook;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Booking> findBookingsByAdminID(int adminID) {
    List<Booking> bookings = new ArrayList<>();
    String sql = "SELECT b.BookingID, b.BookingDate, b.PackageID, b.SpecialRequest, b.BookingStatus, b.CreatedDate, b.CustomerID " +
                 "FROM [Booking] b " +
                 "JOIN [BookingStatusHistory] h ON b.BookingID = h.BookingID " +
                 "WHERE h.AdminID = ? AND b.BookingStatus = 'Approved'";
    try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
        pstmt.setInt(1, adminID);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            Booking booking = new Booking();
            booking.setBookingID(rs.getInt("BookingID"));
            booking.setBookingDate(rs.getString("BookingDate"));
            booking.setPackageID(rs.getInt("PackageID"));
            booking.setSpecialRequest(rs.getString("SpecialRequest"));
            booking.setBookingStatus(rs.getString("BookingStatus"));
            booking.setCreatedDate(rs.getString("CreatedDate"));
            booking.setCustomerID(rs.getInt("CustomerID"));
            bookings.add(booking);
        }
    } catch (SQLException ex) {
        Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return bookings;
}


    public int countBookingsApprovedByCustomerID(int CustomerID) {
        String sql = "SELECT * FROM [Booking] WHERE CustomerID = ? AND BookingStatus = 'Approved'";
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

    public int countBookingsCancelledByCustomerID(int CustomerID) {
        String sql = "SELECT * FROM [Booking] WHERE CustomerID = ? AND BookingStatus = 'Cancelled'";
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

//    public boolean checkLogin(String your_name, String password) {
//        String sql = "SELECT * FROM [Booking] WHERE (Email = ? OR Bookingname = ?) AND password = ?";
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
//        BookingDAO account = new BookingDAO();
//        List<Booking> bookList = account.findBookingsByAdminID(6);
//        System.out.println(bookList.get(2).getBookingID());
//    }
}
