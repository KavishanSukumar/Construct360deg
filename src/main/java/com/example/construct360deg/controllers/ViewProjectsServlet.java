package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.CloseProjectDAO;
import com.example.construct360deg.model.Closeproject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/viewproject")
public class ViewProjectsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");
        if (userrole.equals("cus_indiv")){
            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Customer");
        }else if (userrole.equals("cus_com")){
            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Customer");
        }else if(userrole.equals("prof_com")){
            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prof_indiv")){
            //close project
            ArrayList<Closeproject> closeprojects = new ArrayList<>();
            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                closeprojects = closeProjectDAO.displayData();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects", closeprojects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }
    }
}
