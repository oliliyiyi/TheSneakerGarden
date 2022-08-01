/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dbmanager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.User;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class UserManager {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBUtils db = new DBUtils();

    public User login(String username, String pass) {
        User user = new User();
        String query = "SELECT  [CustomerID]\n"
                + "      ,[Account]\n"
                + "      ,[FullName]\n"
                + "      ,[Email]\n"
                + "      ,[Phone]\n"
                + "      ,[Address]\n"
                + "      ,[RoleID]\n"
                + "  FROM [dbo].[Customer]\n"
                + "  WHERE [Account] = '" + username + "' AND [Password] = '" + pass + "'";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7));

            }
        } catch (SQLException e) {
        }
        return user;
    }

    public User CheckUserExist(String userName) {
        String query = "SELECT *"
                + "  FROM [dbo].[Customer]"
                + "  WHERE [Account] =?";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return null;
    }

    public User getUser(int id) {
        User user = new User();
        String query = "SELECT *"
                + "  FROM [dbo].[Customer]"
                + "  WHERE [CustomerID] =" + id;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return user;
    }

    public int getUserID() {
        int id = 0;
        String query = "SELECT MAX(CustomerID) as id\n"
                + "  FROM [dbo].[Customer]";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return id;
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [dbo].[Customer]";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2)));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }

    public ArrayList<User> getAllAdmin() {
        ArrayList<User> list = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [dbo].[Customer]"
                + "  WHERE [RoleID] = 1";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2)));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }

    public ArrayList<User> getAllCustomer() {
        ArrayList<User> list = new ArrayList<>();
        String query = "SELECT *"
                + "  FROM [dbo].[Customer]"
                + "  WHERE [RoleID] = 2";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2)));
            }
        } catch (SQLException e) {
            e.getMessage();
        }
        return list;
    }

    public boolean insert(User user, String password) {
        boolean status = false;

        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("INSERT INTO [dbo].[Customer]\n"
                    + "           ([RoleID]\n"
                    + "           ,[Account]\n"
                    + "           ,[Password]\n"
                    + "           ,[FullName]\n"
                    + "           ,[Email]\n"
                    + "           ,[Phone]\n"
                    + "           ,[Address])"
                    + "VALUES "
                    + "( " + user.getRoleID()
                    + ", N'" + user.getUserAccount()
                    + "', '" + password
                    + "', N'" + user.getUserFullName()
                    + "', N'" + user.getUserEmail()
                    + "', N'" + user.getUserPhone()
                    + "', N'" + user.getUserAddress()
                    + "')");
            ps.executeUpdate();
            status = true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean edit(User user) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Customer] "
                    + "SET "
                    + "[Account] = '" + user.getUserAccount()
                    + "', [FullName] = '" + user.getUserFullName()
                    + "', [Email] = '" + user.getUserEmail()
                    + "', [Phone]= '" + user.getUserPhone()
                    + "', [Address] = '" + user.getUserAddress()
                    + "', [RoleID] = '" + user.getRoleID()
                    + "' WHERE [CustomerID] = " + user.getUserId());
            ps.executeUpdate();
            status = true;
            //System.out.println("UPDATE [dbo].[tblUser] SET [userName] = '"+user.getUserName()+"',[userEmail] = '"+user.getUserEmail()+"', [userPhone]= '"+user.getUserPhone()+"', [userAddress] = "+user.getUserAddress()+" WHERE [userId] = "+user.getUserId());
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean delete(int userId) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql

            PreparedStatement ps = conn.prepareStatement("DELETE FROM [dbo].[Customer]"
                    + "WHERE [CustomerID] = " + userId);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public ArrayList<User> searchAdmin(String keyword) {
        ArrayList<User> list = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Customer] WHERE FullName like ? and RoleID = 1";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<User> searchCustomer(String keyword) {
        ArrayList<User> list = new ArrayList<>();
        String query = "SELECT * FROM [dbo].[Customer] WHERE FullName like ? and RoleID = 2";
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + keyword + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean updateResetPasswordToken(String token, int userId) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Customer] SET [token] = ?"
                    + " WHERE [CustomerID] = " + userId);
            ps.setString(1, token);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public int findUserByEmail(String email) {
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement("SELECT [CustomerID] FROM [dbo].[Customer]"
                    + " WHERE [Email] = ?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next() == false) {
                return -1;
            } else {
                int uid = rs.getInt(1);
                return uid;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public User findUserByToken(String token) {
        User user = null;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM [dbo].[Customer]"
                    + " WHERE [token] = ?");
            ps.setString(1, token);
            rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(
                        rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(2));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return user;
    }

    public boolean updatePassword(String pass, String token) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Customer] SET [Password] = ?, [token] = NULL"
                    + " WHERE [token] = ?");
            ps.setString(1, pass);
            ps.setString(2, token);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }

    public boolean updateProfile(String fullname, String email, String phone, int userId) {
        boolean status = false;
        try {
            conn = db.getConnectDB();//mo ket noi voi sql
            PreparedStatement ps = conn.prepareStatement("UPDATE [dbo].[Customer] SET [FullName] = ?, [Email] = ?, [Phone] = ?"
                    + " WHERE [CustomerID] = " + userId);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.executeUpdate();
            status = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return status;
    }
}
