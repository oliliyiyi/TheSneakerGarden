/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import dbmanager.ProductManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShopControl", urlPatterns = {"/shop"})
public class ShopControl extends HttpServlet {

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
        ProductManager manager = new ProductManager();
        ArrayList<Product> list = manager.getAllProduct();
        ArrayList<Product> list2 = new ArrayList<>(list);
        String paramPrice = "";
        String paramBId = "-1";
        String paramType = "-1";
        if(request.getParameter("price") != null){
            String price = request.getParameter("price");
            paramPrice = price;
            if(price != ""){
                if(price.equals("ascending")){
                list2.sort(new Comparator<Product>() {
                @Override
                public int compare(Product m1, Product m2) {
                    if(m1.getPrice() == m2.getPrice()){
                        return 0;
                    }
                    return m1.getPrice() < m2.getPrice() ? -1 : 1;
                 }
            });
            }else{
                list2.sort(new Comparator<Product>() {
                @Override
                public int compare(Product m1, Product m2) {
                    if(m1.getPrice() == m2.getPrice()){
                        return 0;
                    }
                    return m1.getPrice() > m2.getPrice() ? -1 : 1;
                 }
            });
            }
            }
        }
        ArrayList<Product> list3 = new ArrayList<>(list2);
        if (request.getParameter("bId") != null) {
            int brandID = Integer.valueOf(request.getParameter("bId"));
            if(brandID != -1){
                paramBId = request.getParameter("bId");
                for (int i = 0; i < list.size(); i++) {
                    if (list.get(i).getbrandID() != brandID) {
                        list3.remove(list.get(i));
                    }
                }
            }
        }
        ArrayList<Product> list4 = new ArrayList<>(list3);
        if (request.getParameter("tab") != null) {
            int tab = Integer.valueOf(request.getParameter("tab"));
            request.setAttribute("tab", tab);
        }
        ArrayList<Product> list5 = new ArrayList<>(list4);
        if(request.getParameter("type") != null ){
            int type = Integer.valueOf(request.getParameter("type"));
            if(type != -1){
                paramType = request.getParameter("type");
                for(int i = 0; i < list.size(); i++){
                    if(list.get(i).getcId() != type){
                        list5.remove(list.get(i));
                    }
                }
            }
        }
        request.setAttribute("paramPrice", paramPrice);
        request.setAttribute("paramBId", paramBId);
        request.setAttribute("paramType", paramType);
       
        request.setAttribute("listProduct", list5);
        request.getRequestDispatcher("./view/customer/shop.jsp").forward(request, response);
            
       
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
