package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.dao.UserloginDAO;
import com.example.construct360deg.model.Advertise;
import com.example.construct360deg.model.Userlogin;

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
import java.util.ArrayList;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserloginDAO userloginDAO=new  UserloginDAO();
        String username=req.getParameter("username");
        String password=req.getParameter("password");

        Userlogin userlogin=new Userlogin();
        userlogin.setUsername(username);
        userlogin.setPassword(password);

        try {
            userlogin=userloginDAO.verify(userlogin);
            if(userlogin.getUserrole()!=null){
                HttpSession session=req.getSession();
                session.setAttribute("uname",username);
                session.setAttribute("userid",userlogin.getUserid());
                session.setAttribute("userrole",userlogin.getUserrole());

//                System.out.println(userlogin.getUserid());
//                System.out.println(userlogin.getUserrole());

                if(userlogin.getUserrole().equals("admin")){
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/landingpage.jsp");
                    requestDispatcher.forward(req,resp);
                    System.out.println("Admin");
                }else if (userlogin.getUserrole().equals("cus_indiv")){
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
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/landingpage.jsp");
                    requestDispatcher.forward(req,resp);
                    System.out.println("Customer");
                }else if (userlogin.getUserrole().equals("cus_com")){
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
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/landingpage.jsp");
                    requestDispatcher.forward(req,resp);
                    System.out.println("Customer");
                }else if(userlogin.getUserrole().equals("prof_com")){
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/landingpage.jsp");
                    requestDispatcher.forward(req,resp);
                    System.out.println("Professional");
                }else if (userlogin.getUserrole().equals("prof_indiv")){
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/landingpage.jsp");
                    requestDispatcher.forward(req,resp);
                    System.out.println("Professional");
                }else if (userlogin.getUserrole().equals("prod_com")){
                    RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/landingpage.jsp");
                    requestDispatcher.forward(req,resp);
                    System.out.println("Product company");
                }
            }else{
//                System.out.println(userlogin.getUserid());
//                System.out.println(userlogin.getUserrole());
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/login.jsp");
                requestDispatcher.forward(req,resp);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }

    }
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/login.jsp");
        requestDispatcher.forward(req,resp);
    }
}
