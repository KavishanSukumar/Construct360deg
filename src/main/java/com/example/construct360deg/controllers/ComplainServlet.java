package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ComplainDAO;
import com.example.construct360deg.model.Complain;

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
/*
* Admins userid should be 1 to make this part run
* */
@WebServlet("/complains")
public class ComplainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/complain.jsp");
        requestDispatcher.forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Complain complain=new Complain();
        HttpSession session= req.getSession();
        ComplainDAO complainDAO=new ComplainDAO();
        PrintWriter out= resp.getWriter();
        complain.setComplainer((Integer) session.getAttribute("userid"));
        complain.setCategory(req.getParameter("category"));
        if(complain.getCategory().equals("user")){
            complain.setComplainee(Integer.parseInt(req.getParameter("complaineeuserid")));
        }else{
            complain.setComplainee(1);
        }

        complain.setEmail(req.getParameter("email"));
        complain.setFullname(req.getParameter("fname"));

        complain.setMessage(req.getParameter("message"));

        try {
            if (complainDAO.lodgecomplain(complain)){
                System.out.println("Complain Lodge successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Complain Lodge successful');");
                out.println("location='"+req.getContextPath()+"/landingpage';");
                out.println("</script>");
            }else{
                System.out.println("Complain Lodge unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Complain Lodge unsuccessful');");
                out.println("location='"+req.getContextPath()+"/landingpage';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
