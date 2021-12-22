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

@WebServlet("/advertiseaccept")
@MultipartConfig
public class AdvertiseAcceptServlet extends HttpServlet {
    @Override
    protected  void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



    }


    protected  void  doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        PrintWriter out = resp.getWriter();
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();
        Advertise acceptadd = new Advertise();
        HttpSession session = req.getSession();

        DateTimeFormatter todaytdate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate evodate = LocalDate.now();
        String addstatus = "accepted";

        acceptadd.setEvodate(Date.valueOf(evodate));
        acceptadd.setAddstatus(addstatus);
        acceptadd.setAddid(req.getParameter("acceptadd"));

        System.out.println("hello world");
        try {

            if(advertiseDAO.acceptadvertise(acceptadd)){
                System.out.println("hola");
                out.println("<script type='text/javascript'>");
                out.println("alert('You accepted the advertisement successfully ');");
                out.println("location='"+req.getContextPath()+"/manageadds';");
                out.println("</script>");
            }else {
                System.out.println("bad situation");
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
