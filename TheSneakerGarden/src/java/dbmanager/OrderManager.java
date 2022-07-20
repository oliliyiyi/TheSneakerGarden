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
import model.PaymentType;
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

    public boolean insertOder(int userID, String fullName, String phone, String shipAddress, String email, Date orderDate) {
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

    public boolean insertOder(String fullName, String phone, String shipAddress, String email, Date orderDate) {
        String query = "INSERT [dbo].[Orders]\n"
                + "           ([FullName]\n"
                + "           ,[Phone]\n"
                + "           ,[ShipAddress]\n"
                + "           ,[Email]\n"
                + "           ,[OrderDate]\n"
                + "           ,[Status]) VALUES (?, ?, ?, ?, ?, 0)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query);//create prepare statement
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

    public boolean insertOderItem(int orderId, int itemId, int size, int quantity, double price) {
        String query = "INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [SizeNumber], [Quantity], [UnitPrice]) VALUES (?, ?, ?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setInt(1, orderId);
            pst.setInt(2, itemId);
            pst.setInt(3, size);
            pst.setInt(4, quantity);
            pst.setDouble(5, price);
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

    public Order getOrderByID(int id) {
        Order order = new Order();
        String query = "SELECT *"
                + "  FROM [TSG].[dbo].[Orders]"
                + "  WHERE [OrderID] =" + id;
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("CustomerID"),
                        rs.getString("FullName"),
                        rs.getString("Phone"),
                        rs.getString("ShipAddress"),
                        rs.getString("Email"),
                        rs.getDate("OrderDate"),
                        rs.getDate("ShippedDate"),
                        0,
                        rs.getInt("Status"));

            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return order;
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

    public ArrayList<Order> getAllOrder() {
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

    public boolean edit(Order Order) {
        boolean status = false;
        try {
            con = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = con.prepareStatement("UPDATE [dbo].[Orders] "
                    + "SET [FullName] = '" + Order.getFullName()
                    + "', [Phone] = '" + Order.getPhone()
                    + "', [ShipAddress] = '" + Order.getShipAddress()
                    + "', [Email] = '" + Order.getEmail()
                    + "', [OrderDate] = '" + Order.getOrderDate()
                    + "', [ShippedDate] = '" + Order.getShipDate()
                    + "', [Status] = '" + Order.getStatus()
                    + "' WHERE [OrderID] = " + Order.getOrderId());
            ps.executeUpdate();
            status = true;
            //System.out.println("UPDATE [dbo].[tblUser] SET [userName] = '"+user.getUserName()+"',[userEmail] = '"+user.getUserEmail()+"', [userPhone]= '"+user.getUserPhone()+"', [userAddress] = "+user.getUserAddress()+" WHERE [userId] = "+user.getUserId());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
    
    public ArrayList<PaymentType> getPaymentType() {
        ArrayList<PaymentType> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "  FROM [dbo].[PaymentType]";
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PaymentType(rs.getInt("TypeID"),
                        rs.getString("TypeName")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public boolean insertPayment(int userId, int typeId, int orderId, double amount) {
        String query = "INSERT INTO [dbo].[Payment] ([CustomerID], [TypeID], [OrderID], [Amount]) VALUES (?, ?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement

            pst.setInt(1, userId);
            pst.setInt(2, typeId);
            pst.setInt(3, orderId);
            pst.setDouble(4, amount);
            pst.executeUpdate();

            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage() + "+++++++++++++++" + orderId);//display warning message
            return false;
        } catch (Exception e) {
            System.out.println("can't insert product to list.");//display warning message
            return false;
        }
    }
    
    public boolean insertPayment(int typeId, int orderId, double amount) {
        String query = "INSERT INTO [dbo].[Payment] ([TypeID], [OrderID], [Amount]) VALUES (?, ?, ?)";//query insert
        try {
            con = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);//create prepare statement
            pst.setInt(1, typeId);
            pst.setInt(2, orderId);
            pst.setDouble(3, amount);
            pst.executeUpdate();

            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage() + "+++++++++++++++" + orderId);//display warning message
            return false;
        } catch (Exception e) {
            System.out.println("can't insert product to list.");//display warning message
            return false;
        }
    }
}
