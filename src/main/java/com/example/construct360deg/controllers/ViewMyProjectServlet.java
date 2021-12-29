package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.MyProjectDAO;
import com.example.construct360deg.model.Project;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/myproject")
public class ViewMyProjectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        String userrole= (String) session.getAttribute("userrole");
        if (userrole.equals("cus_indiv")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Customer");
        }else if (userrole.equals("cus_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Customer");
        }else if(userrole.equals("prof_com")){
            //Add Details in project
            MyProjectDAO myProjectDAO = new MyProjectDAO();
            ArrayList<Project> projects = new ArrayList<>();
            try {
                projects = myProjectDAO.retriveDetails();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("projects",projects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/myproject.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prof_indiv")){
            //Add Details in project
            MyProjectDAO myProjectDAO = new MyProjectDAO();
            ArrayList<Project> projects = new ArrayList<>();
            try {
                projects = myProjectDAO.retriveDetails();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("projects",projects);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/myproject.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");
        PrintWriter out = resp.getWriter();
        Project project = new Project();
        MyProjectDAO myProjectDAO = new MyProjectDAO();
        project.setEvent1(req.getParameter("event1"));
        project.setEvent2(req.getParameter("event2"));
        project.setEvent3(req.getParameter("event3"));
        project.setEvent4(req.getParameter("event4"));
        project.setOther(req.getParameter("other"));
        project.setContractor(req.getParameter("contractor"));
        project.setCustomer(req.getParameter("customer"));
        project.setLand(req.getParameter("land"));

        try {
            if(myProjectDAO.addDetails(project)){
                System.out.println("Details added successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Details added successfull');");
            }else{
                System.out.println("Details added unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Details added unsuccessfull');");
            }
            out.println("location='"+req.getContextPath()+"/myproject';");
            out.println("</script>");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
