package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.Requirement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

@WebServlet("/uploadtherequirement")
@MultipartConfig
public class UploadTheRequirementServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Requirement requirement=new Requirement();
        RequirementDAO requirementDAO=new RequirementDAO();
        HttpSession session=req.getSession();
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
    }
}