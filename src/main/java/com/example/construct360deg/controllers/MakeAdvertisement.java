package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AccountDetailsDAO;
import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.dao.AllProfileDAO;
import com.example.construct360deg.dao.ViewProfileDAO;
import com.example.construct360deg.model.Account;
import com.example.construct360deg.model.Advertise;
import com.example.construct360deg.model.Viewprofile;

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
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/advertise")
@MultipartConfig
public class MakeAdvertisement extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException, ServletException {
        HttpSession session = req.getSession();
        String userrole = (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");
        ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
        Viewprofile viewprofile = new Viewprofile();
        AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
        Account account = new Account();
        Account account1 = new Account();

        if (userrole.equals("prof_com")) {
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
                account1 = accountDetailsDAO.retriveDetails(userid,userrole);

            } catch (SQLException exception) {
                exception.printStackTrace();
            }
            req.setAttribute("img",account);
            req.setAttribute("name",account1);

            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional");
        } else if (userrole.equals("prof_indiv")) {
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
                account1 = accountDetailsDAO.retriveDetails(userid,userrole);

            } catch (SQLException exception) {
                exception.printStackTrace();
            }
            req.setAttribute("img",account);
            req.setAttribute("name",account1);
            req.setAttribute("userrole",userrole);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional");
        } else if (userrole.equals("prod_com")) {
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
                account1 = accountDetailsDAO.retriveDetails(userid,userrole);

            } catch (SQLException exception) {
                exception.printStackTrace();
            }
            req.setAttribute("img",account);
            req.setAttribute("name",account1);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/productcompany/html/advertise.jsp");
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
        System.out.println("------------------------------");
        System.out.println(userid);
        System.out.println("------------------------------");
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
