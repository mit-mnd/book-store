/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BookDAO;
import modal.Book;
import modal.Cart;
import modal.Category;
import modal.ItemCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author OS
 */
public class AddToCartControl extends HttpServlet {

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

        if (session.getAttribute("acc") != null) {
            Cart cart = null;
            Object o = session.getAttribute("cart");
            BookDAO dao = new BookDAO();
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }

            String pid = request.getParameter("pid");
            try {
                Book b = dao.getBookByID(pid);
                double price = b.getPrice();
                ItemCart t = new ItemCart(b, 1, price);
                cart.addItem(t);
            } catch (Exception e) {

            }

            List<Book> list = dao.getAllBook();
            List<Category> listC = dao.getAllCategory();
            Book last = dao.getLast();

            //b2: set data to jsp
            request.setAttribute("listP", list);
            request.setAttribute("listCC", listC);
            request.setAttribute("p", last);

            List<ItemCart> listT = cart.getItems();
            session.setAttribute("cart", cart);
            session.setAttribute("size", listT.size());
            request.getRequestDispatcher("Home.jsp").forward(request, response);
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
