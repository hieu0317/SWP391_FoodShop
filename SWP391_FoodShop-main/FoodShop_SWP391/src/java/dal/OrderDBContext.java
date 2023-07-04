/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Category;
import models.Order;
import models.OrderInfo;
import models.OrderStatus;
import models.Product;
import models.ProductImage;

/**
 *
 * @author toden
 */
public class OrderDBContext extends DBContext<Order> {

    @Override
    public void insert(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Order model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Order get(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [order] where orderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setAccount(new AccountDBContext().get(rs.getInt(1)));
                o.setOrderID(rs.getInt(2));
                o.setTotal(rs.getInt(3));
                o.setDate(rs.getDate(4));
                o.setAddress(rs.getNString(5));
                o.setNote(rs.getNString(6));
                o.setOrderStatus(getOrderStatusByID(rs.getInt(7)));
                o.setOrderInfo(getOrderInfoByOrderID(rs.getInt(2)));
                return o;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Order> all() {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [order]";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setAccount(new AccountDBContext().get(rs.getInt(1)));
                o.setOrderID(rs.getInt(2));
                o.setTotal(rs.getInt(3));
                o.setDate(rs.getDate(4));
                o.setAddress(rs.getNString(5));
                o.setNote(rs.getNString(6));
                o.setOrderStatus(getOrderStatusByID(rs.getInt(7)));
                o.setOrderInfo(getOrderInfoByOrderID(rs.getInt(2)));
                orders.add(o);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public OrderStatus getOrderStatusByID(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from orderStatus where orderStatusID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderStatus os = new OrderStatus();
                os.setOrderStatus(rs.getInt(1));
                os.setOrderStatusName(rs.getNString(2));
                return os;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<OrderInfo> getOrderInfoByOrderID(int id) {
        ArrayList<OrderInfo> OrderInfos = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from orderInfo where orderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderInfo oi = new OrderInfo();
                oi.setOrderID(rs.getInt(1));
                oi.setProducts(new ProductDBContext().get(rs.getInt(2)));
                oi.setQuantiy(rs.getInt(3));
                OrderInfos.add(oi);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderInfos;
    }

    public List<OrderStatus> getAllOrderStatus(){
        ArrayList<OrderStatus> OrderStatuses = new ArrayList<>();
        String sql = "select * from [orderStatus]";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                OrderStatus oi = new OrderStatus();
                oi.setOrderStatus(rs.getInt(1));
                oi.setOrderStatusName(rs.getString(2));
                OrderStatuses.add(oi);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderStatuses;
    }
    
    public void updateOrderStatus(int orderId, int orderStatus){
        String sql = "update [order] set orderStatusID = ? where orderID = ?";
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, orderStatus);
            stm.setInt(2, orderId);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
