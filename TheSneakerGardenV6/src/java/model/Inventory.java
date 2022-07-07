/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Inventory {
    private int proID;
    private int sizeNum;
    private int quantity;

    public Inventory() {
    }

    public Inventory(int proID, int sizeNum, int quantity) {
        this.proID = proID;
        this.sizeNum = sizeNum;
        this.quantity = quantity;
    }

    public int getProductID() {
        return proID;
    }

    public void setProductID(int proID) {
        this.proID = proID;
    }

    public int getSizeNum() {
        return sizeNum;
    }

    public void setSizeNum(int sizeNum) {
        this.sizeNum = sizeNum;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
