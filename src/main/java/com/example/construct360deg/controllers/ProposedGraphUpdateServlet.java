package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.NewProjectDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateproposedgraph")
public class ProposedGraphUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int proposalid= Integer.parseInt(req.getParameter("proposalid"));
        String fieldname=req.getParameter("fieldname");
        int fieldval= Integer.parseInt(req.getParameter("fieldval"));
        NewProjectDAO newProjectDAO=new NewProjectDAO();

        try {
            newProjectDAO.addField(proposalid,fieldname,fieldval);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
