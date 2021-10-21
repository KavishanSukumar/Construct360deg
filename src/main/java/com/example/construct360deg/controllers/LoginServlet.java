package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.UserloginDAO;
import com.example.construct360deg.model.Userlogin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/loginvalidate")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserloginDAO userloginDAO=new  UserloginDAO();
        int userid;
        String username=req.getParameter("username");
        String password=req.getParameter("password");

        Userlogin userlogin=new Userlogin();
        userlogin.setUsername(username);
        userlogin.setPassword(password);

        try {
            userid=userloginDAO.verify(userlogin);
            if(userid>0){
                HttpSession session=req.getSession();
                session.setAttribute("uname",username);
                session.setAttribute("userid",userid);
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/landingpage.jsp");
                requestDispatcher.forward(req,resp);
            }else if(userid==-1){
//                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/error");
//                requestDispatcher.forward(req,resp);
                resp.sendRedirect(req.getContextPath()+"/error");
            }else{
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/login.jsp");
                requestDispatcher.forward(req,resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
