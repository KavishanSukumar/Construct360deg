package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.PaySubDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/paymentstatusupdate")
public class SubscriptionPaymentstatusSevlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userid= Integer.parseInt(req.getParameter("userid"));
        int status= Integer.parseInt(req.getParameter("status"));
        PaySubDAO paySubDAO=new PaySubDAO();
        try {
            paySubDAO.updatepaymentstatus(userid,status);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/paysubscription");
        requestDispatcher.forward(req,resp);
    }

}
