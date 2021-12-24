package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AccountDetailsDAO;
import com.example.construct360deg.model.Account;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/account")
public class AccountServlet extends HttpServlet {
       @Override
       public void doGet(HttpServletRequest req, HttpServletResponse resp){

       }

       protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
              HttpSession session = req.getSession();
              PrintWriter out = resp.getWriter();
              int userid = (int) session.getAttribute("userid");
//              String userrole= (String) session.getAttribute("userrole");
              Account account = new Account();
              AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
              account.setUserid(userid);
              System.out.println("Hello1");

              account.setFirstname(req.getParameter("firstname"));
              account.setLastname(req.getParameter("lastname"));
              account.setBio(req.getParameter("bio"));
              account.setNic(req.getParameter("nic"));
              account.setEmail(req.getParameter("email"));
              account.setAddress(req.getParameter("address"));
              account.setContactnum(Integer.parseInt(req.getParameter("contactnum")));
              System.out.println("Hello2");

              try {
                     if(accountDetailsDAO.addDetails(account)) {
                            System.out.println("User details updated successfull");
                            out.println("<script type='text/javascript'>");
                            out.println("alert('User details updated successfull');");
                     }else{
                            System.out.println("User details updated unsuccessfull");
                            out.println("<script type='text/javascript'>");
                            out.println("alert('User details updated unsuccessfull');");
                     }
                     out.println("location='"+req.getContextPath()+"/editprofile';");
                     out.println("</script>");
              } catch (SQLException e) {
                     e.printStackTrace();
              }

       }
}
