package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.TimeSlotsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/updatetimeslots")
public class UpdateTimeSlotsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        HttpSession session= req.getSession();
        int profid=(int)session.getAttribute("userid");
        String date = req.getParameter("selected_date");
        String[] active_slots = req.getParameterValues("slots");
        if(active_slots == null){
            active_slots = new String[0];
        }
        TimeSlotsDAO slotsDAO = new TimeSlotsDAO();
        try {
            slotsDAO.updatetimeslots(profid, date, active_slots);
            System.out.println(" successful data sending");
            out.println("<script type='text/javascript'>");
            out.println("alert('Update successful');");
            out.println("location='"+req.getContextPath()+"/viewproject';");
            out.println("</script>");
        } catch(Exception e){
            out.println(e);
            System.out.println(" unsuccessful data sending");
            out.println("<script type='text/javascript'>");
            out.println("alert('Update unsuccessful');");
            out.println("location='"+req.getContextPath()+"/viewproject';");
            out.println("</script>");
        }

    }

}
