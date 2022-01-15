package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.*;
import com.example.construct360deg.model.AllUsers;
import com.example.construct360deg.model.Project;
import com.example.construct360deg.model.Proposal;
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
//        int projectid = (int) session.getAttribute("projectid");
        String userrole= (String) session.getAttribute("userrole");
        if (userrole.equals("cus_indiv")){
            //Add project
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);


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
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);


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
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);

        ///////------senal's part------------///////////////////////// ////////////////////////////////////////////////////////////////
            ArrayList<AllUsers> allcustomers = new ArrayList<>();
            AllProfileDAO allProfileDAO = new AllProfileDAO();
            ArrayList<Requirement> displayRequirement = new ArrayList<>();
            RequirementDAO requirementDAO = new RequirementDAO();
            ArrayList<Proposal>   displayownproposals = new ArrayList<>();
            ProposalsDAO proposalsDAO = new ProposalsDAO();

            try {
                allcustomers=allProfileDAO.allcustomers();
                displayRequirement = requirementDAO.displayRequirement();
                displayownproposals = proposalsDAO.displayownproposals(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("allcustomers",allcustomers);
            req.setAttribute("displayRequirement",displayRequirement);
            req.setAttribute("displayownproposals",displayownproposals);
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prof_indiv")){
            //Add project
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);
            ///////------senal's part------------///////////////////////// ////////////////////////////////////////////////////////////////
            ArrayList<AllUsers> allcustomers = new ArrayList<>();
            AllProfileDAO allProfileDAO = new AllProfileDAO();
            ArrayList<Requirement> displayRequirement = new ArrayList<>();
            RequirementDAO requirementDAO = new RequirementDAO();
            ArrayList<Proposal>   displayownproposals = new ArrayList<>();
            ProposalsDAO proposalsDAO = new ProposalsDAO();

            try {
                allcustomers=allProfileDAO.allcustomers();
                displayRequirement = requirementDAO.displayRequirement();
                displayownproposals = proposalsDAO.displayownproposals(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("allcustomers",allcustomers);
            req.setAttribute("displayRequirement",displayRequirement);
            req.setAttribute("displayownproposals",displayownproposals);
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }
    }
}
