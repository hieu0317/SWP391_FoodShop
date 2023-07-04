/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.guestController;

import dal.CartDBContext;
import dal.CategoryDBContext;
import dal.ProductDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import models.Account;
import models.CartDetail;
import models.Category;
import models.Product;

/**
 *
 * @author admin
 */
public class HomeController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account acc = (Account) session.getAttribute("acc");
        int productID = Integer.parseInt(req.getParameter("productID"));
        int quantity = 1;        
        CartDBContext cDb = new CartDBContext();
   
            CartDetail cd = new CartDetail();
            Account a = new Account();
            Product p = new Product();
            a.setAccountID(acc.getAccountID());
            cd.setAccount(a);
            cd.setQuantity(quantity);
            p.setProductID(productID);
            cd.setP(p);
            cDb.insert(cd);
            resp.sendRedirect("home");
               
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses = req.getSession();
        CategoryDBContext cDb = new CategoryDBContext();
        ArrayList<Category> categories = cDb.all();
        ses.setAttribute("categories", categories);
        req.setAttribute("categories", categories);
        
        ProductDBContext pDb = new ProductDBContext();
        ArrayList<Product> recProduct = pDb.getRecProduct();
        req.setAttribute("recProduct", recProduct);
        req.getRequestDispatcher("views/guest/home.jsp").forward(req, resp);
    }
    
}
