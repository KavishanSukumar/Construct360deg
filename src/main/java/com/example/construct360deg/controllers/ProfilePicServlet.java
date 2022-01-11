package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ViewProfileDAO;
import com.example.construct360deg.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/profilepic")
@MultipartConfig
public class ProfilePicServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        int userid = (int) session.getAttribute("userid");
        String userrole = (String) session.getAttribute("userrole");
        Account account = new Account();
        ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
        account.setUserid(userid);
        account.setUserrole(userrole);

        if (userrole.equals("prof_indiv") || userrole.equals("cus_indiv")) {

            Part filePart = req.getPart("image");
            if (filePart != null) {
                account.setProfilepic(filePart.getInputStream());
            }
            try {
                if (viewProfileDAO.addImage(account)) {
                    System.out.println("Image adding is successfull");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('successful');");
                    out.println("location='" + req.getContextPath() + "/viewprofile';");
                    out.println("</script>");
                } else {
                    System.out.println("Image adding is successfull");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('unsuccessful');");
                    out.println("location='" + req.getContextPath() + "/viewprofile';");
                    out.println("</script>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(userrole.equals("prod_com") || userrole.equals("admin")){
            Part filePart = req.getPart("image");
            if (filePart != null) {
                account.setProfilepic(filePart.getInputStream());
            }
            try {
                if (viewProfileDAO.addImage(account)) {
                    System.out.println("Image adding is successfull");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('successful');");
                    out.println("location='" + req.getContextPath() + "/viewprofile';");
                    out.println("</script>");
                } else {
                    System.out.println("Image adding is successfull");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('unsuccessful');");
                    out.println("location='" + req.getContextPath() + "/viewprofile';");
                    out.println("</script>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
