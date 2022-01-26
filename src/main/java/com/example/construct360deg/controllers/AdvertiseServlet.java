package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.model.Advertise;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet("/manageadvertise(prof)")
@MultipartConfig
public class AdvertiseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");
        System.out.println(userid);
        ArrayList<Advertise> displayadds = new ArrayList<>();
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();

        if (userrole.equals("prof_com")) {

            try {
                displayadds=advertiseDAO.displayownadds(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                System.out.println("i am in prof_com catch block");
            }
            req.setAttribute("displayadds",displayadds);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/manageadds(prof).jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional_company");



        } else if (userrole.equals("prof_indiv")) {

            try {
                displayadds=advertiseDAO.displayownadds(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                System.out.println("i am in prof_indivi catch block");
            }
            req.setAttribute("displayadds",displayadds);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/manageadds(prof).jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional_individual");

        } else if (userrole.equals("prod_com")) {
            try {
                displayadds=advertiseDAO.displayownadds(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                System.out.println("i am in prod_com catch block");
            }
            req.setAttribute("displayadds",displayadds);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/productcompany/html/manageadds(productcom).jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Product company");
        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();
        Advertise advertise = new Advertise();
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");

        DateTimeFormatter todaytdate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter timenow = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalDate nowdate = LocalDate.now();
        LocalTime nowtime = LocalTime.now();

        String thedate=todaytdate.format(nowdate);
        String thetime=timenow.format(nowtime);
        System.out.println(thedate);
        System.out.println(thetime);


        advertise.setTodaydate(Date.valueOf(nowdate));
        advertise.setNowtime(Time.valueOf(nowtime));
        advertise.setUserid(userid);
        advertise.setHeadline(req.getParameter("headline"));
        advertise.setDescription(req.getParameter("description"));
        advertise.setWeburl(req.getParameter("weburl"));
        Part filePart = req.getPart("imgfile");
        if (filePart != null) {
            advertise.setImg(filePart.getInputStream());
            String filename = new File(filePart.getName()).getName();
            System.out.println(filename);
            System.out.println(filePart.getContentType());
        }
        try {
            if(advertiseDAO.advertise(advertise)){
                System.out.println("advertisement  adding is successful");
                out.println("<script type='text/javascript'>");
                out.println("alert('You successfully upload your advertisement');");
                out.println("location='"+req.getContextPath()+"/landingpage';");
                out.println("</script>");
            }else {
                System.out.println("advertisement adding is unsuccessful");
                out.println("<script type='text/javascript'>");
                out.println("alert('Insert unsuccessful');");
                out.println("location='"+req.getContextPath()+"/landingpage';");
                out.println("</script>");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
