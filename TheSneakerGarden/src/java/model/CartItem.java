/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author Admin
 */
public class CartItem {
    int orderId;
    int productID;
    int quantity;
    int size;

    public CartItem() {
    }

    public CartItem(int productID, int quantity) {
        this.productID = productID;
        this.quantity = quantity;
    }

    public CartItem(int orderId, int productID, int quantity, int size) {
        this.orderId = orderId;
        this.productID = productID;
        this.quantity = quantity;
        this.size = size;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   
}
