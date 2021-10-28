package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.Requirement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/uploadrequirement")
@MultipartConfig
public class UploadRequirementServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Requirement requirement=new Requirement();
        RequirementDAO requirementDAO=new RequirementDAO();
        HttpSession session=req.getSession();
        PrintWriter out=resp.getWriter();
        int userid= (int) session.getAttribute("userid");
        requirement.setUseridcus(userid);
        requirement.setDescription(req.getParameter("description"));
        requirement.setType(req.getParameter("type"));
        requirement.setContactnum(req.getParameter("contactnum"));

        Part filePart = req.getPart("reqfile");
        if(filePart!=null){
            requirement.setRequirementstream(filePart.getInputStream());
        }
        requirement.setStreet(req.getParameter("street"));
        requirement.setCity(req.getParameter("city"));
        requirement.setDistrict(req.getParameter("district"));
        requirement.setProvince(req.getParameter("province"));

        System.out.println(requirement);

        try {
            requirementDAO.uploadRequirement(requirement);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Requirement added is successfull");
        out.println("<script type='text/javascript'>");
        out.println("alert('Insert successful');");
        out.println("location='"+req.getContextPath()+"/viewproject';");
        out.println("</script>");
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/uploadrequirement.jsp");
        requestDispatcher.forward(req,resp);
    }
}
