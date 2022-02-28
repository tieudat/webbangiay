/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.shoesDao;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.shoes;

/**
 *
 * @author admin
 */
@WebServlet(name = "Add_Item", urlPatterns = {"/Add_Item"})
public class Add_Item extends HttpServlet {

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
            out.println("<title>Servlet AddItem</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddItem at " + request.getContextPath() + "</h1>");
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
        String tenSP,theloai,linkHA,thuongHieu,giasp;
     
        tenSP = request.getParameter("tensp");
        theloai = request.getParameter("loaisp");
        linkHA= request.getParameter("linkImg");
        giasp = request.getParameter("gia");
        thuongHieu=request.getParameter("brand");
        
        
        int gia ;
        gia=Integer.parseInt(giasp);
        shoes sp = new shoes();
        sp.setNameShoes(tenSP);
        sp.setGiaTien(gia);
        sp.setLoai(theloai);
        sp.setLinkImg(linkHA);
        sp.setThuongHieu(thuongHieu);
        shoesDao spd = new shoesDao();
        spd.addShoes(sp);

        
        HttpSession ses = request.getSession();
        ArrayList<shoes> dssp = new ArrayList<shoes>();
        dssp = spd.getListShoes();
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String tenSP,theloai,linkHA,thuongHieu,giasp;
     
        tenSP = request.getParameter("tensp");
        theloai = request.getParameter("loaisp");
        linkHA= request.getParameter("linkImg");
        giasp = request.getParameter("gia");
        thuongHieu=request.getParameter("brand");
        
        
        int gia ;
        gia=Integer.parseInt(giasp);
        shoes sp = new shoes();
        sp.setNameShoes(tenSP);
        sp.setGiaTien(gia);
        sp.setLoai(theloai);
        sp.setLinkImg(linkHA);
        sp.setThuongHieu(thuongHieu);
        shoesDao spd = new shoesDao();
        spd.addShoes(sp);

        
        HttpSession ses = request.getSession();
        ArrayList<shoes> dssp = new ArrayList<shoes>();
        dssp = spd.getListShoes();
        ses.setAttribute("listShoesAdmin", dssp);     
        RequestDispatcher dis = request.getRequestDispatcher("/View/Admin_all_item.jsp");
        dis.forward(request, response);
     
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
