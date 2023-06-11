/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customerController;

import dal.AccountDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.GetParam;
import utils.RandomCode;
import utils.SendMail;

/**
 *
 * @author ngxso
 */
public class ForgotPass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @return
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = GetParam.getStringParam(request, "email", "Enter your email",
                "\\w+([\\.]{0,1}\\w*)*@(\\w{2,5}\\.){1,2}\\w{2,5}", "This is not gmail", 5, 50, null);
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

        request.getRequestDispatcher("views/customer/forgotpass.jsp").forward(request, response);
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

        AccountDBContext acc = new AccountDBContext();
        String email = request.getParameter("email");
        if (acc.getAccountByEmail(email) != null) {
            String randomCode = RandomCode.generateRandomCode(6);
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("code", randomCode);
            session.setMaxInactiveInterval(300);
            String subject = "Your FoodShop Password Reset Code";
            String message = "<div style=\"font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2\">\n"
                    + "  <div style=\"margin:50px auto;width:70%;padding:20px 0\">\n"
                    + "    <div style=\"border-bottom:1px solid #eee\">\n"
                    + "      <a href=\"\" style=\"font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600\">FoodShop</a>\n"
                    + "    </div>\n"
                    + "    <p style=\"font-size:1.1em\">Hi,</p>\n"
                    + "    <p> FoodShop has just received a request to change the website login password for email accounts: " + email + "</p>\n"
                    + "    <p>Please enter the code below to set a new password for your account. Please do not share this code with anyone.</p>\n"
                    + "    <h2 style=\"background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;\">" + randomCode + "</h2>\n"
                    + "    <p style=\"font-size:0.9em;\">Regards,<br />FoodShop</p>\n"
                    + "    <hr style=\"border:none;border-top:1px solid #eee\" />\n"
                    + "    <div style=\"float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300\">\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>";
            SendMail send = new SendMail();
            send.sentMail(email, subject, message);
            request.getRequestDispatcher("views/customer/forgotCodeMail.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Email address not found");
            request.getRequestDispatcher("views/customer/forgotpass.jsp").forward(request, response);
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
