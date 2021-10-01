package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RegistrationDAO;
import com.example.construct360deg.model.UserRegistration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet("/UserRegistration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDAO registrationDAO=new RegistrationDAO();
        UserRegistration userRegistration=new UserRegistration();
        String email=req.getParameter("email");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String contactno=req.getParameter("contactno");
        String role=req.getParameter("professional");
        try {
            MessageDigest digest=MessageDigest.getInstance("SHA-256");
            password=digest.digest(password.getBytes(StandardCharsets.UTF_8)).toString();
            System.out.println(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        userRegistration.setEmail(email);
        userRegistration.setUsername(username);
        userRegistration.setPassword(password);
        userRegistration.setContactno(contactno);
        userRegistration.setProfessionalrole(role);
        try {
            if (registrationDAO.userRegistration(userRegistration)){
                System.out.println("Successful");
            }else{
                System.out.println("Error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
