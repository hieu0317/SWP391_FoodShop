/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Account;

import models.CartDetail;
import models.Category;
import models.Product;
import models.ProductImage;


import models.Role;

/**
 *

 * @author asus
 */
public class AccountDBContext extends DBContext<Account> {

    public Account getAccountByID(int accountID) {
    PreparedStatement stm = null;
    ResultSet rs = null;
       
    try {
        
        String sql = "SELECT a.accountID, a.email, a.password, a.roleID, a.fullname, a.phonenum, a.address, a.status, r.roleName FROM Account a "
                + "INNER JOIN Role r ON a.roleID = r.roleID WHERE a.accountID = ?";
        stm = connection.prepareStatement(sql);
        stm.setInt(1, accountID);
        rs = stm.executeQuery();
        while (rs.next()) {
            Account account = new Account();
            account.setAccountID(rs.getInt("accountID"));
            account.setEmail(rs.getString("email"));
            account.setPassword(rs.getString("password"));
            Role role = new Role();
            role.setRoleID(rs.getInt("roleID"));
            role.setRoleName(rs.getString("roleName"));
            account.setRole(role);
            account.setFullName(rs.getString("fullname"));
            account.setPhoneNumber(rs.getString("phonenum"));
            account.setAddress(rs.getString("address"));
            account.setStatus(rs.getBoolean("status"));
            
            role.setRoleID(rs.getInt("roleID"));
            role.setRoleName(rs.getString("roleName"));

            account.setRole(role);
            System.out.println("Lay thong tin profile thanh cong "+ accountID);
            return account;
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return null;
}
    
   public void updateProfile(int accountID, String email, String password, String fullname, String phonenum, String address) {
    PreparedStatement stm = null;
    try {
        String sql = "UPDATE Account SET email = ?, password = ?, fullname = ?, phonenum = ?, address = ? WHERE accountID = ?";
        stm = connection.prepareStatement(sql);
        
        // Đặt các giá trị cho câu lệnh SQL
        stm.setString(1, email);
        stm.setString(2, password);
        stm.setString(3, fullname);
        stm.setString(4, phonenum);
        stm.setString(5, address);
        stm.setInt(6, accountID);
        
        // Thực thi câu lệnh SQL
        int rowsUpdated = stm.executeUpdate();
        
        if (rowsUpdated > 0) {
            System.out.println("Thông tin profile đã được cập nhật thành công.");
        } else {
            System.out.println("Không tìm thấy tài khoản để cập nhật.");
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}


    public Account checkLogin(String email, String password) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT accountID, email, password, roleID, fullname,phonenum, address, status \n"
                    + "FROM [dbo].[account] \n"
                    + "WHERE [email] = ? and [password] = ?";
            stm = connection.prepareStatement(sql);           
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            while (rs.next()) {
                Account a = new Account();

                a.setEmail(email);
                a.setPassword(password);
                a.setAccountID(rs.getInt(1));
                a.setRole(new RoleDBContext().get(rs.getInt(4)));
                a.setFullName(rs.getNString(5));
                a.setPhoneNumber(rs.getString(6));
                a.setStatus(rs.getBoolean(7));
                a.setAddress(rs.getString("address"));
                
                return a;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void checkSignup(String email, String password, String fullname, String phone, String address) {
        PreparedStatement stm = null;
        try {
             String sql = "INSERT INTO [dbo].[account]([email],[password],[roleID],"
                    + "[fullname],[phonenum],[address],[status])\n" +
                    "VALUES(?,?,1,?,?,?,0)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            stm.setString(3, fullname);
            stm.setString(4, phone);
            stm.setString(5, address);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
        finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;

    }

    @Override
    public ArrayList<Account> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


    public ArrayList<Account> editAccount(String account) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
