package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AddToCartDAO;
import com.example.construct360deg.dao.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addproducttocart")
public class AddProductToCartServlet extends HttpServlet {
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
}
