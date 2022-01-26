package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.dao.ProposalsDAO;
import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.Advertise;
import com.example.construct360deg.model.Proposal;
import com.example.construct360deg.model.Requirement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

@WebServlet("/DisplayCusReqOnProf")
@MultipartConfig
public class DisplayCusReqOnProfServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session=req.getSession();
        int profid = (int) session.getAttribute("userid");
        int cusid = Integer.parseInt(req.getParameter("cusid"));
        byte[] cusprofimg = (req.getParameter("cusprofpic")).getBytes();
        String cusname = req.getParameter("cusname");
        System.out.println("-=======================      DisplayCusReqOnProfsevlet    =============================");
        System.out.println(cusid);
        System.out.println(cusprofimg);
        System.out.println("-=======================      DisplayCusReqOnProfsevlet    =============================");
        ArrayList<Requirement> requirements = new ArrayList<>();
        RequirementDAO requirementDAO = new RequirementDAO();
        ArrayList<Proposal> proposals = new ArrayList<>();
        ProposalsDAO proposalsDAO = new ProposalsDAO();
        try {
            requirements=requirementDAO.displayownRequirement(cusid);
            proposals=proposalsDAO.checkAleadySendaProposal(profid);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("proposals",proposals);
        req.setAttribute("requirements", requirements);
        req.setAttribute("cusprofimg",cusprofimg);
        req.setAttribute("cusname",cusname);
        req.setAttribute("cusid",cusid);
        req.setAttribute("profid",profid);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/availableCusReq.jsp");
        requestDispatcher.forward(req, resp);
    }
    @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("i am in DisplayCusReqOnProf post method ");
        PrintWriter out = resp.getWriter();
        ProposalsDAO proposalsDAO = new ProposalsDAO();
        Proposal proposal = new Proposal();
        HttpSession session = req.getSession();
        LocalDate nowdate = LocalDate.now();
        LocalTime nowtime = LocalTime.now();

        proposal.setCusid(Integer.parseInt(req.getParameter("cusid")));
        proposal.setRequirementid(Integer.parseInt(req.getParameter("reqid2")));
        proposal.setFilename(req.getParameter("filename"));
        proposal.setProfid(Integer.parseInt(req.getParameter("profid")));
        Part filePart = req.getPart("uploadfile");
        if(filePart!=null){
            proposal.setProposalfile(filePart.getInputStream());
        }
        proposal.setProposal_upload_date(Date.valueOf(nowdate));
        proposal.setProposal_upload_time(Time.valueOf(nowtime));
        proposal.setDescription(req.getParameter("description"));
        System.out.println("i am in DisplayCusReqOnProf post method 2");

        try {
            if(proposalsDAO.uploadProposalToCustomer(proposal)){
                System.out.println("proposal adding is successful");
                out.println("<script type='text/javascript'>");
                out.println("alert('You successfully upload your Proposal');");
                out.println("location='"+req.getContextPath()+"/customer';");
                out.println("</script>");
            }else {
                System.out.println("proposal adding is unsuccessful");
                out.println("<script type='text/javascript'>");
                out.println("alert('Insert unsuccessful');");
                out.println("location='"+req.getContextPath()+"/customer';");
                out.println("</script>");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        System.out.println("i am in DisplayCusReqOnProf post method 2");
   }


}
