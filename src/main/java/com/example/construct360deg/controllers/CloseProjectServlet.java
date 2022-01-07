package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.MyProjectDAO;
import com.example.construct360deg.model.Project;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/closeproject")
public class CloseProjectServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp){

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        int userid = (int) session.getAttribute("userid");
        Project project = new Project();
//        CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
        MyProjectDAO myProjectDAO = new MyProjectDAO();
        project.setUserid(userid);
        project.setReason(req.getParameter("reason"));
        project.setDisplay(req.getParameter("display"));

        try {
            if (myProjectDAO.insertData(project)){
                System.out.println("Details added successfull");
                out.println("<script type = 'text/javascript'>");
                out.println("alert('Details added succesfull');");
            }else {
                System.out.println("Details added unsuccessfull");
                out.println("<script type = 'text/javascript'>");
                out.println("alert('Details added unsuccesfull');");
            }
            out.println("location='"+req.getContextPath()+"/viewproject';");
            out.println("</script>");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
