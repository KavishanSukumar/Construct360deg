package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.*;
import com.example.construct360deg.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet("/viewprofile")
public class ViewProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");
        Account account = new Account();
        if(userrole.equals("admin")){
            //Account details
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("cus_indiv")){
            //Account details
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("cus_com")){
            //Account details
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if(userrole.equals("prof_com")){
            //Account details
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);

            //add summary
            ViewProfileDAO viewprofieDAO = new ViewProfileDAO();
            ArrayList<Viewprofile> addSummary = new ArrayList<>();
            try {
                addSummary = viewprofieDAO.displaySummary(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("summary",addSummary);

            //Add previous projects
            PreviousProjectDAO previousProjectDAO=new PreviousProjectDAO();
            ArrayList<PreviousProject> previousProjects=new ArrayList<>();
            try {
                previousProjects=previousProjectDAO.getAllPreviousProjects(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("previousProjects",previousProjects);

            //Add experience
            ExperienceDAO experienceDAO = new ExperienceDAO();
            ArrayList<Experience> experiences = new ArrayList<>();
            try {
                experiences = experienceDAO.retriveExperience(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("experiences", experiences);

            //Add Skills
            SkillsDAO skillsDAO = new SkillsDAO();
            ArrayList<Skills> skills = new ArrayList<>();
            try{
                skills = skillsDAO.retriveSkills(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("skills",skills);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("prof_indiv")){
            //Account details
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid, userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            System.out.println(account.getFirstname());

            //Add summary
            ViewProfileDAO viewprofieDAO = new ViewProfileDAO();
            ArrayList<Viewprofile> addSummary = new ArrayList<>();
            try {
                addSummary = viewprofieDAO.displaySummary(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("summary",addSummary);

            //view previous projects
            PreviousProjectDAO previousProjectDAO=new PreviousProjectDAO();
            ArrayList<PreviousProject> previousProjects=new ArrayList<>();
            try {
                previousProjects=previousProjectDAO.getAllPreviousProjects(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("previousProjects",previousProjects);

            //Add experience
            ExperienceDAO experienceDAO = new ExperienceDAO();
            ArrayList<Experience> experiences = new ArrayList<>();
            try {
                experiences = experienceDAO.retriveExperience(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("experiences", experiences);

            //Add Skills
            SkillsDAO skillsDAO = new SkillsDAO();
            ArrayList<Skills> skills = new ArrayList<>();
            try{
                skills = skillsDAO.retriveSkills(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("skills",skills);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("prod_com")){
            //Account details
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Mixed
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");

        String task = req.getParameter("task");
        String summaryText = req.getParameter("summaryText");
        System.out.println(task);
        ViewProfileDAO viewProfileDAO = new ViewProfileDAO();

        try {
            ViewProfileDAO.SaveSummary(task, summaryText, userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Experience experience = new Experience();
        ExperienceDAO experienceDAO = new ExperienceDAO();
        experience.setUserid(userid);
        PrintWriter out= resp.getWriter();
        experience.setTitle(req.getParameter("title"));
        experience.setCompanyname(req.getParameter("comname"));
        experience.setLocation(req.getParameter("location"));
        experience.setYears(Integer.parseInt(req.getParameter("years")));

        try {
            if (experienceDAO.addexperience(experience)){
                System.out.println("Experience added successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Experience added successfull');");
                out.println("location='"+req.getContextPath()+"/viewprofile';");
                out.println("</script>");
            }else{
                System.out.println("Experience added unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Experience added unsuccessfull');");
                out.println("location='"+req.getContextPath()+"/viewprofile';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
