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

@WebServlet("/manageadds")
@MultipartConfig
public class ManageAdvertiseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Advertise> advertise = new ArrayList<>();
        ArrayList<Advertise> acceptadds = new ArrayList<>();
        ArrayList<Advertise> rejectadds = new ArrayList<>();
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();

        try {
            advertise = advertiseDAO.retriveAdevertises();
            acceptadds = advertiseDAO.retreiveacceptadds();
            rejectadds = advertiseDAO.retreiverejectadds();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("advertise",advertise);
        req.setAttribute("acceptadds",acceptadds);
        req.setAttribute("rejectadds",rejectadds);
        RequestDispatcher requestDispatcher= req.getRequestDispatcher("/html/admin/html/manage-adds.jsp");
        requestDispatcher.forward(req,resp);

    }

}
