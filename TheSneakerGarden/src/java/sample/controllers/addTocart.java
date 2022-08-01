/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import dbmanager.ProductManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;

/**
 *
 * @author Admin
 */
@WebServlet(name = "addTocart", urlPatterns = {"/addToCart"})
public class addTocart extends HttpServlet {

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
        //response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        int ID = Integer.valueOf(request.getParameter("id"));
        int size = 0;
        if (request.getParameter("size") != null) {
            size = Integer.valueOf(request.getParameter("size"));

        }

        ProductManager pm = new ProductManager();
        System.out.println(pm.getProductQuantityByProSize(size, ID) + "===========");
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = null;
        if (session.getAttribute("cart") == null) {
            cart = new HashMap<>();
        } else {
            cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        }
        if ("add".equals(action)) {
            boolean found = false;
            int i = 0;
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                if(request.getParameter("quantity") != null && request.getParameter("index") != null ){
                    int abc = Integer.valueOf(request.getParameter("index"));
                    if(i == Integer.valueOf(request.getParameter("index"))){
                        if (pm.getProductQuantityByProSize(entry.getValue().getSize(), entry.getValue().getProductID()) < Integer.valueOf(request.getParameter("quantity"))) {
                                entry.getValue().setQuantity(pm.getProductQuantityByProSize(entry.getValue().getSize(), entry.getValue().getProductID()));
                            }else{
                            entry.getValue().setQuantity(Integer.valueOf(request.getParameter("quantity")));
                        }
                    }
                }else if (entry.getKey() == ID) {
                    //Product product = pm.getProductByID(ID);
                    if (entry.getValue().getSize() != size) {
                        if (request.getParameter("product-quantity") != null) {
                            if (pm.getProductQuantityByProSize(size, ID) < Integer.valueOf(request.getParameter("product-quantity"))) {
                                entry.getValue().setQuantity(pm.getProductQuantityByProSize(size, ID));
                            }else {
                                entry.getValue().setQuantity(entry.getValue().getQuantity() + Integer.valueOf(request.getParameter("product-quantity")));
                            }
                            found = true;
                        } else {
                            entry.getValue().setQuantity(entry.getValue().getQuantity() + 1);
                            found = true;
                        }
                    }
                }
                i++;
            }
            if (!found) {
                if (request.getParameter("product-quantity") != null) {
                    if (pm.getProductQuantityByProSize(size, ID) < Integer.valueOf(request.getParameter("product-quantity"))) {
                        cart.put((ID + 1) * size, new CartItem(1, ID, pm.getProductQuantityByProSize(size, ID), size));
                    } else {
                        cart.put((ID + 1) * size, new CartItem(1, ID, Integer.valueOf(request.getParameter("product-quantity")), size));
                    }
                } else if(request.getParameter("quantity") == null) {
                    cart.put((ID + 1) * size, new CartItem(1, ID, 1, size));
                }

            }
            session.setAttribute("cart", cart);
            request.getRequestDispatcher("/cart").include(request, response);
        }
        if ("minus".equals(action)) {
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                if (entry.getValue().getProductID() == ID && entry.getValue().getSize() == size) {
                    entry.getValue().setQuantity(entry.getValue().getQuantity() - 1);
                    if (entry.getValue().getQuantity() <= 0) {
                        cart.remove(entry.getKey());
                    }
                    if (cart.size() <= 0) {
                        session.setAttribute("cart", null);
                    }
                }

            }
        }
        if ("plus".equals(action)) {
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                if (entry.getValue().getProductID() == ID && entry.getValue().getSize() == size) {
                    System.out.println(size + "ddddddddddd");
                    if (pm.getProductQuantityByProSize(entry.getValue().getSize(), ID) <= entry.getValue().getQuantity()) {
                        entry.getValue().setQuantity(entry.getValue().getQuantity());
                    } else {
                        entry.getValue().setQuantity(entry.getValue().getQuantity() + 1);
                    }

                }

            }
        }
        if ("remove".equals(action)) {
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                if (entry.getValue().getProductID() == ID && entry.getValue().getSize() == size) {
                    cart.remove(entry.getKey());
                    }
                    if (cart.size() <= 0) {
                        session.setAttribute("cart", null);
                    }
            }
        }
        request.getRequestDispatcher("/cart").include(request, response);
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
