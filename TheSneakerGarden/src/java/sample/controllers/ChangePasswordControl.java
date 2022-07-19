/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import dbmanager.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author voanh
 */
@WebServlet(name = "ChangePasswordControl", urlPatterns = {"/changePassword"})
public class ChangePasswordControl extends HttpServlet {

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
        String token = request.getParameter("token");
        try {
            UserManager userManager = new UserManager();
            User user = userManager.findUserByToken(token);
            if (user == null) {
                request.setAttribute("tokenerror", "Token is invalid");
                request.getRequestDispatcher("./view/customer/change-pass.jsp").forward(request, response);
            }
            request.setAttribute("token", token);
            request.getRequestDispatcher("./view/customer/change-pass.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
        String token = request.getParameter("token");
        String pass = request.getParameter("password");
        String repass = request.getParameter("re-password");
        try {
            boolean valid = true;
            String errorString = null;
            if (!pass.equals(repass)) {
                valid = false;
                errorString = "Password is not match!";
            }
            if (!valid) {
                request.setAttribute("msg", errorString);
                request.setAttribute("token", token);
                request.getRequestDispatcher("./view/customer/change-pass.jsp").forward(request, response);
            } else {
                UserManager userManager = new UserManager();
                userManager.updatePassword(repass, token);
                response.sendRedirect(request.getContextPath()+"/login");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
