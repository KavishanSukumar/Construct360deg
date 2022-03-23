package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ProposalsDAO;
import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.Proposal;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/sendproposal")
@MultipartConfig
public class SendProposalToPersonalReqServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("i am in sendproposal post method ");
        PrintWriter out = resp.getWriter();
        ProposalsDAO proposalsDAO = new ProposalsDAO();
        Proposal proposal = new Proposal();
        HttpSession session = req.getSession();
        LocalDate nowdate = LocalDate.now();
        LocalTime nowtime = LocalTime.now();

        RequirementDAO requirementDAO = new RequirementDAO();
        int  reqid = Integer.parseInt(req.getParameter("reqid3"));
        int profid = Integer.parseInt(req.getParameter("profid"));
        proposal.setCusid(Integer.parseInt(req.getParameter("cusid")));
        proposal.setRequirementid(Integer.parseInt(req.getParameter("reqid3")));
        proposal.setFilename(req.getParameter("filename"));
        proposal.setProfid(Integer.parseInt(req.getParameter("profid")));
        Part filePart = req.getPart("uploadfile");
        if(filePart!=null){
            proposal.setProposalfile(filePart.getInputStream());
        }
        proposal.setProposal_upload_date(Date.valueOf(nowdate));
        proposal.setProposal_upload_time(Time.valueOf(nowtime));
        proposal.setDescription(req.getParameter("description"));
        System.out.println("i am in sendproposal method 2");

        try {
            if(proposalsDAO.uploadProposalToCustomer(proposal)){
                int tag = 1;
                requirementDAO.profacceptreq(reqid,profid,tag);
                System.out.println("proposal adding is successful");
                out.println("<script type='text/javascript'>");
                out.println("alert('You successfully upload your Proposal');");
                out.println("location='"+req.getContextPath()+"/viewproject';");
                out.println("</script>");
            }else {
                System.out.println("proposal adding is unsuccessful");
                out.println("<script type='text/javascript'>");
                out.println("alert('Insert unsuccessful');");
                out.println("location='"+req.getContextPath()+"/viewproject';");
                out.println("</script>");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        System.out.println("i am in sendproposal post method 3");
    }
}
