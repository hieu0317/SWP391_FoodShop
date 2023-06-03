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
public abstract class AccountDBContext extends DBContext<Account> {

    public ArrayList<Account> getAllAccounts(int accountID) {
    ArrayList<Account> accounts = new ArrayList<>();
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
            accounts.add(account);
            System.out.println("Lay thong tin profile thanh cong "+ accountID);
        }
    } catch (SQLException ex) {
        Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        try {
            rs.close();
            stm.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return accounts;
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
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
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
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Account> all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Account> editAccount(String account) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
