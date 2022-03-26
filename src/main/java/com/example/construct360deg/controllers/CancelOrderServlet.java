package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/cancelorder")
public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int orderid= Integer.parseInt(req.getParameter("orderid"));
        OrderDAO orderDAO=new OrderDAO();

        try {
            orderDAO.cancelOrders(orderid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
