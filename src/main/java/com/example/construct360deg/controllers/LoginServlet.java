package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.UserloginDAO;
import com.example.construct360deg.model.Userlogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginvalidate")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserloginDAO userloginDAO=new  UserloginDAO();

        String username=req.getParameter("username");
        String password=req.getParameter("password");

        Userlogin userlogin=new Userlogin();
        userlogin.setUsername(username);
        userlogin.setPassword(password);

        if(userloginDAO.verify(userlogin)){
            HttpSession session=req.getSession();
            resp.sendRedirect("./html/viewproject.html");
        }else{
            resp.sendRedirect("./html/login.jsp");
        }

    }
}
