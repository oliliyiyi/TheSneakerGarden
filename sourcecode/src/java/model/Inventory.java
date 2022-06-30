/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author user
 */
public class Inventory {
    private int proID;
    private int sizeID;
    private int quantity;

    public Inventory() {
    }

    public Inventory(int proID, int sizeID, int quantity) {
        this.proID = proID;
        this.sizeID = sizeID;
        this.quantity = quantity;
    }

    public int getProductID() {
        return proID;
    }

    public void setProductID(int proID) {
        this.proID = proID;
    }

    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
