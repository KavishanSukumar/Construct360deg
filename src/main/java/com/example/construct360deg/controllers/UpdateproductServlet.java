package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ProductDAO;
import com.example.construct360deg.model.HomeForm;
import com.example.construct360deg.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/updateproduct")
@MultipartConfig
public class UpdateproductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        PrintWriter out=resp.getWriter();
        HttpSession session= req.getSession();
        Product product=new Product();
        ProductDAO productDAO=new ProductDAO();
        String uname=session.getAttribute("uname").toString();
        int userid=(int)session.getAttribute("userid");
        int productid = Integer.parseInt(req.getParameter("productid"));

        Part filePart = req.getPart("image");
        if(filePart!=null){
            product.setProductimage(filePart.getInputStream());
        }
        product.setProductName(req.getParameter("name"));
        product.setQuantity(Float.parseFloat(req.getParameter("stock")));
        product.setPrice(Float.parseFloat(req.getParameter("price")));
        product.setProductdes(req.getParameter("desc"));
        product.setCompanyid(userid);
        product.setProductid(productid);

        try {
            if(productDAO.Updateproduct(product)){
                System.out.println("Product adding is successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Update successful');");
                out.println("location='"+req.getContextPath()+"/searchproduct';");
                out.println("</script>");
            }else {
                System.out.println("Unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Update Unsuccessful');");
                out.println("location='"+req.getContextPath()+"/searchproduct';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("post");


    }

}
