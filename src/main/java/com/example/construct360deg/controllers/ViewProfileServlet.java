package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ExperienceDAO;
import com.example.construct360deg.dao.PreviousProjectDAO;
import com.example.construct360deg.dao.SkillsDAO;
import com.example.construct360deg.dao.ViewProfileDAO;
import com.example.construct360deg.model.Experience;
import com.example.construct360deg.model.PreviousProject;
import com.example.construct360deg.model.Skills;
import com.example.construct360deg.model.Viewprofile;

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
        if(userrole.equals("admin")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("cus_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("cus_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if(userrole.equals("prof_com")){
            ViewProfileDAO viewprofieDAO = new ViewProfileDAO();
            ArrayList<Viewprofile> addSummary = new ArrayList<>();
            try {
                addSummary = viewprofieDAO.displaySummary(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("summary",addSummary);

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
                experiences = experienceDAO.retriveExperience();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("experiences", experiences);

            //Add Skills
            SkillsDAO skillsDAO = new SkillsDAO();
            ArrayList<Skills> skills = new ArrayList<>();
            try{
                skills = skillsDAO.retriveSkills();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("skills",skills);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("prof_indiv")){
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
                experiences = experienceDAO.retriveExperience();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("experiences", experiences);

            //Add Skills
            SkillsDAO skillsDAO = new SkillsDAO();
            ArrayList<Skills> skills = new ArrayList<>();
            try{
                skills = skillsDAO.retriveSkills();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("skills",skills);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);

        }else if (userrole.equals("prod_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/viewprofile.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Add Experience
//        HttpSession session = req.getSession();
//        int userid = (int) session.getAttribute("userid");
//        Experience experience = new Experience();
//        ExperienceDAO experienceDAO = new ExperienceDAO();
//        PrintWriter out= resp.getWriter();
//
//        experience.setTitle(req.getParameter("title"));
//        experience.setCompanyname(req.getParameter("comname"));
//        experience.setLocation(req.getParameter("location"));
//        experience.setYears(Integer.parseInt(req.getParameter("years")));
//
//        try {
//            if (experienceDAO.addexperience(experience)){
//                System.out.println("Experience added successfull");
//                out.println("<script type='text/javascript'>");
//                out.println("alert('Experience added successfull');");
//                out.println("location='"+req.getContextPath()+"/viewprofile';");
//                out.println("</script>");
//            }else{
//                System.out.println("Experience added unsuccessfull");
//                out.println("<script type='text/javascript'>");
//                out.println("alert('Experience added unsuccessfull');");
//                out.println("location='"+req.getContextPath()+"/viewprofile';");
//                out.println("</script>");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

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


//        Skills skills1 = new Skills();
//        SkillsDAO skillsDAO = new SkillsDAO();
//        skills1.setSkill1(req.getParameter("skill1"));
//        skills1.setSkill2(req.getParameter("skill2"));
//        skills1.setSkill3(req.getParameter("skill3"));
//        skills1.setSkill4(req.getParameter("skill4"));
//        skills1.setSkill5(req.getParameter("skill5"));
//        skills1.setOther(req.getParameter("other"));
//
//        try {
//            if(skillsDAO.addSkills(skills1)){
//                System.out.println("Skills added successfull");
//                out.println("<script type='text/javascript'>");
//                out.println("alert('Skills added successfull');");
//            }else{
//                System.out.println("Skills added unsuccessfull");
//                out.println("<script type='text/javascript'>");
//                out.println("alert('Skills added unsuccessfull');");
//            }
//            out.println("location='"+req.getContextPath()+"/viewprofile';");
//            out.println("</script>");
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

    }

}
