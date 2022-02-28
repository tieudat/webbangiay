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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.user;

/**
 *
 * @author admin
 */
@WebServlet(name = "cookies", urlPatterns = {"/cookies"})
public class cookies extends HttpServlet {

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
            out.println("<title>Servlet cookies</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cookies at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher dis = request.getRequestDispatcher("/View/admin_page.jsp");
        dis.forward(request, response);
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
        String username="";
        String password="";
        Cookie log =null;
        Cookie[] logs =null;
        logs = request.getCookies();
        if(logs!=null)
            {
            for(int i = 0;i< logs.length;i++)
            {
               log = logs[i];
               if(log.getName().equals("username"))
               {
                   username = log.getValue();
               }
               if(log.getName().equals("password"))
               {
                   password = log.getValue();
               }
            }
        }
        if(!username.equals("") && !password.equals(""))
        {
            HttpSession ses = request.getSession();
            user u = new user();
            u.setUsername(username);
            u.setPassword(password);
            userDAO ud = new userDAO();
            
            if(ud.checkLogin(u))
            {
                ses.setAttribute("user", u);
            }
        }

        response.sendRedirect("show_Index");
        
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
