/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Package {
    int package_id;
    String description;
    double price;
    String duration;
    String start_date;
    String end_date;
    String included_services;
    String itinerary;
    int number_of_people;
    String image_url;

    public Package() {
    }

    public Package(int package_id, String description, double price, String duration, String start_date, String end_date, String included_services, String itinerary, int number_of_people, String image_url) {
        this.package_id = package_id;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.start_date = start_date;
        this.end_date = end_date;
        this.included_services = included_services;
        this.itinerary = itinerary;
        this.number_of_people = number_of_people;
        this.image_url = image_url;
    }

    public int getPackage_id() {
        return package_id;
    }

    public void setPackage_id(int package_id) {
        this.package_id = package_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getIncluded_services() {
        return included_services;
    }

    public void setIncluded_services(String included_services) {
        this.included_services = included_services;
    }

    public String getItinerary() {
        return itinerary;
    }

    public void setItinerary(String itinerary) {
        this.itinerary = itinerary;
    }

    public int getNumber_of_people() {
        return number_of_people;
    }

    public void setNumber_of_people(int number_of_people) {
        this.number_of_people = number_of_people;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

  
}
