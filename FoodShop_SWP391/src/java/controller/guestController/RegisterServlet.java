/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.guestController;

import dal.AccountDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.GetParam;
import utils.RandomCode;
import utils.SendMail;

/**
 *
 * @author Asus
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = GetParam.getStringParam(request, "email", "Enter your email",
                "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", "This is not gmail", 5, 50, null);
        if (email == null) {
            return false;
        }
        return true;
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
        request.getRequestDispatcher("views/guest/register.jsp").forward(request, response);
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

        if (processRequest(request, response)) {
            AccountDBContext uDao = new AccountDBContext();
            String name = request.getParameter("fullname");            
            String pass = request.getParameter("pass");
            String repass = request.getParameter("repass");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phone");
            String address = request.getParameter("address");
            if (!pass.equals(repass)) {
                response.sendRedirect("client/register.jsp");
            } else {
                
                if (uDao.checkAccountExit(email) == null) {
                    RandomCode getRandom = new RandomCode();
                    String randomCode = getRandom.generateRandomCode(6);

                    HttpSession session = request.getSession();
                    session.setAttribute("fullname", name);
                    session.setAttribute("email", email);                   
                    session.setAttribute("code", randomCode);
                    session.setAttribute("pass", pass);
                    session.setAttribute("address", address);
                    session.setAttribute("phone", phoneNumber);
                    session.setMaxInactiveInterval(300);
                    
                    String subject = "Mã đăng kí tài khoản EDUBIN của bạn";                   
                    String message = "<div style=\"font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2\">\n"
                    + "  <div style=\"margin:50px auto;width:70%;padding:20px 0\">\n"
                    + "    <div style=\"border-bottom:1px solid #eee\">\n"
                    + "      <a href=\"\" style=\"font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600\">FoodShop</a>\n"
                    + "    </div>\n"
                    + "    <p style=\"font-size:1.1em\">Hi,</p>\n"
                    + "    <p>We are happy to have you started. First you need to activate your account.Your activation code is below. Please do not share this code with anyone.</p>\n"
                    + "    <h2 style=\"background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;\">"+randomCode+"</h2>\n"
                    + "    <p style=\"font-size:0.9em;\">Regards,<br />FoodShop</p>\n"
                    + "    <hr style=\"border:none;border-top:1px solid #eee\" />\n"
                    + "    <div style=\"float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300\">\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>";
                    SendMail send = new SendMail();
                    send.sentMail(email, subject, message);
                    request.getRequestDispatcher("views/guest/registerCodeMail.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Gmail is exist ");
                    request.getRequestDispatcher("views/guest/register.jsp").forward(request, response);
                }
            }
            
        } else {
            this.doGet(request, response);
        }
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
