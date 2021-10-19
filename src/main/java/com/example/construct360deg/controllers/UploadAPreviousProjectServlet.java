package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.PreviousProjectDAO;
import com.example.construct360deg.model.PreviousProject;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/uploadapreviousproject")
@MultipartConfig
public class UploadAPreviousProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PreviousProjectDAO previousProjectDAO=new PreviousProjectDAO();
        PreviousProject previousProject=new PreviousProject();
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        String projectid= UUID.randomUUID().toString();

        previousProject.setProjectid(projectid);
        previousProject.setUserid(userid);
//        previousProject.setCustomerfeedback(req.getParameter(""));
        previousProject.setProvince(req.getParameter("province"));
        previousProject.setDistrict(req.getParameter("district"));
        previousProject.setCity(req.getParameter("city"));
        previousProject.setStreet(req.getParameter("street"));
        previousProject .setHouseno(req.getParameter("HouseNumber"));
//        previousProject.setNoofstars(Integer.parseInt(req.getParameter("")));
//        previousProject.setImageid(Integer.parseInt(req.getParameter("")));
        previousProject.setReferancecontactno(req.getParameter("Rnum"));
        previousProject.setReferenceemail(req.getParameter("Remail"));
        previousProject.setReferencename(req.getParameter("Rname"));

        Part filePart = req.getPart("img");
        if(filePart!=null){
            previousProject.setImage(filePart.getInputStream());
        }

        try {
            previousProjectDAO.uploadPreviousProject(previousProject);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
