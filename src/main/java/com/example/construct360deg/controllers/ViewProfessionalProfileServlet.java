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
        System.out.println("this is view profile proffesional id "+profid);
        req.setAttribute("profid",profid);
        int count = 0;
        int tag = 0;
        int reqid = -1;
        try{
            tag = Integer.parseInt(req.getParameter("tag"));
            reqid = Integer.parseInt(req.getParameter("reqid"));
            req.setAttribute("reqid",reqid);
            req.setAttribute("tag",tag);
            req.setAttribute("userid",userid);
        }catch (Exception e){
            count++;
        }

        System.out.println("req id-"+reqid+" tag-"+tag);
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
            ArrayList<TimeSlots> timeSlots = new ArrayList<>();
            TimeSlotsDAO timeSlotsDAO = new TimeSlotsDAO();
            try {
                timeSlots=timeSlotsDAO.getSlotsForProfessional(profid);
                System.out.println("----------------------- view prof profile servlet try block");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("timeSlots",timeSlots);

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
