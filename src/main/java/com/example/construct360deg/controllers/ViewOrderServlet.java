package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.OrderDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/vieworders")
public class ViewOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDAO orderDAO=new OrderDAO();
        ArrayList<Integer> productOrders=new ArrayList<>();
        try {
            productOrders=orderDAO.getOrderIDs();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("orderids",productOrders);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/vieworder.jsp");
        requestDispatcher.forward(req,resp);
    }
}
