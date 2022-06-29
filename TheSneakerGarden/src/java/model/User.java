/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


public class User {
    private int userId;
    private String userAccount;
    private String password;
    private String userFullName;
    private String userEmail;
    private String userPhone;
    private String userAddress;
    private int roleID;

    public User(int userId, String userAccount, String password, String userFullName, String userEmail, String userPhone, String userAddress, int roleID) {
        this.userId = userId;
        this.userAccount = userAccount;
        this.password = password;
        this.userFullName = userFullName;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.roleID = roleID;
    }

    public User(int userId, String userAccount, String userFullName, String userEmail, String userPhone, String userAddress, int roleID) {
        this.userId = userId;
        this.userAccount = userAccount;
        this.userFullName = userFullName;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userAddress = userAddress;
        this.roleID = roleID;
    }

    public User(int userId, int roleID) {
        this.userId = userId;
        this.roleID = roleID;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
}
