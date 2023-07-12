/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.customerController;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author asus
 */
public class ChangePassword extends HttpServlet {

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
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
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
        System.out.println("Get changePass");
        request.getRequestDispatcher("views/account/changePassword.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");

        // Perform password change
        AccountDBContext accountDB = new AccountDBContext();
        boolean passwordCorrect = accountDB.checkPassword(email, currentPassword);
        if (!passwordCorrect) {
            // Mật khẩu không chính xác, quay lại trang changePassword.jsp
            request.setAttribute("ms2", "Your old password is incorrect. Please check again.");
            request.getRequestDispatcher("views/account/changePassword.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu mới và xác nhận mật khẩu mới
        if (newPassword.equals(currentPassword)) {
            // Mật khẩu mới không được trùng với mật khẩu cũ, quay lại trang changePassword.jsp
            request.setAttribute("ms1", "New password cannot be the same as the old password. Please choose a different password.");
            System.out.println("ms1");
            request.getRequestDispatcher("views/account/changePassword.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmNewPassword)) {
            // Xác nhận mật khẩu mới không khớp, quay lại trang changePassword.jsp
            System.out.println("ms3");
            request.setAttribute("ms3", "Confirmed password does not match the new password. Please try again.");
            request.getRequestDispatcher("views/account/changePassword.jsp").forward(request, response);
            return;
        }

        // Thực hiện thay đổi mật khẩu
        boolean passwordChanged = accountDB.changePassword(email, currentPassword, newPassword);

        if (passwordChanged) {
            // Thay đổi mật khẩu thành công, chuyển hướng đến trang profile.jsp
            request.setAttribute("sc", "Change password success.");
            System.out.println("sc");
            request.getRequestDispatcher("views/account/changePassword.jsp").forward(request, response);
        
        } else {
            // Thay đổi mật khẩu thất bại, quay lại trang changePassword.jsp
            System.out.println("ms2");
            request.setAttribute("ms2", "Your old password is incorrect. Please check again.");
            request.getRequestDispatcher("views/account/changePassword.jsp").forward(request, response);
        }
    }

    @Override

    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
