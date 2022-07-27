/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbmanager;

import utils.DBUtils;
import model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Category;
import model.Inventory;

/**
 *
 * @author Admin
 */
public class ProductManager {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    //in all sp 
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Products] WHERE [status] = 1";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("ImageLink"),
                        rs.getDouble("Price"),
                        rs.getString("Description"),
                        rs.getInt("CategoryID"),
                        rs.getInt("BrandID"),
                        rs.getInt("Status")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    //in all sp 
    public Product getProductByID(int id) {
        Product product = new Product();
        String query = "SELECT * FROM [dbo].[Products] WHERE [ProductID] = " + id;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("ImageLink"),
                        rs.getDouble("Price"),
                        rs.getString("Description"),
                        rs.getInt("CategoryID"),
                        rs.getInt("BrandID"),
                        rs.getInt("Status"));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return product;
    }

    public ArrayList<Product> search(String keyword) {
        ArrayList<Product> list = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Products] WHERE ProductName like ?";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("ImageLink"),
                        rs.getDouble("Price"),
                        rs.getString("Description"),
                        rs.getInt("CategoryID"),
                        rs.getInt("BrandID"),
                        rs.getInt("Status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean insert(Product product) {
        boolean status = false;

        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement(""
                    + "INSERT [Products]\n"
                    + "           ([CategoryID]\n"
                    + "           ,[BrandID]\n"
                    + "           ,[ProductName]\n"
                    + "           ,[Price]\n"
                    + "           ,[ImageLink]\n"
                    + "           ,[Description]\n"
                    + "           ,[Rate]\n"
                    + "           ,[Status])"
                    + "VALUES "
                    + "(" + product.getcId()
                    + ", " + product.getbrandID()
                    + ", N'" + product.getName()
                    + "', " + product.getPrice()
                    + ", N'" + product.getImage()
                    + "', N'" + product.getDescription()
                    + "', 3 ,1)");

            ps.executeUpdate();

            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean edit(Product product) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Products] "
                    + "SET "
                    + "[ProductName] = '" + product.getName()
                    + "', [CategoryID] = '" + product.getcId()
                    + "', [BrandID] = '" + product.getbrandID()
                    + "', [Price] = '" + product.getPrice()
                    + "', [ImageLink] = '" + product.getImage()
                    + "', [Description] = '" + product.getDescription()
                    + "' WHERE [ProductID] = " + product.getId());
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean delete(int id) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Products] SET [Status] = 0 WHERE [ProductID] = " + id);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public ArrayList<Inventory> getProductQuantityByProID(int id) {
        ArrayList<Inventory> list = new ArrayList<Inventory>();
        String query = "SELECT [SizeNumber]\n"
                + "      ,[quantity]\n"
                + "      ,[productId]\n"
                + "  FROM [dbo].[Inventory]"
                + "WHERE [productid] = " + id;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int sizeNum = rs.getInt("SizeNumber");
                int quantity = rs.getInt("quantity");
                list.add(new Inventory(id, sizeNum, quantity));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public int getProductQuantityByProSize(int sizeNum, int proID) {
        int quantity = 0;
        String query = "SELECT [Quantity] FROM [dbo].[Inventory] WHERE [ProductID] = " + proID + "AND [SizeNumber] = " + sizeNum;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt("Quantity");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return quantity;
    }

    public int getProductQuantityByProductID(int proID) {
        int quantity = 0;
        String query = "SELECT [Quantity] FROM [dbo].[Inventory] WHERE [ProductID] = " + proID;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt("Quantity");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return quantity;
    }

    public boolean checkQuantityProduct(int size, int productId) {
        boolean quantity = false;
        String query = "SELECT [Quantity] FROM [dbo].[Inventory] WHERE [ProductID] = " + productId + " and [SizeNumber] " + size;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                quantity = true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return quantity;
    }

    public boolean updateSize(int size, int productId, int quantity) {
        boolean check = false;
        String query = "UPDATE [dbo].[Inventory] SET [quantity] = " + quantity + " WHERE [productid] = " + productId + " and [SizeNumber] = " + size;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            check = ps.executeUpdate() > 0 ? true : false;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

    public boolean insertSize(int sizeNum, int proID, int quantity) {
        boolean check = false;
        String query = "INSERT [dbo].[Inventory] ([ProductID], [SizeNumber], [Quantity]) VALUES(" + proID + "," + sizeNum + ", " + quantity + ")";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement(query);
            check = ps.executeUpdate() > 0 ? true : false;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [TSG].[dbo].[Categories]";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("CategoryID"), rs.getString("CategoryName")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
}
