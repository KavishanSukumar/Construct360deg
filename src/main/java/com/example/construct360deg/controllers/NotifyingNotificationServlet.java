package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.NotificationDAO;
import com.google.gson.Gson;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/instantnotification")
public class NotifyingNotificationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        NotificationDAO notificationDAO=new NotificationDAO();
        PrintWriter out=resp.getWriter();
        int count=0;

        try {
            count=notificationDAO.getInstanceNotification(userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(count);
        out.print(count);
    }
}
