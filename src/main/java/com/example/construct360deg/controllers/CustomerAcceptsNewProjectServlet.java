package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.NewProjectDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/customeracceptproject")
public class CustomerAcceptsNewProjectServlet extends HttpServlet {


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        PrintWriter out = resp.getWriter();
        int projectid = Integer.parseInt(req.getParameter("projectid"));
        System.out.println(projectid);
        NewProjectDAO newProjectDAO = new NewProjectDAO();

        try {
            if(newProjectDAO.customerAcceptProject(projectid)){
                System.out.println("project is accepted");
                out.println("<script type='text/javascript'>");
                out.println("alert('You agreed to rules and regulations now you can go throughout with the relevant project');");
            }else{
                System.out.println("error in project accepting");
                out.println("<script type='text/javascript'>");
                out.println("alert('Error in project accepting');");
            }
            out.println("location='" + req.getContextPath()+"/viewproject';");
            out.println("</script>");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println("error -- i am in catch block");
            out.println("<script type='text/javascript'>");
            out.println("alert('Error');");
        }



    }

}
