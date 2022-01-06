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
       public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException{

       }

       @Override
       protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
              HttpSession session = req.getSession();
              PrintWriter out = resp.getWriter();
              int userid = (int) session.getAttribute("userid");
              String userrole= (String) session.getAttribute("userrole");
              System.out.println(userrole);
              Account account = new Account();
              AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
              account.setUserrole(userrole);
              account.setUserid(userid);

              if (userrole.equals("prof_indiv") || userrole.equals("cus_indiv")) {
//                     System.out.println("Hello1");

                     account.setFirstname(req.getParameter("firstname"));
                     account.setLastname(req.getParameter("lastname"));
                     account.setNic(req.getParameter("nic"));
                     account.setHouseno(req.getParameter("houseno"));
                     account.setStreet(req.getParameter("street"));
                     account.setCity(req.getParameter("city"));
                     account.setDistrict(req.getParameter("district"));
                     account.setProvince(req.getParameter("province"));
                     account.setEmail(req.getParameter("email"));
                     account.setContactno(req.getParameter("contactno"));
                     System.out.println("Hello2");

                     try {
                            if (accountDetailsDAO.addDetails(account)) {
                                   System.out.println("User details updated successfull");
                                   out.println("<script type='text/javascript'>");
                                   out.println("alert('User details updated successfull');");
                            } else {
                                   System.out.println("User details updated unsuccessfull");
                                   out.println("<script type='text/javascript'>");
                                   out.println("alert('User details updated unsuccessfull');");
                            }
                            out.println("location='" + req.getContextPath() + "/viewprofile';");
                            out.println("</script>");
                     } catch (SQLException e) {
                            e.printStackTrace();
                     }
              }else if(userrole.equals("prod_com")){

                     account.setCompanyname(req.getParameter("companyname"));
                     account.setHouseno(req.getParameter("houseno"));
                     account.setStreet(req.getParameter("street"));
                     account.setCity(req.getParameter("city"));
                     account.setDistrict(req.getParameter("district"));
                     account.setProvince(req.getParameter("province"));
                     account.setEmail(req.getParameter("email"));
                     account.setContactno(req.getParameter("contactno"));

                     try {
                            if (accountDetailsDAO.addDetails(account)) {
                                   System.out.println("User details updated successfull");
                                   out.println("<script type='text/javascript'>");
                                   out.println("alert('User details updated successfull');");
                            } else {
                                   System.out.println("User details updated unsuccessfull");
                                   out.println("<script type='text/javascript'>");
                                   out.println("alert('User details updated unsuccessfull');");
                            }
                            out.println("location='" + req.getContextPath() + "/viewprofile';");
                            out.println("</script>");
                     } catch (SQLException e) {
                            e.printStackTrace();
                     }
              }else if(userrole.equals("admin")){
                     account.setHouseno(req.getParameter("houseno"));
                     account.setStreet(req.getParameter("street"));
                     account.setCity(req.getParameter("city"));
                     account.setDistrict(req.getParameter("district"));
                     account.setProvince(req.getParameter("province"));
                     account.setEmail(req.getParameter("email"));
                     account.setContactno(req.getParameter("contactno"));

                     try {
                            if (accountDetailsDAO.addDetails(account)) {
                                   System.out.println("User details updated successfull");
                                   out.println("<script type='text/javascript'>");
                                   out.println("alert('User details updated successfull');");
                            } else {
                                   System.out.println("User details updated unsuccessfull");
                                   out.println("<script type='text/javascript'>");
                                   out.println("alert('User details updated unsuccessfull');");
                            }
                            out.println("location='" + req.getContextPath() + "/viewprofile';");
                            out.println("</script>");
                     } catch (SQLException e) {
                            e.printStackTrace();
                     }
              }
       }
}
