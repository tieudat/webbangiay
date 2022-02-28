/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.shoesDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.shoes;

/**
 *
 * @author admin
 */
@WebServlet(name = "Edit_Item", urlPatterns = {"/Edit_Item"})
public class Edit_Item extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditItem</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditItem at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        shoes s = new shoes();
        String  id,ten,gia,loai,thuongHieu,linkImg;
        id= request.getParameter("id");
        ten = request.getParameter("ten");
        gia = request.getParameter("giasp");
        loai =request.getParameter("loai");
        thuongHieu =request.getParameter("thuongHieu");
        linkImg =request.getParameter("linkHA");
        
        s.setIdShoes(Integer.parseInt(id));
        s.setNameShoes(ten);
        s.setGiaTien(Integer.parseInt(gia));
        s.setLoai(loai);
        s.setLinkImg(linkImg);
        s.setThuongHieu(thuongHieu);
        
        shoesDao sh = new shoesDao();
        sh.updateShoes(s);
        HttpSession ses = request.getSession();
        ArrayList<shoes> dssp = new ArrayList<shoes>();
        dssp = sh.getListShoes();
        ses.setAttribute("listShoesAdmin", dssp);     
        response.sendRedirect("show_all_item_admin");
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
