package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.OrderDAO;
import com.example.construct360deg.model.Product;
import com.google.gson.Gson;

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

@WebServlet("/vieworders")
public class ViewOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDAO orderDAO=new OrderDAO();
        ArrayList<Integer> productOrders=new ArrayList<>();
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");

        System.out.println(userid);

        try {
            productOrders=orderDAO.getOrderIDs(userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("orderids",productOrders);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/vieworder.jsp");
        requestDispatcher.forward(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDAO orderDAO=new OrderDAO();
        ArrayList<Product> orderlist=new ArrayList<>();
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        try {
            orderlist=orderDAO.getOrderDetails(Integer.parseInt(req.getParameter("orderid")),userid);
        } catch (SQLException e){
            e.printStackTrace();
        }
        String orderlistString = new Gson().toJson(orderlist);
        PrintWriter out= resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.print(orderlistString);
    }
}
