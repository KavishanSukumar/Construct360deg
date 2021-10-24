package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AddToCartDAO;
import com.example.construct360deg.model.Cart;
import com.example.construct360deg.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/addtocart")
@MultipartConfig
public class AddtoCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart=new Cart();
        AddToCartDAO addToCartDAO=new AddToCartDAO();
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        int productid=Integer.parseInt(req.getParameter("productid"));
        cart.setProductid(productid);
        cart.setUserid(userid);
        try {
            addToCartDAO.insertToCart(cart);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        AddToCartDAO addToCartDAO=new AddToCartDAO();
        ArrayList<Cart> products=new ArrayList<>();

        try {
            products=addToCartDAO.getAllItemsInCart(userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("cartproducts",products);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/addtocart.jsp");
        requestDispatcher.forward(req,resp);
    }
}
