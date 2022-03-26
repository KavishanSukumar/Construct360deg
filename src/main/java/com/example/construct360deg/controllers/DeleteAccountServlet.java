package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.DeleteAccountDAO;
import com.example.construct360deg.dao.ProductDAO;
import com.example.construct360deg.model.Account;
import com.example.construct360deg.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/deleteaccount")

public class DeleteAccountServlet extends HttpServlet {
    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        int userid = (int) session.getAttribute("userid");
//        PrintWriter out=resp.getWriter();
//        Account account = new Account();
//        account.setUserid(userid);
//        DeleteAccountDAO deleteAccountDAO = new DeleteAccountDAO();
//        try {
//            if (deleteAccountDAO.deleteaccount(userid)){
//                session.removeAttribute("uname");
//                System.out.println("Successfully deleted account");
//                out.println("<script type='text/javascript'>");
//                out.println("alert('Delete successful');");
//                out.println("location='"+req.getContextPath()+"/registration';");
////                location.href="<%=request.getContextPath()%>/registration?userid="+userid;
//                out.println("</script>");
//            }else {
//                out.println("<script type='text/javascript'>");
//                out.println("alert('Can't delete account you have ongoing project');");
//                out.println("location='"+req.getContextPath()+"/registration';");
//                out.println("</script>");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");
        PrintWriter out=resp.getWriter();
        Account account = new Account();
        account.setUserid(userid);
        DeleteAccountDAO deleteAccountDAO = new DeleteAccountDAO();
        try {
            if (deleteAccountDAO.deleteaccount(userid)){
                session.removeAttribute("uname");
                System.out.println("Successfully deleted account");
                out.println("<script type='text/javascript'>");
                out.println("alert('Delete successful');");
                out.println("location='"+req.getContextPath()+"/registration';");
//                location.href="<%=request.getContextPath()%>/registration?userid="+userid;
                out.println("</script>");
            }else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Can't delete account, you have ongoing project');");
                out.println("location='"+req.getContextPath()+"/registration';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("chathuri12345");

    }
}
