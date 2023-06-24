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
import models.Category;
import models.Feedback;

/**
 *
 * @author PC1
 */
public class FeedbackDBContext extends DBContext<Feedback> {

    @Override
    public void insert(Feedback model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Feedback model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Feedback model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Feedback get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Feedback> all() {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from feedback";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setFeedbackID(rs.getInt(1));
                fb.setProduct(new ProductDBContext().get(rs.getInt(2)));
                fb.setAccount(new AccountDBContext().get(rs.getInt(3)));
                fb.setFcontent(rs.getNString(4));
                fb.setDate(rs.getDate(5));
                feedbacks.add(fb);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return feedbacks;
    }
        public ArrayList<Feedback> getFeedBackByProductID(int id) {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from feedback where productID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setFeedbackID(rs.getInt(1));
                fb.setProduct(new ProductDBContext().get(rs.getInt(2)));
                fb.setAccount(new AccountDBContext().get(rs.getInt(3)));
                fb.setFcontent(rs.getNString(4));
                fb.setDate(rs.getDate(5));
                fb.setIsDeleted(rs.getBoolean(6));
                feedbacks.add(fb);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return feedbacks;
    }
    
    public void DelFeedBackByID(int id) {
        ArrayList<Feedback> feedbacks = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update feedback set isDeleted = 1 where feedbackID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

}
