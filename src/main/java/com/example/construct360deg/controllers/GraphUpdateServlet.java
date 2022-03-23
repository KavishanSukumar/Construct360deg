package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.GraphDAO;
import com.example.construct360deg.model.Graph;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/updategraph")
public class GraphUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        Graph graph=new Graph();
        GraphDAO graphDAO=new GraphDAO();

        graph.setProjectid(Integer.parseInt((req.getParameter("projectid"))));
        graph.setGraphattribute(req.getParameter("graphattribute"));
        graph.setGraphpoint(Float.parseFloat(req.getParameter("graphpoint")));
        System.out.println(graph.getProjectid()+"  -kavishansukumar");

        try {
            if (graphDAO.updateGraph(graph)){
                System.out.println("Graph updated successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Insert successful');");
                out.println("location='"+req.getContextPath()+"/myproject?projectid="+Integer.parseInt(req.getParameter("projectid"))+"';");
                out.println("</script>");
            }else {
                System.out.println("Graph update unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Insert successful');");
                out.println("location='"+req.getContextPath()+"/myproject?projectid="+Integer.parseInt(req.getParameter("projectid"))+"';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
