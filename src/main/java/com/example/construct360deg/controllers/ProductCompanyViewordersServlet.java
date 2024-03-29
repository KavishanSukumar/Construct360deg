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
import java.util.ArrayList;

@WebServlet("/ViewAllOrders")
public class ProductCompanyViewordersServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderid= Integer.parseInt( req.getParameter("orderid"));
        int task= Integer.parseInt( req.getParameter("task"));
        System.out.println(orderid);
        System.out.println(task);
        OrderDAO orderDAO=new OrderDAO();
        PrintWriter out=resp.getWriter();
        String scripttag=null;
        try {
            orderDAO.Orderstatus(orderid,task);
            out.print(scripttag);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("test you");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid=(int)session.getAttribute("userid");
        OrderDAO orderDAO=new OrderDAO();
        ArrayList<Order> orders=new ArrayList<>();
        try {
            orders=orderDAO.getmyorders(userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("orders",orders);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/vieworders.jsp");
        requestDispatcher.forward(req,resp);
    }

}
