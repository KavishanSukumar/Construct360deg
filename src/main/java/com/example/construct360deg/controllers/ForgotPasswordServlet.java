package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.UserloginDAO;
import com.example.construct360deg.model.ForgotPassword;
import com.google.gson.Gson;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/forgotpassword")
public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        ForgotPassword forgotPassword=new ForgotPassword();
        resp.setCharacterEncoding("utf-8");
        String task=req.getParameter("task");
        String emailusername=req.getParameter("emailusername");
        UserloginDAO userloginDAO=new UserloginDAO();
        Pattern pattern = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
        Matcher mat = pattern.matcher(emailusername);
        if (mat.matches()){
            try {
                forgotPassword=userloginDAO.forgotPassword(emailusername,"email");
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }else{
            try {
                forgotPassword=userloginDAO.forgotPassword(emailusername,"username");
            } catch (SQLException | MessagingException e) {
                e.printStackTrace();
            }
        }


        if (!forgotPassword.getToken().equals(0)){
            HttpSession session=req.getSession();
            session.setAttribute("token",forgotPassword.getToken());
            session.setAttribute("email",forgotPassword.getEmail());
            boolean mytoken=true;
            String notificationstring= new Gson().toJson(mytoken);
            System.out.println(notificationstring);
            resp.setContentType("application/json");
            out.print(notificationstring);
        }else {
            boolean mytoken=false;
            String notificationstring= new Gson().toJson(mytoken);
            System.out.println(notificationstring);
            resp.setContentType("application/json");
            out.print(notificationstring);
        }

    }
}
