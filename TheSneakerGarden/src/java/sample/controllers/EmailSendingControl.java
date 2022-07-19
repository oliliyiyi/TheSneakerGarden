/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import dbmanager.UserManager;
import java.security.SecureRandom;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import utils.EmailUtility;
import utils.Utility;

@WebServlet(name = "EmailSendingControl", urlPatterns = {"/EmailSendingControl"})
public class EmailSendingControl extends HttpServlet {

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";

    private static final String DATA_FOR_RANDOM_STRING = CHAR_LOWER + CHAR_UPPER + NUMBER;
    private static SecureRandom random = new SecureRandom();

    public static String generateRandomString(int length) {
        if (length < 1) {
            throw new IllegalArgumentException();
        }
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {

            // 0-62 (exclusive), random returns 0-61
            int rndCharAt = random.nextInt(DATA_FOR_RANDOM_STRING.length());
            char rndChar = DATA_FOR_RANDOM_STRING.charAt(rndCharAt);

            sb.append(rndChar);
        }
        return sb.toString();
    }
    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        UserManager userManager = new UserManager();
        // reads form fields
        int userId = 0;
        String recipient = request.getParameter("recipient");
        HttpSession session = request.getSession();
        String resultMessage = "";
        String token = generateRandomString(8);
        try {
            userId = userManager.findUserByEmail(recipient);
            userManager.updateResetPasswordToken(token, userId);
            String resetPasswordLink = Utility.getSiteURL(request) + "/changePassword?token=" + token;
            String subject = "Here's the link to reset your password";
            String content = "Hello,\n"
                    + "You have requested to reset your password.\n"
                    + "Click the link below to change your password:\n"
                    + resetPasswordLink + "\n"
                    + "\n"
                    + "Ignore this email if you do remember your password, \n"
                    + "or you have not made the request.";
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
            resultMessage = "Sent change password link to your email! Please check email!";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            session.setAttribute("Message", resultMessage);
            response.sendRedirect(request.getContextPath()+"/profile?id="+userId);
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
