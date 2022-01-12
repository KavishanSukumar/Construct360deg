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

}
