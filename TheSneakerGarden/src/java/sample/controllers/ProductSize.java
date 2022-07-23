/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import dbmanager.ProductManager;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Inventory;
import model.Product;
import model.Size;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductSize", urlPatterns = {"/ProductSize"})
public class ProductSize extends HttpServlet {

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
        int id = Integer.valueOf(request.getParameter("id"));
        ProductManager pm = new ProductManager();
        ArrayList<Inventory> inv = pm.getProductQuantityByProID(id);
        Product pro = pm.getProductByID(id);
        if (request.getParameter("action") != null) {
            if ("add".equals(request.getParameter("action"))) {
                request.getRequestDispatcher("./view/admin/add-size.jsp").forward(request, response);
            }
        }
        
        request.setAttribute("ListInv", inv);
        request.setAttribute("Product", pro);
        request.getRequestDispatcher("./view/admin/productSize.jsp").forward(request, response);
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
        ProductManager pm = new ProductManager();
        if (request.getParameter("action") != null) {
            if ("add".equals(request.getParameter("action"))) {
                //int id = Integer.valueOf(request.getParameter("id"));
                int proID = Integer.parseInt(request.getParameter("id"));
                int sizeNum = Integer.parseInt(request.getParameter("size"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                if (pm.getProductQuantityByProSize(sizeNum, proID) != 0) {
                    if (pm.updateSize(sizeNum, proID, quantity)) {
                        ProductManager manager = new ProductManager();
                        ArrayList<Inventory> inv = manager.getProductQuantityByProID(proID);
                        Product pro = pm.getProductByID(proID);
                        request.setAttribute("ListInv", inv);
                        request.setAttribute("Product", pro);
                        request.setAttribute("addSize", "OK");
                        request.getRequestDispatcher("./view/admin/productSize.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("./view/admin/add-size.jsp").forward(request, response);
                    }
                } else {
                    if (pm.insertSize(sizeNum, proID, quantity)) {
                        ProductManager manager = new ProductManager();
                        ArrayList<Inventory> inv = manager.getProductQuantityByProID(proID);
                        Product pro = pm.getProductByID(proID);
                        request.setAttribute("ListInv", inv);
                        request.setAttribute("Product", pro);
                        request.setAttribute("addSize", "OK");
                        request.getRequestDispatcher("./view/admin/productSize.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("./view/admin/add-size.jsp").forward(request, response);
                    }
                }

            }
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
