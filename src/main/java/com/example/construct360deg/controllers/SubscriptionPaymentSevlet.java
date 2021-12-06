package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AllProfileDAO;
import com.example.construct360deg.dao.PreviousProjectDAO;
import com.example.construct360deg.model.AllUsers;
import com.example.construct360deg.model.PreviousProject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/paysubscription")
public class SubscriptionPaymentSevlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");
        int userid= (int) session.getAttribute("userid");
        AllProfileDAO allProfileDAO=new AllProfileDAO();
        AllUsers allUsers=new AllUsers();
        try {
            allUsers=allProfileDAO.getuser(userid);
            req.setAttribute("user",allUsers);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(userrole.equals("admin")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/pay-sub.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("cus_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/pay-sub.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("cus_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/pay-sub.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if(userrole.equals("prof_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/pay-sub.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("prof_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/pay-sub.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("prod_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/pay-sub.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }
    }
}
