/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Blog;
import models.BlogImage;

/**
 *
 * @author toden
 */
public class BlogDAO extends DBContext<Blog> {

    public void addBlogImg(String part) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "insert into blogImage(blogID,url) values(?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, getNewestBlog());
            stm.setString(2, part);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addBlog(String title, String detail, int accid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "insert into blog(accountID,blogTitle,blogDetail,date,status) values(?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, accid);
            stm.setNString(2, title);
            stm.setNString(3, detail);
            stm.setDate(4, new java.sql.Date(new Date().getTime()));
            stm.setBoolean(5, true);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getNewestBlog() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select top 1 blogID from [dbo].[blog] order by blogID desc";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public BlogImage getBlogImageByid(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [dbo].[blogImage] where blogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                BlogImage b = new BlogImage();
                b.setBlogID(id);
                b.setImageID(rs.getInt(2));
                b.setUrl(rs.getString(3));
                return (b);
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

    public void delBlogById(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "update [dbo].[blog] set status = 0 where blogID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void insert(Blog model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Blog model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Blog model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Blog get(int id) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select * from blog where blogID=?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setAccount(new AccountDBContext().get(rs.getInt(1)));
                b.setBlogID(id);
                b.setBlogTitle(rs.getNString(3));
                b.setBlogDetail(rs.getNString(4));
                b.setDate(rs.getDate(5));
                b.setStatus(rs.getBoolean(6));
                b.setBlogImage(getBlogImageByid(id));
                return (b);
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    @Override
    public ArrayList<Blog> all() {
        ArrayList<Blog> blogs = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "select accountID, blogID, blogTitle, blogDetail, date, status from blog";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setAccount(new AccountDBContext().get(rs.getInt(1)));
                b.setBlogID(rs.getInt(2));
                b.setBlogTitle(rs.getNString(3));
                b.setBlogDetail(rs.getNString(4));
                b.setDate(rs.getDate(5));
                b.setStatus(rs.getBoolean(6));
                b.setBlogImage(getBlogImageByid(rs.getInt(2)));
                blogs.add(b);
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
        return blogs;
    }

}
