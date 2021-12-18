package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ComplainDAO;
import com.example.construct360deg.model.Complain;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/inquires")
public class ManageReportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Complain> complains=new ArrayList<>();
        ComplainDAO complainDAO=new ComplainDAO();

        try {
            complains=complainDAO.retriveComplaints();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("complains",complains);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/manageinquires.jsp");
        requestDispatcher.forward(req,resp);
    }

}
