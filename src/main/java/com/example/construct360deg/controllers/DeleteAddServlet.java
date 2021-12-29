package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.model.Advertise;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet("/deleteadds")
public class DeleteAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException {
        System.out.println("this is get");
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  ServletException, IOException{
        System.out.println("hello");
        int addid = Integer.parseInt(req.getParameter("addid"));
        System.out.println(addid);
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();
        System.out.println(addid);
        try {
            advertiseDAO.deleteadvertise(addid);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
