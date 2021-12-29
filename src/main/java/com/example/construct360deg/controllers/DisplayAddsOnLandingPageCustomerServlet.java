package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.model.Advertise;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/displayadds")
@MultipartConfig
public class DisplayAddsOnLandingPageCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException {
        ArrayList<Advertise> displayadds = new ArrayList<>();
        AdvertiseDAO  advertiseDAO = new AdvertiseDAO();

        try {
            displayadds=advertiseDAO.displayadds();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println("i am in catch block");
        }
        for(Advertise x:displayadds){
            System.out.println(x.getAddid());
        }
        System.out.println(displayadds);
        req.setAttribute("displayadds",displayadds);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/landingpage.jsp");
        requestDispatcher.forward(req,resp);
    }


}
