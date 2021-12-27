package com.example.construct360deg.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/myproject")
public class ViewMyProjectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");

        if(userrole.equals("cus_indiv")||userrole.equals("cus_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("html/customer/html/myproject.jsp");
            requestDispatcher.forward(req,resp);
        }else if (userrole.equals("prof_com")||userrole.equals("prof_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("html/professionals/html/myproject.jsp");
            requestDispatcher.forward(req,resp);
        }
    }
}
