/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import dbmanager.OrderManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;

/**
 *
 * @author Admin
 */
@WebServlet(name = "OrderManagerControl", urlPatterns = {"/order-management"})
public class OrderManagerControl extends HttpServlet {

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
        OrderManager manager = new OrderManager();
        ArrayList<Order> listOrder = manager.getAllOrder();

        if (request.getParameter("action") != null) {
            if ("update".equals(request.getParameter("action"))) {
                Order order = manager.getOrderByID(Integer.valueOf(request.getParameter("id")));
                request.setAttribute("order", order);
                request.getRequestDispatcher("./view/admin/update-order.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("listOrder", listOrder);
            request.getRequestDispatcher("./view/admin/order-management.jsp").forward(request, response);
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
        OrderManager orderManager = new OrderManager();
        ArrayList<Order> listOrder = orderManager.getAllOrder();
        if (request.getParameter("action") != null) {
            if ("update".equals(request.getParameter("action"))) {
                int id = Integer.valueOf(request.getParameter("id"));
                String username = request.getParameter("username");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String shipaddress = request.getParameter("shipaddress");
                Date orderdate = Date.valueOf(request.getParameter("orderdate"));
                Date shipdate = Date.valueOf(request.getParameter("shipdate"));
                int status = Integer.valueOf(request.getParameter("status"));

                Order order = new Order(id, username, phone, shipaddress, email, orderdate, shipdate, status);
                if (orderManager.edit(order)) {
                    listOrder = orderManager.getAllOrder();
                    request.setAttribute("listOrder", listOrder);
                    request.getRequestDispatcher("./view/admin/order-management.jsp").forward(request, response);
                } else {
                    request.setAttribute("order", order);
                    request.getRequestDispatcher("./view/admin/update-order.jsp").forward(request, response);
                }
            }

        } else {
            request.setAttribute("listOrder", listOrder);
            request.getRequestDispatcher("./view/admin/order-management.jsp").forward(request, response);
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
