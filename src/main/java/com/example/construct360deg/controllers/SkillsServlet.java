package com.example.construct360deg.controllers;


import com.example.construct360deg.dao.SkillsDAO;
import com.example.construct360deg.model.Skills;

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

@WebServlet("/skills")
public class SkillsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");
        PrintWriter out = resp.getWriter();
        Skills skills1 = new Skills();
        SkillsDAO skillsDAO = new SkillsDAO();
        skills1.setSkill1(req.getParameter("skill1"));
        skills1.setSkill2(req.getParameter("skill2"));
        skills1.setSkill3(req.getParameter("skill3"));
        skills1.setSkill4(req.getParameter("skill4"));
        skills1.setSkill5(req.getParameter("skill5"));
        skills1.setOther(req.getParameter("other"));

        try {
            if(skillsDAO.addSkills(skills1)){
                System.out.println("Skills added successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Skills added successfull');");
            }else{
                System.out.println("Skills added unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Skills added unsuccessfull');");
            }
            out.println("location='"+req.getContextPath()+"/viewprofile';");
            out.println("</script>");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
