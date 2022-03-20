package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.UserloginDAO;
import com.example.construct360deg.model.ForgotPassword;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/changethepassword")
public class ChangeThePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password=req.getParameter("newpwd");
        String password1=req.getParameter("confrmpwd");
        ForgotPassword forgotPassword=new ForgotPassword();
        UserloginDAO userloginDAO=new UserloginDAO();
        PrintWriter out=resp.getWriter();
        if (password.equals(password1)){
            HttpSession session = req.getSession();
            String email= (String) session.getAttribute("email");
            String password2= DigestUtils.sha256Hex(password);
            forgotPassword.setEmail(email);
            forgotPassword.setPassword(password2);
            boolean status=false;
            try {
                status=userloginDAO.changeThePassword(forgotPassword);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (status){
                out.println("<script type='text/javascript'>");
                out.println("alert('Password reset successful');");
                out.println("location='"+req.getContextPath()+"/login';");
                out.println("</script>");
            }else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Password reset unsuccessful');");
                out.println("location='"+req.getContextPath()+"/login';");
                out.println("</script>");
            }
            session.removeAttribute("email");
            session.removeAttribute("token");
        }
    }
}
