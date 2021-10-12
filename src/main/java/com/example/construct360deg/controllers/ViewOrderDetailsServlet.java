package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.OrderDAO;
import com.example.construct360deg.model.ProductOrder;
import com.google.gson.Gson;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/orderdetails")
public class ViewOrderDetailsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderDAO orderDAO=new OrderDAO();

        ArrayList<ProductOrder> orderlist=new ArrayList<>();
        try {
            orderlist=orderDAO.getOrderDetails(Integer.parseInt(req.getParameter("orderid")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String orderlistString = new Gson().toJson(orderlist);
        PrintWriter out= resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.print(orderlistString);
    }
}
