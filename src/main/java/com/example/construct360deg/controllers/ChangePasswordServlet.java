package com.example.construct360deg.controllers;

import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/changepassword")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        resp.setCharacterEncoding("utf-8");
        HttpSession session=req.getSession();

        Integer number= (Integer) session.getAttribute("token");
        Integer checkingnum= Integer.parseInt(req.getParameter("otp"));
        if(checkingnum.equals(number)){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/forgotpassword.jsp");
            requestDispatcher.forward(req,resp);
        }else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Mismatch OTP code');");
            out.println("location='"+req.getContextPath()+"/login';");
            out.println("</script>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
