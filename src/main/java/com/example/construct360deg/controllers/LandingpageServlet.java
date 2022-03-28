package com.example.construct360deg.controllers;


import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.dao.AllProfileDAO;
import com.example.construct360deg.dao.PaySubDAO;
import com.example.construct360deg.model.Advertise;
import com.example.construct360deg.model.AllUsers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/landingpage")
@MultipartConfig
public class LandingpageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userrole = (String) session.getAttribute("userrole");
        int  userid= (int) session.getAttribute("userid");
        PaySubDAO paySubDAO=new PaySubDAO();
        String status=null;

        AllProfileDAO allProfileDAO=new AllProfileDAO();
        AllUsers allUsers=new AllUsers();
        String paymentyype=null;

        try {
            paymentyype=paySubDAO.getThesubtype(userid);
            req.setAttribute("paymentyype",paymentyype);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        try {
            allUsers=allProfileDAO.getuser(userid);
            req.setAttribute("user",allUsers);

        } catch (SQLException e) {
            e.printStackTrace();
        }




        try {
            status=paySubDAO.getThesubtype(userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (userrole.equals("prof_com")) {
            if (status.equals("Basic")){
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/onlypay-sub.jsp");
                requestDispatcher.forward(req, resp);
            }else {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/landingpage.jsp");
                requestDispatcher.forward(req, resp);
            }
            System.out.println("Professional");
        } else if (userrole.equals("prof_indiv")) {
            if (status.equals("Basic")){
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/onlypay-sub.jsp");
                requestDispatcher.forward(req, resp);
            }else {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/landingpage.jsp");
                requestDispatcher.forward(req, resp);
            }

            System.out.println("Professional");
        } else if (userrole.equals("prod_com")) {
            if (status.equals("Basic")){
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/productcompany/html/onlypay-sub.jsp");
                requestDispatcher.forward(req, resp);
            }else {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/productcompany/html/landingpage.jsp");
                requestDispatcher.forward(req, resp);
            }

            System.out.println("Product company");
        } else if (userrole.equals("admin")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/admin/html/landingpage.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("admin");
        } else if (userrole.equals("cus_indiv")) {

            ArrayList<Advertise> displayadds = new ArrayList<>();
            AdvertiseDAO advertiseDAO = new AdvertiseDAO();

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

            if (status.equals("Basic")){
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/onlypay-sub.jsp");
                requestDispatcher.forward(req, resp);
            }else {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/landingpage.jsp");
                requestDispatcher.forward(req, resp);
            }

            System.out.println("cus_indiv");
        }
        else if (userrole.equals("cus_com")) {

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
            if (status.equals("Basic")){
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/onlypay-sub.jsp");
                requestDispatcher.forward(req, resp);
            }else {
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/landingpage.jsp");
                requestDispatcher.forward(req, resp);
            }

            System.out.println("cus_com");
        }
    }

}
