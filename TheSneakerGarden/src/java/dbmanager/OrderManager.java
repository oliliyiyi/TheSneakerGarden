/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbmanager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.CartItem;
import model.Order;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class OrderManager {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public boolean insertOder(int userID, String fullName, String phone, String shipAddress, String email, Date orderDate, double price) {
        String query = "INSERT [dbo].[Orders]\n"
                + "           ([CustomerID]\n"
                + "           ,[FullName]\n"
                + "           ,[Phone]\n"
                + "           ,[ShipAddress]\n"
                + "           ,[Email]\n"
                + "           ,[OrderDate]\n"
                + "           ,[Status]) VALUES (?, ?, ?, ?, ?, ?, 0)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setInt(1, userID);
            pst.setString(2, fullName);
            pst.setString(3, phone);
            pst.setString(4, shipAddress);
            pst.setString(5, email);
            pst.setDate(6, orderDate);
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();//
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());//display warning message
            return false;
        } catch (Exception e) {
            System.out.println("can't insert product to list.");//display warning message
            return false;
        }
    }
    
    public boolean insertOder(String fullName, String phone, String shipAddress, String email, Date orderDate, double price) {
        String query = "INSERT [dbo].[Orders]\n"
                + "           ([FullName]\n"
                + "           ,[Phone]\n"
                + "           ,[ShipAddress]\n"
                + "           ,[Email]\n"
                + "           ,[OrderDate]\n"
                + "           ,[Status]) VALUES (?, ?, ?, ?, ?, 0)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement
            pst.setString(1, fullName);
            pst.setString(2, phone);
            pst.setString(3, shipAddress);
            pst.setString(4, email);
            pst.setDate(5, orderDate);
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();//
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());//display warning message
            return false;
        } catch (Exception e) {
            System.out.println("can't insert product to list.");//display warning message
            return false;
        }
    }

    public boolean insertOderItem(int orderId, int itemId, int quantity, double price) {
        String query = "INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (?, ?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setInt(1, orderId);
            pst.setInt(2, itemId);
            pst.setInt(3, quantity);
            pst.setDouble(4, price);
            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            rs.next();//

            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage() + "+++++++++++++++" + orderId);//display warning message
            return false;
        } catch (Exception e) {
            System.out.println("can't insert product to list.");//display warning message
            return false;

        }
    }

    public int getOrderID() {
        int id = 0;
        try {
            String sql = "SELECT MAX(OrderID) as id\n"
                    + "  FROM [dbo].[Orders]";
            Statement st2 = this.con.createStatement();
            ResultSet rs2 = st2.executeQuery(sql);
            while (rs2.next()) {
                id = rs2.getInt("id");
            }

        } catch (Exception e) {
        }
        return id;
    }

    public ArrayList<Order> getAllProduct() {
        ArrayList<Order> list = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [dbo].[Orders]";
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("OrderID"), 
                        rs.getInt("CustomerID"), 
                        rs.getString("FullName"), 
                        rs.getString("Phone"), 
                        rs.getString("ShipAddress"), 
                        rs.getString("Email"), 
                        rs.getDate("OrderDate"), 
                        rs.getDate("ShippedDate"), 
                        0, 
                        rs.getInt("Status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Order> getAllOrderByUserID(int id) {
        ArrayList<Order> list = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [dbo].[Orders] "
                + "  WHERE [CustomerID] = " + id;
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("OrderID"), 
                        rs.getInt("CustomerID"), 
                        rs.getString("FullName"), 
                        rs.getString("Phone"), 
                        rs.getString("ShipAddress"), 
                        rs.getString("Email"), 
                        rs.getDate("OrderDate"), 
                        rs.getDate("ShippedDate"), 
                        0, 
                        rs.getInt("Status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<CartItem> getAllProductByOrderID(int id) {
        ArrayList<CartItem> list = new ArrayList<>();
        String query = "SELECT [OrderID]\n"
                + "      ,[ProductID]\n"
                + "      ,[UnitPrice]\n"
                + "      ,[Quantity]\n"
                + "      ,[SizeNumber]\n"
                + "  FROM [dbo].[OrderDetails]"
                + "  WHERE [OrderDetails].[OrderID] = " + id;
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CartItem(rs.getInt("ProductID"),
                        rs.getInt("Quantity"),
                        rs.getInt("SizeNumber")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public boolean updateOrderShipDate_Status(int orderID, Date shipDate, int status){
        boolean check = false;
        String query = "UPDATE [dbo].[Orders] SET ShippedDate = ?, Status = ? WHERE OrderID = ?";
      
        try{
             con = db.getConnectDB();
             if(con!=null){
                 ps = con.prepareStatement(query);
                 ps.setDate(1, shipDate);
                 ps.setInt(2, status);
                 ps.setInt(3, orderID);
                 check = ps.executeUpdate() > 0 ? true : false;
             }
        }catch (Exception e){
            e.printStackTrace();
        }
        return check;
    }
}
