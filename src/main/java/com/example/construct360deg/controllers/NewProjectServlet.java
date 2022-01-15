package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.NewProjectDAO;
import com.example.construct360deg.dao.ProposalsDAO;
import com.example.construct360deg.model.Project;

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
        int proposalid =Integer.parseInt(req.getParameter("proposalid"));
        int reqid = Integer.parseInt(req.getParameter("reqid"));
        System.out.println("---------- newproject servlet -----------");
        System.out.println(proposalid);
        System.out.println(reqid);
//        int projectid = (int) session.getAttribute("projectid");
        PrintWriter out = resp.getWriter();
//        Newproject newproject = new Newproject();
        Project project = new Project();
        project.setUserid(userid);
//        project.setProjectid(projectid);
        NewProjectDAO newProjectDAO = new NewProjectDAO();
        project.setProjectname(req.getParameter("projectname"));
        ProposalsDAO proposalsDAO = new ProposalsDAO();
        try {
            if (newProjectDAO.addProject(project,reqid,proposalid )){
                proposalsDAO.createproject(proposalid);
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
