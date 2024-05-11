/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.UserDAO;
import models.user;

/**
 *
 * @author DMX THANH SON
 */
public class fogotPassword extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet fogotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet fogotPassword at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String user = request.getParameter("username");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        String resetpass = request.getParameter("resetpass");
        String error = "";
        UserDAO dao = new UserDAO();
        user acc = dao.checkAccExist(user);
        
        if (acc == null) {
            error = "Username does not exist!!!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("Fogetpass.jsp").forward(request, response);
        } else {
           boolean check = dao.checkAnswer(user, question, answer);
            if (check == false) {
                error = "Wrong question or answer!!!";
                request.setAttribute("error", error);
                request.getRequestDispatcher("Fogetpass.jsp").forward(request, response);
            } else {
                // Đặt lại mật khẩu
                dao.resetPassword(user, resetpass);
                // Chuyển hướng đến trang Login.jsp
                response.sendRedirect("Login.jsp");
                return; // Không cần tiếp tục thực hiện mã sau khi chuyển hướng
            }
        }
        request.setAttribute("error", error);
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
