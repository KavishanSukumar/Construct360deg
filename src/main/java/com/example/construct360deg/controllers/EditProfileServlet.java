package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AccountDetailsDAO;
import com.example.construct360deg.dao.PreviousProjectDAO;
import com.example.construct360deg.model.Account;
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

@WebServlet("/editprofile")
public class EditProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid= (int) session.getAttribute("userid");
        String userrole= (String) session.getAttribute("userrole");

        if(userrole.equals("admin")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/editdetails-admin.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("cus_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/editdetails-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("cus_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/editdetails-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if(userrole.equals("prof_com")){
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            ArrayList<Account> accounts = new ArrayList<>();
            try {
                accounts = accountDetailsDAO.retriveDetails();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",accounts);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/edituserdetails.jsp");
            requestDispatcher.forward(req,resp);

            System.out.println(userrole);
        }else if (userrole.equals("prof_indiv")){
            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            ArrayList<Account> accounts = new ArrayList<>();
            try {
                accounts = accountDetailsDAO.retriveDetails();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",accounts);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/edituserdetails.jsp");
            requestDispatcher.forward(req,resp);

            System.out.println(userrole);
        }else if (userrole.equals("prod_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/editdetails-productcompany.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("hello"+userrole);
        }
    }
}
