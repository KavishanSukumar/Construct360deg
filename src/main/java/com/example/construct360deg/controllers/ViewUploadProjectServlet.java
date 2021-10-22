package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ViewUploadProjectDAO;
import com.example.construct360deg.model.PreviousProject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/viewuploadproject")
public class ViewUploadProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ViewUploadProjectDAO ViewUploadProjectDAO=new ViewUploadProjectDAO();
        ArrayList<PreviousProject> projects=new ArrayList<>();
        try {
            projects=ViewUploadProjectDAO.getProjectDetails();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("projects",projects);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/addproject.jsp");
        requestDispatcher.forward(req,resp);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ViewUploadProjectDAO ViewUploadProjectDAO=new ViewUploadProjectDAO();
        ArrayList<PreviousProject> projects=new ArrayList<>();
        try {
            projects=ViewUploadProjectDAO.getProjectDetails();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("projects",projects);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/addproject.jsp");
        requestDispatcher.forward(req,resp);
    }
}

