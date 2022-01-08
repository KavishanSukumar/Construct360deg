package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.database.Database;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/sendrequirement-public")
public class SendRequirementToPublicServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");
        int reqid = Integer.parseInt(req.getParameter("reqid"));
        int dis_on_prof = Integer.parseInt(req.getParameter("dis_on_prof"));
        System.out.println("-------------------=================");
        System.out.println(reqid);
        System.out.println(dis_on_prof);
        System.out.println("-------------------==================");
        RequirementDAO requirementDAO=new RequirementDAO();
        if (dis_on_prof==0){
            dis_on_prof=1;

            try {
                requirementDAO.display_req_in_prof(reqid,dis_on_prof);
                out.println("<script type='text/javascript'>");
                out.println("alert('Your Requirement will visible to public');");
                out.println("location='"+req.getContextPath()+"/viewproject';");
                out.println("</script>");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                out.println("<script type='text/javascript'>");
                out.println("alert('Error');");
                out.println("location='"+req.getContextPath()+"/viewproject';");
                out.println("</script>");
            }

        }else{
            System.out.println("error in sendRequirementtopublicservlet ");
        }




    }

}
