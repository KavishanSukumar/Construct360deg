package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RequirementDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/deleteownreq")
public class DeleteOwnReqServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int reqid = Integer.parseInt(req.getParameter("reqid"));
        System.out.println("this is req id ========== "+reqid);
        PrintWriter out = resp.getWriter();
        RequirementDAO requirementDAO = new RequirementDAO();
        System.out.println("i am in delete req 1");
        try {
                requirementDAO.deleteownreq(reqid);
                System.out.println("delete requirement is successful");
                out.println("<script type='text/javascript'>");
                out.println("alert('You successfully delete your requirement');");
                out.println("location='"+req.getContextPath()+"/viewproject';");
                out.println("</script>");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println("Deleting requirement is unsuccessful");
            out.println("<script type='text/javascript'>");
            out.println("alert('Deleting requirement is unsuccessful');");
            out.println("location='"+req.getContextPath()+"/viewproject';");
            out.println("</script>");
        }
        System.out.println("i am in end  of delete req ");
    }
}
