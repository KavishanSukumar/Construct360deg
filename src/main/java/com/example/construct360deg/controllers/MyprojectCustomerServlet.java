package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.MyProjectDAO;
import com.example.construct360deg.model.Project;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/myprojectcustomer")
public class MyprojectCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userrole = (String) session.getAttribute("userrole");
        if (userrole.equals("cus_indiv")) {
            //Add Details in project
            MyProjectDAO myProjectDAO = new MyProjectDAO();
            ArrayList<Project> projects = new ArrayList<>();
            try {
                projects = myProjectDAO.retriveDetails();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("projects",projects);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/myprojectcustomer.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Customer");

        } else if (userrole.equals("cus_com")) {
            //Add Details in project
            MyProjectDAO myProjectDAO = new MyProjectDAO();
            ArrayList<Project> projects = new ArrayList<>();
            try {
                projects = myProjectDAO.retriveDetails();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("projects",projects);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/myprojectcustomer.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Customer");
        }
    }
}
