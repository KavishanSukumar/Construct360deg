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
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/Makeappointment")
public class MakeappointmentSevlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int profid=Integer.parseInt(req.getParameter("profid"));
        req.setAttribute("profid",profid);
        System.out.println(profid);
        String choosedate = req.getParameter("choosedate");
        int  thetimeslot = Integer.parseInt(req.getParameter("thetimeslot"));
        req.setAttribute("choosedate",choosedate);
        req.setAttribute("thetimeslot",thetimeslot);
        System.out.println(profid+" "+choosedate+" "+thetimeslot);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/makeappoinments.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        int customerid= (int) session.getAttribute("userid");
        Appointment appointment = new Appointment();
        AppointmentDAO appointmentDAO = new AppointmentDAO();


        int profid = Integer.parseInt(req.getParameter("profid"));
        int slotid =Integer.parseInt(req.getParameter("slotid"));
        System.out.println("slotid "+slotid);
        String caption = req.getParameter("caption");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String message = req.getParameter("message");
//        appointment.setAppoinmentid(req.getParameter(""));
//        appointment.setCustomerid(Integer.parseInt(req.getParameter("custid")));
        appointment.setProfid(profid);
        appointment.setCustomerid(customerid);
        appointment.setDate(date);
        appointment.setTime(time);
        appointment.setCaption(caption);
        appointment.setMessage(message);
        appointment.setSlotid(slotid);
        System.out.println("Hello World2");

        try {
            if(appointmentDAO.makeappointment(appointment)){
                System.out.println("Appointment form is successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Appointment form successful');");
                out.println("location='"+req.getContextPath()+"/viewprofprofile?profid="+profid+"';");
                out.println("</script>");

            }else {
                System.out.println("Appointment form is unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Appointment form is unsuccessfull');");
                out.println("location='"+req.getContextPath()+"/viewprofprofile?profid="+profid+"';");
                out.println("</script>");

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
//        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/makeappoinments.jsp");
//        requestDispatcher.forward(req,resp);


    }

}
