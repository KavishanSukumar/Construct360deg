package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RegistrationDAO;
import com.example.construct360deg.dao.UserloginDAO;
import com.example.construct360deg.model.UserRegistration;
import com.example.construct360deg.model.Userlogin;
import org.apache.commons.codec.digest.DigestUtils;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDAO registrationDAO=new RegistrationDAO();
        UserRegistration userRegistration=new UserRegistration();
        String email=req.getParameter("email");
        String username=req.getParameter("username");
        String password1=req.getParameter("password");
        String contactno=req.getParameter("contactno");
        String role=req.getParameter("professional");

        String password= DigestUtils.sha256Hex(password1);

        userRegistration.setEmail(email);
        userRegistration.setUsername(username);
        userRegistration.setPassword(password);
        userRegistration.setContactno(contactno);
        userRegistration.setProfessionalrole(role);
        try {
            if (registrationDAO.userRegistration(userRegistration)){
                Userlogin userlogin=new Userlogin();
                userlogin.setUsername(username);
                userlogin.setPassword(password1);

                UserloginDAO userloginDAO=new  UserloginDAO();
                userlogin=userloginDAO.verify(userlogin);

                if(userlogin.getUserrole()!=null){
                    HttpSession session=req.getSession();
                    session.setAttribute("uname",username);
                    session.setAttribute("userid",userlogin.getUserid());
                    session.setAttribute("userrole",userlogin.getUserrole());
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/editprofile");
                    requestDispatcher.forward(req,resp);
                    System.out.println("Successful");
                }else {
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/login.jsp");
                    requestDispatcher.forward(req,resp);
                }

            }else{
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/registration.jsp");
                requestDispatcher.forward(req,resp);
                System.out.println("Error");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/registration.jsp");
        requestDispatcher.forward(req,resp);
    }
}
