package com.example.construct360deg.controllers;


import com.example.construct360deg.dao.OrderDAO;
import com.example.construct360deg.model.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/orderproduct")
public class OrderProductServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int productid=Integer.parseInt(req.getParameter("productid"));
        float productprice=Float.parseFloat(req.getParameter("productprice"));
        String productname=req.getParameter("productname");
        float productquantity=Float.parseFloat(req.getParameter("productquantity"));
        req.setAttribute("productid",productid);
        req.setAttribute("productprice",productprice);
        req.setAttribute("productname",productname);
        req.setAttribute("productquantity",productquantity);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/orderproduct.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("checkorderservlet");
        PrintWriter out=resp.getWriter();
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        Order order=new Order();
        OrderDAO orderDAO=new OrderDAO();

        int productid=Integer.parseInt(req.getParameter("productid"));
        float quantity=Float.parseFloat(req.getParameter("quantity"));
        String district=req.getParameter("district");
        String houseno=req.getParameter("houseno");
        String street=req.getParameter("street");
        String city=req.getParameter("city");
        String phone=req.getParameter("phone");
        String email=req.getParameter("email");
        String deliverytype=req.getParameter("dbt");

        order.setProductid(productid);
        order.setUserid(userid);
        order.setQuantity(quantity);
        order.setDistrict(district);
        order.setHouseno(houseno);
        order.setStreet(street);
        order.setCity(city);
        order.setPhone(phone);
        order.setEmail(email);
        order.setDeliverytype(deliverytype);

        try {
            if(orderDAO.lodgeOrders(order)){
                out.println("<script type='text/javascript'>");
                out.println("alert('Order Successfully lorged');");
                out.println("location='"+req.getContextPath()+"/searchproduct';");
                out.println("</script>");
            }else{
                out.println("<script type='text/javascript'>");
                out.println("alert('Insert Unsuccessful');");
                out.println("location='"+req.getContextPath()+"/searchproduct';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
