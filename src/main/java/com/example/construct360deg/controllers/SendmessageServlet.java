package com.example.construct360deg.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/sendmessage")
public class SendmessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int option= Integer.parseInt(req.getParameter("option"));
        String contactnum=req.getParameter("contactnum");
        System.out.println(contactnum);
        if (contactnum.charAt(0)=='0'){
            contactnum=contactnum.substring(1);
        }
        System.out.println(contactnum+"Secondnum");
        System.out.println(option+"option");
        req.setAttribute("contactnum",contactnum);
        if (option==1){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/orderconfirm.jsp");
            requestDispatcher.forward(req,resp);
        }else if (option==2){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/productcompany/html/orderreject.jsp");
            requestDispatcher.forward(req,resp);
        }
    }
}
