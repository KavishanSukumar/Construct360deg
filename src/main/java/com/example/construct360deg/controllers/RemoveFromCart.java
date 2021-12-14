package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AddToCartDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/removefromcart")
public class RemoveFromCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        AddToCartDAO addToCartDAO=new AddToCartDAO();
        PrintWriter out= resp.getWriter();
        int userid= (int) session.getAttribute("userid");
        int productid=Integer.parseInt(req.getParameter("productid"));
        try {
            addToCartDAO.removeformcart(userid,productid);
            System.out.println("Product removed from cart is successfull");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
