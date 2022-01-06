package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.CloseProjectDAO;
import com.example.construct360deg.dao.NewProjectDAO;
import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.Closeproject;
import com.example.construct360deg.model.Newproject;
import com.example.construct360deg.model.Requirement;

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

@WebServlet("/viewproject")
public class ViewProjectsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid = (int) session.getAttribute("userid");
        String userrole= (String) session.getAttribute("userrole");
        if (userrole.equals("cus_indiv")){
            //Add project
            ArrayList<Newproject> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            //displayownrequirments///////////////////////////////////////////////////////

            ArrayList<Requirement> requirements = new ArrayList<>();
            RequirementDAO   requirementDAO = new RequirementDAO();
            try {
                requirements=requirementDAO.displayownRequirement(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("requirements", requirements);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Customer");
        }else if (userrole.equals("cus_com")){
            //Add project
            ArrayList<Newproject> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            //displayownrequirments///////////////////////////////////////////////////////

            ArrayList<Requirement> requirements = new ArrayList<>();
            RequirementDAO   requirementDAO = new RequirementDAO();
            try {
                requirements=requirementDAO.displayownRequirement(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("requirements", requirements);


            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Customer");
        }else if(userrole.equals("prof_com")){
            //Add project
            ArrayList<Newproject> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prof_indiv")){
            //Add project
            ArrayList<Newproject> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }
    }
}
