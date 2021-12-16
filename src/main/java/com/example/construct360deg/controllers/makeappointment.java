package com.example.construct360deg.controllers;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class makeappointment extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        Connection con = null;
        Statement stmt = null;
        String n = request.getParameter("Yname");
        String e = request.getParameter("Yemail");
        String d = request.getParameter("Ydate");
        String t = request.getParameter("Ytime");
        String l = request.getParameter("Ytele");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/regis/","root","root");
            stmt = con.createStatement();
            stmt.executeUpdate("insert into regist values ('"+n+"','"+e+"','"+d+"','"+t+"','"+l+"')");
            out.print("<h1>Your account<</h1>");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException classNotFoundException) {
            classNotFoundException.printStackTrace();
        }


    }
}
