/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.customerController;

import dal.CartDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import models.Account;
import models.CartDetail;
import models.Product;

/**
 *
 * @author admin
 */
public class DeleteCartController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pID = Integer.parseInt(req.getParameter("pid"));
        int aID = Integer.parseInt(req.getParameter("aid"));
        Account a = new Account();
        a.setAccountID(aID);
        Product p = new Product();
        p.setProductID(pID);
        CartDetail cd = new CartDetail();
        cd.setP(p);
        cd.setAccount(a);
        CartDBContext cDB = new CartDBContext();
        cDB.delete(cd);
        resp.sendRedirect("home/cart");
    }
    
}
