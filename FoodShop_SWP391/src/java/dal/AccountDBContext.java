/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;

/**
 *
 * @author ngxso
 */
public class AccountDBContext extends DBContext<Account> {

    public Account checkLogin(String email, String password) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM [dbo].[account]\n"
                    + "WHERE [email] = ? and [password] = ?";
            stm = connection.prepareStatement(sql);           
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Account();
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void checkSignup(String email, String password, String fullname, String phone, String address) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "INSERT [dbo].[account]([email],[password],[roleID],[fullname],[phonenum],[address],[status]) VALUES (?,?,1,?,?,?,0)";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, fullname);
            stm.setString(4, phone);
            stm.setString(5, address);
            stm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account checkLoginAdmin(String emmail, String password) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * from [dbo].[Account] where [roleID] = '1'";
            stm = connection.prepareStatement(sql);
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkLoginSale(String emmail, String password) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * from [dbo].[Account] where [roleID] = '2'";
            stm = connection.prepareStatement(sql);
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkLoginMKT(String emmail, String password) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * from [dbo].[Account] where [roleID] = '3'";
            stm = connection.prepareStatement(sql);
        } catch (SQLException e) {

        }
        return null;
    }

    public Account checkAccountExit(String email) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from Account where email = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setEmail(rs.getString("email"));
                a.setPassword(rs.getString("password"));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDBContext acc = new AccountDBContext();
        acc.checkLogin("ngxson2411@gmail.com", "123465");
        System.out.println(acc);
    }
 

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from account where accountID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setAccountID(id);
                a.setEmail(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setAddress(rs.getString(7));
                a.setStatus(rs.getBoolean(8));
                return a;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
//        finally {
//            try {
//                rs.close();
//                stm.close();
//                connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
        return null;
    }

    @Override
    public ArrayList<Account> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
