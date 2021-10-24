package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ProductDAO;
import com.example.construct360deg.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addproduct")
@MultipartConfig
public class AddproductSevlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session= req.getSession();
        Product product=new Product();
        ProductDAO productDAO=new ProductDAO();
        String uname=session.getAttribute("uname").toString();

        Part filePart = req.getPart("image");
        if(filePart!=null){
            product.setProductimage(filePart.getInputStream());
        }

        product.setProductName(req.getParameter("name"));
        product.setQuantity(Integer.parseInt(req.getParameter("stock")));
        product.setPrice(Float.parseFloat(req.getParameter("price")));
        product.setProductdes(req.getParameter("desc"));

        try {
            if(productDAO.addProduct(product,uname)){
                System.out.println("Product adding is successfull");
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("html/addproduct.jsp");
                requestDispatcher.forward(req,resp);
            }else {
                System.out.println("Unsuccessfull");
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("html/addproduct.jsp");
                requestDispatcher.forward(req,resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("post");
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get");
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("html/addproduct.jsp");
        requestDispatcher.forward(req,resp);
    }
}
