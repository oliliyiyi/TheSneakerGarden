/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import dbmanager.OrderManager;
import dbmanager.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Order;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProfileControl", urlPatterns = {"/profile"})
public class ProfileControl extends HttpServlet {

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

        HttpSession session = request.getSession();
        ArrayList<CartItem> listItem = new ArrayList<>();
        ArrayList<Order> listOrder = new ArrayList<>();
        OrderManager order = new OrderManager();
        int id = Integer.valueOf(request.getParameter("id"));
        if (session.getAttribute("user") == null) {
            response.sendRedirect("./login");
        } else {
            User userSession = (User) session.getAttribute("user");
            if (id != userSession.getUserId()) {
                response.sendRedirect("./login");
            } else {
                listOrder = order.getAllOrderByUserID(userSession.getUserId());

                for (int i = 0; i < listOrder.size(); i++) {
                    listItem.addAll(order.getAllProductByOrderID(listOrder.get(i).getOrderId()));
                }
                UserManager manager = new UserManager();
                User user = manager.getUser(id);

                request.setAttribute("detail", user);
                request.setAttribute("tab", "history");
                request.setAttribute("listOrderHistory", listOrder);
                request.setAttribute("orderHistory", listItem);
                request.getRequestDispatcher("./view/customer/profile.jsp").forward(request, response);
            }
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
        int id = Integer.valueOf(request.getParameter("id"));
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        UserManager userManager = new UserManager();
        userManager.updateProfile(fullname, email, phone, id);
        processRequest(request, response);
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
