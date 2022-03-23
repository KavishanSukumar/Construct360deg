package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.Requirement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/rejectreq")
public class RejectReqServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("hello");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        RequirementDAO requirementDAO = new RequirementDAO();
        Requirement requirement=new Requirement();
        String userrole= (String) session.getAttribute("userrole");
        int profid = Integer.parseInt(req.getParameter("profid"));
        //int userid = Integer.parseInt(req.getParameter("userid"));
        int reqid = Integer.parseInt(req.getParameter("reqid"));
        int reject = Integer.parseInt(req.getParameter("reject"));
        System.out.println(" i am in sendreqtochooseprof servlet "+"profid-"+profid+" reqid-"+reqid+" reject "+reject);
        try{
            requirementDAO.profrejectreq(reqid,profid,reject);
            out.println("<script type='text/javascript'>");
            out.println("alert('You Reject the  Requirement successfully');");
            out.println("location='"+req.getContextPath()+"/viewproject';");
            out.println("</script>");
        }catch (Exception e){
            e.printStackTrace();
            out.println("<script type='text/javascript'>");
            out.println("alert('Error in Rejection');");
            out.println("location='"+req.getContextPath()+"/viewproject';");
            out.println("</script>");
        }
    }
}
