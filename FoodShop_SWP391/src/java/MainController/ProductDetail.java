/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package MainController;

import dal.FeedbackDBContext;
import dal.LikeDBContext;
import dal.ProductDBContext;
import dal.ReplyDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author PC1
 */
public class ProductDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        ProductDBContext pdb = new ProductDBContext();
        FeedbackDBContext fdb = new FeedbackDBContext();

        if (request.getParameter("fid") != null) {
            LikeDBContext ldb = new LikeDBContext();
            int fid = Integer.parseInt(request.getParameter("fid"));
            Account acc = (Account) session.getAttribute("acc");
            ldb.DelLike(acc.getAccountID(), fid);
        }
        if (request.getParameter("action") != null) {
            LikeDBContext ldb = new LikeDBContext();
            int fid = Integer.parseInt(request.getParameter("fid"));
            Account acc = (Account) session.getAttribute("acc");
            ldb.addLike(acc.getAccountID(), fid);
        }

        int pid = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("p", pdb.get(pid));

        if (request.getParameter("delf") != null) {
            int id = Integer.parseInt(request.getParameter("fid"));
            fdb.DelFeedBackByID(id);
        }
        
        if (request.getParameter("delr") != null) {
            int rid = Integer.parseInt(request.getParameter("rid"));
            new ReplyDBContext().delReply(rid);
        }

        request.setAttribute("detailfeedbacks", fdb.getFeedBackByProductID(pid));
        request.getRequestDispatcher("views/ProductDetail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        FeedbackDBContext fdb = new FeedbackDBContext();
        ProductDBContext pdb = new ProductDBContext();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        int pid = Integer.parseInt(request.getParameter("id"));
        String content = request.getParameter("content");
        String reply = request.getParameter("reply");
        
        if(content!=null){
            fdb.AddFeedback(content, acc.getAccountID(), pid);
        }
        if(reply!=null){
            int fid = Integer.parseInt(request.getParameter("fid"));
            new ReplyDBContext().addReply(reply, acc.getAccountID(), fid);
        }

        request.setAttribute("p", pdb.get(pid));

        request.setAttribute("detailfeedbacks", fdb.getFeedBackByProductID(pid));
        request.getRequestDispatcher("views/ProductDetail.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
