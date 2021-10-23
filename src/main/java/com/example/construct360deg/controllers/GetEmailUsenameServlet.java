package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RegistrationDAO;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/GetEmailUsername")
public class GetEmailUsenameServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDAO registrationDAO=new RegistrationDAO();
        boolean status=false;
        String data=req.getParameter("data");
        String field=req.getParameter("field");

        String returntxt;

        try {
            status=registrationDAO.getEmail(data,field);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(status){
            returntxt=new Gson().toJson(status);
        }else{
            returntxt=new Gson().toJson(status);
        }
        PrintWriter out=resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("utf-8");
        out.print(returntxt);
    }
}
