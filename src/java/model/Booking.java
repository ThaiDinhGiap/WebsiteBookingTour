/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Booking {
    int BookingID;
    String BookingDate;
    int PackageID;
    String SpecialRequest;
    String BookingStatus;
    String CreatedDate;
    int CustomerID;

    public Booking() {
    }

    public Booking(int BookingID, String BookingDate, int PackageID, String SpecialRequest, String BookingStatus, String CreatedDate, int CustomerID) {
        this.BookingID = BookingID;
        this.BookingDate = BookingDate;
        this.PackageID = PackageID;
        this.SpecialRequest = SpecialRequest;
        this.BookingStatus = BookingStatus;
        this.CreatedDate = CreatedDate;
        this.CustomerID = CustomerID;
    }

    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public String getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(String BookingDate) {
        this.BookingDate = BookingDate;
    }

    public int getPackageID() {
        return PackageID;
    }

    public void setPackageID(int PackageID) {
        this.PackageID = PackageID;
    }

    public String getSpecialRequest() {
        return SpecialRequest;
    }

    public void setSpecialRequest(String SpecialRequest) {
        this.SpecialRequest = SpecialRequest;
    }

    public String getBookingStatus() {
        return BookingStatus;
    }

    public void setBookingStatus(String BookingStatus) {
        this.BookingStatus = BookingStatus;
    }

    public String getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(String CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }
    
    
}
