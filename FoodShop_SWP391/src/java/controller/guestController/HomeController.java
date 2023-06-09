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
    String productIDParam = req.getParameter("productID");
    
    // Kiểm tra xem tham số productID có giá trị hợp lệ hay không
    if (productIDParam == null || productIDParam.isEmpty()) {
        // Xử lý lỗi khi productID không hợp lệ
        resp.sendRedirect("home"); // Hoặc chuyển hướng đến trang lỗi nếu cần
        return;
    }
    
    int productID;
    try {
        productID = Integer.parseInt(productIDParam);
    } catch (NumberFormatException e) {
        // Xử lý lỗi khi không thể chuyển đổi productID thành số nguyên
        resp.sendRedirect("home"); // Hoặc chuyển hướng đến trang lỗi nếu cần
        return;
    }
    
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
        HttpSession session = req.getSession();
        HttpSession ses = req.getSession();
        CategoryDBContext cDb = new CategoryDBContext();
        ArrayList<Category> categories = cDb.all();
        ses.setAttribute("categories", categories);
        req.setAttribute("categories", categories);
        session.setAttribute("categories", categories);
        ProductDBContext pDb = new ProductDBContext();
        ArrayList<Product> recProduct = pDb.getRecProduct();
        req.setAttribute("recProduct", recProduct);
        req.getRequestDispatcher("views/guest/home.jsp").forward(req, resp);
    }
    
}
