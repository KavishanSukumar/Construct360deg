package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.NotificationDAO;
import com.example.construct360deg.model.Notification;
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

@WebServlet("/notification")
public class NotificationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");

        if(userrole.equals("cus_com")||userrole.equals("cus_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("./html/customer/html/notification.jsp");
            requestDispatcher.forward(req,resp);
        }else if (userrole.equals("prof_com")||userrole.equals("prof_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("./html/professionals/html/notification.jsp");
            requestDispatcher.forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid=(int)session.getAttribute("userid");
        ArrayList<Notification> notifications=new ArrayList<>();
        NotificationDAO notificationDAO=new NotificationDAO();
        PrintWriter out=resp.getWriter();

        try {
            notifications=notificationDAO.getNotifications(userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String notificationstring= new Gson().toJson(notifications);
        resp.setContentType("application/json");
        out.print(notificationstring);
    }
}
