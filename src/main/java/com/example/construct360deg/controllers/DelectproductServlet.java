package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ProductDAO;
import com.example.construct360deg.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/deleteproduct")
@MultipartConfig
public class DelectproductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        PrintWriter out=resp.getWriter();
        Product product=new Product();
        ProductDAO productDAO=new ProductDAO();
        int productid = Integer.parseInt(req.getParameter("productid"));

        product.setProductid(productid);

        try {
            if(productDAO.deleteProduct(productid)){
                System.out.println("Product deleting is successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Delete successful');");
                out.println("location='"+req.getContextPath()+"/searchproduct';");
                out.println("</script>");
            }else {
                System.out.println("Unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Delete Unsuccessful');");
                out.println("location='"+req.getContextPath()+"/searchproduct';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }



    }
}
