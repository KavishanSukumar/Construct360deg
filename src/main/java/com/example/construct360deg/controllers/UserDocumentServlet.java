package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AllUserdocsDAO;
import com.example.construct360deg.model.AllUserdocs;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/userdocument")
public class UserDocumentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AllUserdocsDAO allUserdocsDAO=new AllUserdocsDAO();
        ArrayList<AllUserdocs> allUserdocs=new ArrayList<>();

        try {
            allUserdocs=allUserdocsDAO.getAlldocs();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.setAttribute("alldocuments",allUserdocs);

        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/userdocument.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int task= Integer.parseInt(req.getParameter("task"));
        int docid= Integer.parseInt(req.getParameter("docid"));
        AllUserdocsDAO allUserdocsDAO=new AllUserdocsDAO();

        try {
            allUserdocsDAO.verifydocument(task,docid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
