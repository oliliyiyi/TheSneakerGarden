/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbmanager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Review;
import utils.DBUtils;

/**
 *
 * @author tranthanhcong652001
 */
public class ReviewManager {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public ArrayList<Review> getAllReview() {
        ArrayList<Review> list = new ArrayList<>();
        String sql = "select ReviewID, ProductID, CustomerID, [Message], ReviewDate from dbo.Review";
        try {
            conn = db.getConnectDB();
            ps = conn.prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getDate(5)));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Review> getReviewByProductID(int pID) {
        String sql = "select ReviewID, ProductID, CustomerID, [Message], ReviewDate from dbo.Review "
                + "where ProductID = ?";
        ArrayList<Review> list = new ArrayList<>();
        try {
            conn = db.getConnectDB();
            ps = conn.prepareCall(sql);
            ps.setInt(1, pID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(
                        rs.getInt("ReviewID"),
                        rs.getInt("ProductID"),
                        rs.getInt("CustomerID"),
                        rs.getString("Message"),
                        rs.getDate("ReviewDate")));
            }
            return list;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<Review> getAllReviewProductID(int id) {
        ArrayList<Review> list = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [dbo].[Review] "
                + "  WHERE [ProductID] = " + id;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(
                        rs.getInt("ReviewID"),
                        rs.getInt("ProductID"),
                        rs.getInt("CustomerID"),
                        rs.getString("Message"),
                        rs.getDate("ReviewDate")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Review getReviewByID(int reviewID) {
        Review review = new Review();
        String sql = "select ReviewID, ProductID, CustomerID, [Message], ReviewDate from dbo.Review "
                + "where ReviewID = ?";
        try {
            conn = db.getConnectDB();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, reviewID);
            rs = ps.executeQuery();
            while (rs.next()) {
                review = new Review(rs.getInt("ReviewID"),
                        rs.getInt("ProductID"),
                        rs.getInt("CustomerID"),
                        rs.getString("Message"),
                        rs.getDate("ReviewDate"));
            }
            return review;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean addReview(int productID, int userID, String mess, Date rvDate) {
        String sql = "INSERT INTO [dbo].[Review]\n"
                + "           ([ProductID]\n"
                + "           ,[CustomerID]\n"
                + "           ,[Message]\n"
                + "           ,[ReviewDate])\n"
                + " VALUES(?, ?, ?, ?)";
        try {
            conn = db.getConnectDB();
            ps = conn.prepareCall(sql);
            ps.setInt(1, productID);
            ps.setInt(2, userID);
            ps.setString(3, mess);
            ps.setDate(4, rvDate);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean updateReviewByID(int reviewID, String message, Date rvDate) {
        String sql = "UPDATE dbo.Review SET [Message] = ? ReviewDate = ? WHERE ReviewID = ?";
        try {
            conn = db.getConnectDB();
            ps = conn.prepareCall(sql);
            ps.setString(1, message);
            ps.setDate(2, rvDate);
            ps.setInt(3, reviewID);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteReviewByID(int reviewID) {
        String sql = "DELETE from dbo.Review WHERE ReviewID = ?";
        try {
            conn = db.getConnectDB();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, reviewID);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
