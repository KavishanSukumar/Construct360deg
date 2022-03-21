package com.example.construct360deg.controllers;

import com.example.construct360deg.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/viewprofprofilecusreq")
public class ViewProfProfileFromCusReqServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");
        int userid = (int) session.getAttribute("userid");
        int profid=Integer.parseInt(req.getParameter("profid"));
        int tag = Integer.parseInt(req.getParameter("tag"));
        int reqid = Integer.parseInt(req.getParameter("reqid"));
        Account account = new Account();




    }
}
