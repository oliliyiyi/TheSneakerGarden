/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import dbmanager.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserManagerControl", urlPatterns = {"/user-management"})
public class UserManagerControl extends HttpServlet {

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
        UserManager userManager = new UserManager();
        ArrayList<User> listUser = userManager.getAllCustomer();
        if (request.getParameter("action") != null) {
            if ("update".equals(request.getParameter("action"))) {
                User user1 = userManager.getUser(Integer.valueOf(request.getParameter("id")));
                request.setAttribute("user1", user1);
                request.getRequestDispatcher("./view/admin/update-user.jsp").forward(request, response);
            }
            if ("add_customer".equals(request.getParameter("action"))) {
                request.getRequestDispatcher("./view/admin/add-user.jsp").forward(request, response);
            }
            if ("add_admin".equals(request.getParameter("action"))) {
                request.getRequestDispatcher("./view/admin/add-admin.jsp").forward(request, response);
            }
            if ("delete".equals(request.getParameter("action"))) {
                int id = Integer.valueOf(request.getParameter("id"));

                if (userManager.delete(id)) {
                    listUser = userManager.getAllUser();
                    request.setAttribute("listUser", listUser);
                    request.getRequestDispatcher("./view/admin/user-management.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("./view/admin/user-management.jsp").forward(request, response);
                }
            }
        }
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("./view/admin/user-management.jsp").forward(request, response);

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
        UserManager userManager = new UserManager();
        ArrayList<User> listUser = userManager.getAllCustomer();
        if (request.getParameter("action") != null) {

            if ("add_customer".equals(request.getParameter("action"))) {
                //int id = Integer.valueOf(request.getParameter("id"));
                String account = request.getParameter("account");
                //String password = request.getParameter("password");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                User user = new User(1, account, name, email, phone, address, 2);
                if (userManager.CheckUserExist(account) == null) {
                    userManager.insert(user, "12345");
                    listUser = userManager.getAllCustomer();
                    request.setAttribute("listUser", listUser);
                    request.getRequestDispatcher("./view/admin/user-management.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("./view/admin/add-user.jsp").forward(request, response);
                }
            }

            if ("update".equals(request.getParameter("action"))) {
                int id = Integer.valueOf(request.getParameter("id"));
                String account = request.getParameter("account");
                //String password = request.getParameter("password");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                int role = Integer.valueOf(request.getParameter("role"));
                User user1 = new User(id, account, name, email, phone, address, role);
                if (userManager.edit(user1)) {
                    listUser = userManager.getAllCustomer();
                    request.setAttribute("listUser", listUser);
                    request.getRequestDispatcher("./view/admin/user-management.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("./view/admin/update-user.jsp").forward(request, response);
                }
            }
        }
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("./view/admin/user-management.jsp").forward(request, response);

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
