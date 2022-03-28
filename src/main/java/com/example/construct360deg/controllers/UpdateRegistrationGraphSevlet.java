package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.NewProjectDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateregistrationgraph")
public class UpdateRegistrationGraphSevlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NewProjectDAO newProjectDAO=new NewProjectDAO();
        int proposalid= Integer.parseInt(req.getParameter("proposalid"));
        String fieldname=req.getParameter("fieldname");
        int fieldvalue= Integer.parseInt(req.getParameter("fieldval"));

        try {
            newProjectDAO.addField(proposalid,fieldname,fieldvalue);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
