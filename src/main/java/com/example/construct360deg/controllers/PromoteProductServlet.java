package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
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
import java.util.ArrayList;

@WebServlet("/promoteproduct")
public class PromoteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");
        int userid= (int) session.getAttribute("userid");
//        int productid = Integer.parseInt(req.getParameter("productid"));
//        System.out.println("this is product id "+productid);
        String searchval = req.getParameter("search");
        ProductDAO productDAO=new ProductDAO();
        ArrayList<Product> products=new ArrayList<>();

        AdvertiseDAO advertiseDAO = new AdvertiseDAO();
            try {
                products=productDAO.getProductDetailsComSerach(userid,searchval);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("products",products);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/advertiseproducts.jsp");
            requestDispatcher.forward(req,resp);
        }

    }

