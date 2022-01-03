package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ProductDAO;
import com.example.construct360deg.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/viewproductdetails")
public class ViewproductdetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        Product product = new Product();
        ProductDAO productDAO = new ProductDAO();
//        HttpSession httpSession = req.getSession();

//        int userid = (int) httpSession.getAttribute("userid");
        int productid = Integer.parseInt(req.getParameter("productid"));

        try {
            product = productDAO.viewproductdetails(productid);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        req.setAttribute("product",product);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/viewproductdetails.jsp");
        requestDispatcher.forward(req,resp);

    }
}
