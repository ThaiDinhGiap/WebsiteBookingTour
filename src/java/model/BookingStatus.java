/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class BookingStatus {
    int HistoryID;
    int BookingID;
    int AdminID;
    String Status;
    String UpdatedDate;
    String Notes;

    public BookingStatus() {
    }

    public BookingStatus(int HistoryID, int BookingID, int AdminID, String Status, String UpdatedDate, String Notes) {
        this.HistoryID = HistoryID;
        this.BookingID = BookingID;
        this.AdminID = AdminID;
        this.Status = Status;
        this.UpdatedDate = UpdatedDate;
        this.Notes = Notes;
    }

    public int getHistoryID() {
        return HistoryID;
    }

    public void setHistoryID(int HistoryID) {
        this.HistoryID = HistoryID;
    }

    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public int getAdminID() {
        return AdminID;
    }

    public void setAdminID(int AdminID) {
        this.AdminID = AdminID;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getUpdatedDate() {
        return UpdatedDate;
    }

    public void setUpdatedDate(String UpdatedDate) {
        this.UpdatedDate = UpdatedDate;
    }

    public String getNotes() {
        return Notes;
    }

    public void setNotes(String Notes) {
        this.Notes = Notes;
    }
    
}
