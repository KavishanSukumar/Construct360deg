package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ExperienceDAO;
import com.example.construct360deg.dao.PreviousProjectDAO;
import com.example.construct360deg.dao.ViewProfileDAO;
import com.example.construct360deg.model.Experience;
import com.example.construct360deg.model.PreviousProject;
import com.example.construct360deg.model.Viewprofile;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
//        HttpSession session=req.getSession();
//        String task = req.getParameter("task");
//        String summaryText = req.getParameter("summaryText");
//        System.out.println(task);
//        int userid = (int) session.getAttribute("userid");
//        ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
//
//        try {
//            ViewProfileDAO.SaveSummary(task, summaryText, userid);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        System.out.println("test you*************");
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/viewprofile.jsp");
//        requestDispatcher.forward(req, resp);


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

    }


}
