package com.example.construct360deg.controllers;


import com.example.construct360deg.dao.HomeFormDAO;
import com.example.construct360deg.model.HomeForm;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Homeform")
public class HomeFormServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  ServletException, IOException{
        HomeForm homeForm = new HomeForm();
        HttpSession session = req.getSession();
        HomeFormDAO homeFormDAO = new HomeFormDAO();
        PrintWriter out = resp.getWriter();

        homeForm.setFname(req.getParameter("firstname"));
        homeForm.setLname(req.getParameter("lastname"));
        homeForm.setEmail(req.getParameter("email"));
        homeForm.setMessage(req.getParameter("message"));

        try {
            if(homeFormDAO.homeform(homeForm)){
                System.out.println("inquiries is successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Appointment form successful');");
                out.println("location='"+req.getContextPath()+"/Homeform';");
                out.println("</script>");

            }else {
                System.out.println("Appointment form is unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Appointment form is unsuccessfull');");
                out.println("location='"+req.getContextPath()+"/Homeform';");
                out.println("</script>");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
