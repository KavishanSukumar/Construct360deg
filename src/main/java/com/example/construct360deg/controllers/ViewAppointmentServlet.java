package com.example.construct360deg.controllers;


import com.example.construct360deg.dao.AppointmentDAO;
import com.example.construct360deg.model.Appointment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/viewappointments")
public class ViewAppointmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        ArrayList<Appointment> appointments = new ArrayList<>();
        AppointmentDAO appointmentDAO = new AppointmentDAO();

        try {
            appointments=appointmentDAO.retriveAppointments();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        req.setAttribute("appointment",appointments);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/viewappoinment.jsp");
        requestDispatcher.forward(req,resp);
    }

}
