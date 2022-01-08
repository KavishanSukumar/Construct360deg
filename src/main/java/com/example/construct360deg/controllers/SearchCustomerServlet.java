package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AllProfileDAO;
import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.AllUsers;
import com.example.construct360deg.model.Requirement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
@WebServlet("/customer")
public class SearchCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        AllProfileDAO allProfileDAO=new AllProfileDAO();
//        ArrayList<AllUsers> allUsers=new ArrayList<>();
//
//        try {
//            allUsers=allProfileDAO.getAllCustomers();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        req.setAttribute("allcus",allUsers);
//        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/searchcustomer.jsp");
//        requestDispatcher.forward(req,resp);

        // senal's customer search//=======================================================
        RequirementDAO requirementDAO = new RequirementDAO();
        ArrayList<Requirement> displayreqonpublic = new ArrayList<>();

        try {
            displayreqonpublic = requirementDAO.display_cus_in_prof_public();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("displayreqonpublic",displayreqonpublic);
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/searchcustomer.jsp");
        requestDispatcher.forward(req,resp);

    }
}
