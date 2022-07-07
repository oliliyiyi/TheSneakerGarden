/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Size {

    private int sizeNum;
    private String length;
    private String width;

    public Size() {
        this.sizeNum = 0;
        this.length = "";
        this.width = "";
    }

    public Size(int sizeNum, String length, String width) {
        this.sizeNum = sizeNum;
        this.length = length;
        this.width = width;
    }

    public int getSizeNum() {
        return sizeNum;
    }

    public void setSizeNum(int sizeNum) {
        this.sizeNum = sizeNum;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

}
