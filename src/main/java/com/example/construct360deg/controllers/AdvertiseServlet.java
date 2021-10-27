package com.example.construct360deg.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/advertise")
public class AdvertiseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");

        if(userrole.equals("prof_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prof_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prod_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/advertise.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Product company");
        }
    }
}
