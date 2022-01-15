package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AccountDetailsDAO;
import com.example.construct360deg.dao.PreviousProjectDAO;
import com.example.construct360deg.dao.ViewProfileDAO;
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
        Account account = new Account();

        if(userrole.equals("admin")){
            //Profile pic change
            ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("changepic",account);

            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/admin/html/editdetails-admin.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("cus_indiv")){
            //Profile pic change
            ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("changepic",account);

            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/editdetails-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if (userrole.equals("cus_com")){
            //Profile pic change
            ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("changepic",account);

            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/editdetails-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println(userrole);
        }else if(userrole.equals("prof_com")){
            //Profile pic change
            ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("changepic",account);

            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/edituserdetails.jsp");
            requestDispatcher.forward(req,resp);

            System.out.println(userrole);
        }else if (userrole.equals("prof_indiv")){
            //Profile pic change
            ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("changepic",account);

            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/edituserdetails.jsp");
            requestDispatcher.forward(req,resp);

            System.out.println(userrole);
        }else if (userrole.equals("prod_com")){
            //Profile pic change
            ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
            try {
                account = viewProfileDAO.viewImage(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("changepic",account);

            AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
            try {
                account = accountDetailsDAO.retriveDetails(userid,userrole);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("accounts",account);
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/editdetails-productcompany.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("hello"+userrole);
        }
    }
}
