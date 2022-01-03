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
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/searchorders")
public class SearchOrdersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        String formdate=req.getParameter("activityfrom");
        String todate=req.getParameter("activityTo");
        String search=req.getParameter("search");
        OrderDAO orderDAO=new OrderDAO();
        ArrayList<Order> orders=new ArrayList<>();

        try {
            orders=orderDAO.searchorders(userid,formdate,todate,search);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("orders",orders);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/vieworders.jsp");
        requestDispatcher.forward(req,resp);

    }
}
