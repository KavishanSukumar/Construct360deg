package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AllProfileDAO;
import com.example.construct360deg.model.AllUsers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/searchprofile")
public class SearchProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        AllProfileDAO allProfileDAO=new AllProfileDAO();
//        ArrayList<AllUsers> allUsers=new ArrayList<>();
//        try {
//            allUsers=allProfileDAO.getUserdetails();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        req.setAttribute("allviews",allUsers);
//        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/searchallusers.jsp");
//        requestDispatcher.forward(req,resp);
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AllProfileDAO allProfileDAO=new AllProfileDAO();
        ArrayList<AllUsers> allUsers=new ArrayList<>();
        String searchval = req.getParameter("search");
        try {
            allUsers=allProfileDAO.getUserdetails(searchval);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("allviews",allUsers);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/searchallusers.jsp");
        requestDispatcher.forward(req,resp);
    }
}
