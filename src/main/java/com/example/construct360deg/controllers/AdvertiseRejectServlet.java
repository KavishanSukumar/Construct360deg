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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet("/advertisereject")
@MultipartConfig
public class AdvertiseRejectServlet extends HttpServlet {
    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }


    protected  void  doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        PrintWriter out = resp.getWriter();
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();
        Advertise rejectadd = new Advertise();
        HttpSession session = req.getSession();

        DateTimeFormatter todaytdate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate evodate = LocalDate.now();
        String addstatus = "rejected";

        rejectadd.setEvodate(Date.valueOf(evodate));
        rejectadd.setAddstatus(addstatus);
        rejectadd.setAddid(req.getParameter("rejectadd"));

        System.out.println("hello world");
        try {
            if(advertiseDAO.rejecttadvertise(rejectadd)){
                System.out.println("advertisement  adding is successful");
                out.println("<script type='text/javascript'>");
                out.println("alert('You rejected the advertisement successfully ');");
                out.println("location='"+req.getContextPath()+"/manageadds';");
                out.println("</script>");
            }else {
                System.out.println("advertisement adding is unsuccessful");
                out.println("<script type='text/javascript'>");
                out.println("alert('Error');");
                out.println("location='"+req.getContextPath()+"/manageadds';");
                out.println("</script>");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
