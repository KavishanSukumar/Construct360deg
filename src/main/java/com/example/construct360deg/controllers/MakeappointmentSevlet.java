package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AppointmentDAO;
import com.example.construct360deg.model.Appointment;

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

@WebServlet("/Makeappointment")
public class MakeappointmentSevlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/makeappoinments.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{


        Appointment appointment = new Appointment();
        HttpSession session = req.getSession();
        AppointmentDAO appointmentDAO = new AppointmentDAO();
        PrintWriter out = resp.getWriter();


//        appointment.setAppoinmentid(req.getParameter(""));
        appointment.setCustomerid(Integer.parseInt(req.getParameter("custid")));
        appointment.setProfid(Integer.parseInt(req.getParameter("profid")));
        appointment.setDate(req.getParameter("date"));
        appointment.setTime(req.getParameter("time"));
        appointment.setCaption(req.getParameter("caption"));
        appointment.setMessage(req.getParameter("message"));
        System.out.println("Hello World2");

        try {
            if(appointmentDAO.makeappointment(appointment)){
                System.out.println("Appointment form is successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Appointment form successful');");
                out.println("location='"+req.getContextPath()+"/Makeappointment';");
                out.println("</script>");

            }else {
                System.out.println("Appointment form is unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Appointment form is unsuccessfull');");
                out.println("location='"+req.getContextPath()+"/Makeappointment';");
                out.println("</script>");

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/makeappoinments.jsp");
//        requestDispatcher.forward(req,resp);


    }

}
