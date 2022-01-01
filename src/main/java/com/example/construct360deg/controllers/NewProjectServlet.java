package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.NewProjectDAO;
import com.example.construct360deg.model.Newproject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/newproject")
public class NewProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");
        PrintWriter out = resp.getWriter();
        Newproject newproject = new Newproject();
        NewProjectDAO newProjectDAO = new NewProjectDAO();

        newproject.setNewproject(req.getParameter("newproject"));

        try {
            if (newProjectDAO.addProject(newproject)){
                System.out.println("project added successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('project added successfull');");
            }else {
                System.out.println("project added unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('project added unsuccessfull');");
            }
            out.println("location='" + req.getContextPath()+"/viewproject';");
            out.println("</script>");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
