/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Order;
import models.OrderInfo;
import models.OrderStatus;
import models.Product;
import models.ProductImage;


/**
 *
 * @author admin
 */
public class OrderDBContext extends DBContext<Order>{

    public void insertOrderInfo(OrderInfo model) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[orderInfo]([orderID],[productID],[quantity])\n"
                    + "VALUES(?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getOrderID());
            stm.setInt(2, model.getProduct().getProductID());
            stm.setInt(3, model.getQuantity());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }   
    
    public ArrayList<OrderInfo> getOrderInfoByID(int id){
        ArrayList<OrderInfo> ois = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select oi.productID,p.productName ,oi.quantity, p.price, pi.url from orderInfo oi\n"
                    + "inner join product p\n"
                    + "on oi.productID = p.productID\n"
                    + "inner join productImage pi\n"
                    + "on p.productID = pi.imageID\n"
                    + "where oi.orderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
             while (rs.next()) {
                OrderInfo oi = new OrderInfo();
                oi.setOrderID(id);
                oi.setQuantity(rs.getInt("quantity"));
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getInt("price"));
                ProductImage pi = new ProductImage();
                pi.setUrl(rs.getString("url"));
                p.setProductImage(pi);
                oi.setProduct(p);
                ois.add(oi);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ois;
    }
    
    public Order getOrderByID(int id){
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select o.customerName,o.date,o.total,os.orderStatusName from [order] o \n"
                    + "inner join orderStatus os \n"
                    + "on o.orderStatusID = os.orderStatusID\n"
                    + "where o.orderID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            if (rs.next()) {
                Order o = new Order();
                o.setCustomerName(rs.getString("customerName"));
                o.setDate(rs.getDate("date"));
                o.setTotal(rs.getInt("total"));
                OrderStatus os = new OrderStatus();
                os.setOrderStatusName(rs.getString("orderStatusName"));
                o.setOrderStatus(os);
                return o;
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    public ArrayList<Order> getOrdersByAccountIDAndName(int id, String name){
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "  select distinct o.orderID, o.customerName,p.productID,p.productName ,o.paymentMethod, o.total,\n"
                    + "               o.date, os.orderStatusName from [order] o\n"
                    + "               inner join orderStatus os\n"
                    + "               on o.orderStatusID = os.orderStatusID\n"
                    + "		      inner join orderInfo oi\n"
                    + "	              on oi.orderID = o.orderID\n"
                    + "		      inner join product p\n"
                    + "		      on p.productID = oi.productID\n"
                    + "               where o.accountID = ? \n";
            if(name != null){
                sql += "and p.productName like '%" + name + "%'";
            }
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
             while (rs.next()) {
                Order order = new Order();
                order.setCustomerName(rs.getString("customerName"));
                OrderInfo oi = new OrderInfo();
                oi.setOrderID(rs.getInt("orderID"));
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                oi.setProduct(p);
                order.setPaymentMethod(rs.getString("paymentMethod"));
                order.setTotal(rs.getInt("total"));
                order.setDate(rs.getDate("date"));
                OrderStatus os = new OrderStatus();
                os.setOrderStatusName(rs.getString("orderStatusName"));
                order.setOrderInfo(oi);
                order.setOrderStatus(os);
                orders.add(order);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orders;
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
    public ArrayList<Order> all() {
        ArrayList<Order> orders = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select o.orderID,o.customerName,o.email,o.address,o.phoneNumber,o.note,o.date,o.total\n"
                    + "  ,o.paymentMethod,o.orderStatusID,os.orderStatusName from [order] o\n"
                    + "  inner join orderStatus os\n"
                    + "  on o.orderStatusID = os.orderStatusID";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setEmaill(rs.getString("email"));
                order.setPhoneNumber(rs.getString("phoneNumber"));
                order.setTotal(rs.getInt("total"));
                order.setAddress(rs.getString("address"));
                order.setCustomerName(rs.getString("customerName"));
                order.setDate(rs.getDate("date"));
                order.setNote(rs.getString("note"));
                order.setPaymentMethod(rs.getString("paymentMethod"));
                OrderStatus os = new OrderStatus();
                os.setOrderStatusID(rs.getInt("orderStatusID"));
                os.setOrderStatusName(rs.getString("orderStatusName"));
                order.setOrderStatus(os);
                OrderInfo oi = new OrderInfo();
                oi.setOrderID(rs.getInt("orderID"));
                order.setOrderInfo(oi);
                orders.add(order);
            }

        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return orders;
    }

    @Override
    public void insert(Order model) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "([accountID],[orderID],[total],[date],[address],[note],[orderStatusID],"
                    + "[customerName],[phoneNumber],[email],[paymentMethod])\n"
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getAccount().getAccountID());
            stm.setInt(2, model.getOrderInfo().getOrderID());
            stm.setInt(3, model.getTotal());
            stm.setDate(4, model.getDate());
            stm.setString(5, model.getAddress());
            stm.setString(6, model.getNote());
            stm.setInt(7, 1);
            stm.setString(8, model.getCustomerName());
            stm.setString(9, model.getPhoneNumber());
            stm.setString(10, model.getEmaill());
            stm.setString(11, model.getPaymentMethod());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            try {
                stm.close();
//                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public Order get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
