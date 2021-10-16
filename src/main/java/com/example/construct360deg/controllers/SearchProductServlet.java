package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.SearchProductDAO;
import com.example.construct360deg.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/searchproduct")
public class SearchProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SearchProductDAO searchProductDAO=new SearchProductDAO();
        ArrayList<Product> products=new ArrayList<>();
        try {
            products=searchProductDAO.getProductDetails();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("products",products);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/searchproduct.jsp");
        requestDispatcher.forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SearchProductDAO searchProductDAO=new SearchProductDAO();
        ArrayList<Product> products=new ArrayList<>();
        try {
            products=searchProductDAO.getProductDetails();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("products",products);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/searchproduct.jsp");
        requestDispatcher.forward(req,resp);
    }
}
