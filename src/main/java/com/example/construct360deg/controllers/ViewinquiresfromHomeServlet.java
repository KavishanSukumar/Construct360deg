package com.example.construct360deg.controllers;


import com.example.construct360deg.dao.HomeFormDAO;
import com.example.construct360deg.model.HomeForm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/viewhomeinquires")
public class ViewinquiresfromHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        ArrayList<HomeForm> homeForms = new ArrayList<>();
        HomeFormDAO homeFormDAO = new HomeFormDAO();

        try {
            homeForms=homeFormDAO.retriveHomeForm();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("homeForm",homeForms);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/admin/html/viewinquiresfromHome.jsp");
        requestDispatcher.forward(req,resp);
    }
}
