/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author admin
 */
@WebServlet(name = "Add_admin", urlPatterns = {"/Add_admin"})
public class Add_admin extends HttpServlet {

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
            out.println("<title>Servlet Add_admin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Add_admin at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession ses =request.getSession();
        String username,fullname,pass1,email,address,phone;
        username = request.getParameter("adUsername");
        fullname = request.getParameter("adFullname");
        email = request.getParameter("adEmail");
        pass1 = request.getParameter("adPassword");
        address = request.getParameter("adAddress");
        phone = request.getParameter("adPhone");
      
        String pass= DigestUtils.md5Hex(pass1);
        user u =new user();
        userDAO ud =new userDAO();
        u.setUsername(username);
        if(ud.checkUsername(username)){   
            u.setFullname(fullname);
            u.setPassword(pass);
            u.setEmail(email);
            u.setPosition("admin");
            u.setAddress(address);
            u.setSdt(phone);
        
            ud.addUser(u);
            response.sendRedirect("show_user_admin");
        }
        else{
            ses.setAttribute("UserTonTai", ud.checkUsername(username));
            RequestDispatcher dis = request.getRequestDispatcher("/View/Admin_add_admin.jsp");
            dis.forward(request, response);
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
