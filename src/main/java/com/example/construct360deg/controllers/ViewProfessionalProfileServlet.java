package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.*;
import com.example.construct360deg.model.*;

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

@WebServlet("/viewprofprofile")
public class ViewProfessionalProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");
        int profid=Integer.parseInt(req.getParameter("profid"));
        req.setAttribute("profid",profid);
        Account account = new Account();

//        if(userrole.equals("prof_indiv")||userrole.equals("prof_com")){
//
//        }
        if(userrole.equals("cus_indiv")||userrole.equals("cus_com")){
//            AllProfileDAO allProfileDAO=new AllProfileDAO();
//            ArrayList<AllUsers> allprofs=new ArrayList<>();
//
//            try {
//                allprofs=allProfileDAO.getAllProfessionals();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }

//            req.setAttribute("allprofs",allprofs);
            //Profile pic change
            ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
            try {
                account = viewProfileDAO.viewImage(profid,userrole="prof_indiv");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("changepic",account);
            //Account details
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(profid,userrole="prof_indiv");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts", account);
            System.out.println(account.getFirstname());
            //Add summary
            ViewProfileDAO viewprofieDAO = new ViewProfileDAO();
            ArrayList<Viewprofile> addSummary = new ArrayList<>();
            try {
                addSummary = viewprofieDAO.displaySummary(profid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("summary", addSummary);

            //view previous projects
            PreviousProjectDAO previousProjectDAO = new PreviousProjectDAO();
            ArrayList<PreviousProject> previousProjects = new ArrayList<>();
            try {
                previousProjects = previousProjectDAO.getAllPreviousProjects(profid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("previousProjects", previousProjects);

            //Add experience
            ExperienceDAO experienceDAO = new ExperienceDAO();
            ArrayList<Experience> experiences = new ArrayList<>();
            try {
                experiences = experienceDAO.retriveExperience(profid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("experiences", experiences);

            //Add Skills
            SkillsDAO skillsDAO = new SkillsDAO();
            ArrayList<Skills> skills = new ArrayList<>();
            try {
                skills = skillsDAO.retriveSkills(profid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("skills", skills);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/viewprofprofile.jsp");
            requestDispatcher.forward(req, resp);

        }
    }

}
