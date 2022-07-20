/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author tranthanhcong652001
 */
public class Review {
    public int reviewID;
    public int pID;
    public int customerID;
    public String message;
    public Date reviewDate;
    public double rating;
    
    public  Review(){
    }

    public Review(int reviewID, int pID, int customerID, String message, Date reviewDate, double rating) {
        this.reviewID = reviewID;
        this.pID = pID;
        this.customerID = customerID;
        this.message = message;
        this.reviewDate = reviewDate;
        this.rating = rating;
    }

    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

   
    
}
