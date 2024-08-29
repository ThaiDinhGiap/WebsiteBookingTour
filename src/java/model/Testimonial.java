/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Testimonial {
    int TestimonialID;
    int CustomerID;
    String Content;
    String CreateDate;
    String Status;

    public Testimonial() {
    }

    public Testimonial(int TestimonialID, int CustomerID, String Content, String CreateDate, String Status) {
        this.TestimonialID = TestimonialID;
        this.CustomerID = CustomerID;
        this.Content = Content;
        this.CreateDate = CreateDate;
        this.Status = Status;
    }

    public int getTestimonialID() {
        return TestimonialID;
    }

    public void setTestimonialID(int TestimonialID) {
        this.TestimonialID = TestimonialID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(String CreateDate) {
        this.CreateDate = CreateDate;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
    
}
