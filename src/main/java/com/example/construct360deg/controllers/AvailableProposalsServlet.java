package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ProposalsDAO;
import com.example.construct360deg.model.Proposal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
@MultipartConfig
@WebServlet("/availableproposals")
public class AvailableProposalsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int reqid= Integer.parseInt(req.getParameter("reqid"));
        String reqname = req.getParameter("reqname1");
        System.out.println("++++++++++++ AvailableProposalsServlet           +++++++++++");
        System.out.println(reqname);
        System.out.println(reqid);
        System.out.println("+++++++++++++++++++++++");

        ArrayList<Proposal> proposals = new ArrayList<>();
        ProposalsDAO proposalsDAO = new ProposalsDAO();

        try {
            proposals=proposalsDAO.availableproposals(reqid);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("proposals",proposals);
        req.setAttribute("reqname",reqname);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/availableproposals.jsp");
        requestDispatcher.forward(req,resp);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        PrintWriter out = resp.getWriter();

       int val = Integer.parseInt(req.getParameter("choice"));
        int pid = Integer.parseInt(req.getParameter("pid"));
        System.out.println("++++++++++++ choiece +++++++++++");
        System.out.println(val);
        System.out.println(pid);
        System.out.println("+++++++++++++++++++++++");

        ProposalsDAO proposalsDAO = new ProposalsDAO();


        try {
            proposalsDAO.accept_or_reject(val,pid);
            if(val==1){
                System.out.println("You accept the proposal");
                out.println("<script type='text/javascript'>");
                out.println("alert('You accept the proposal');");
                out.println("location='"+req.getContextPath()+"/viewproject';");
                out.println("</script>");
            }else {
                System.out.println("You reject the proposal");
                out.println("<script type='text/javascript'>");
                out.println("alert('You reject the proposal');");
                out.println("location='"+req.getContextPath()+"/viewproject';");
                out.println("</script>");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println("Error");
            out.println("<script type='text/javascript'>");
            out.println("alert('Error');");
            out.println("location='"+req.getContextPath()+"/viewproject';");
            out.println("</script>");
        }



    }
}
