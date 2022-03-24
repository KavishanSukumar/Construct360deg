package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.GraphDAO;
import com.example.construct360deg.dao.MyProjectDAO;
import com.example.construct360deg.dao.NewProjectDAO;
import com.example.construct360deg.model.Graph;
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
        int projectid = Integer.parseInt(req.getParameter("projectid"));
        int userid = (int) session.getAttribute("userid");
        session.setAttribute("projectid",projectid);

        MyProjectDAO myProjectDAO = new MyProjectDAO();
        GraphDAO graphDAO=new GraphDAO();
        NewProjectDAO newProjectDAO = new NewProjectDAO();

        ArrayList<Project> projects = new ArrayList<>();

        ArrayList<Graph> proposedGraph=new ArrayList<>();
        ArrayList<Graph> ongoingGraph=new ArrayList<>();
        Project project = new Project();
        try {
            projects = newProjectDAO.viewProject(userid);
            project = myProjectDAO.retriveDetails(projectid);
            proposedGraph=graphDAO.getProposedGraph(projectid);
            ongoingGraph=graphDAO.getOngoingGraph(projectid);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        req.setAttribute("proposedGraph",proposedGraph);
        req.setAttribute("ongoingGraph",ongoingGraph);
        req.setAttribute("projects",project);
        req.setAttribute("newprojects",projects);
        req.setAttribute("projectid",projectid);

        if(userrole.equals("prof_com")){
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/myproject.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prof_indiv")){

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/myproject.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");

        }else if (userrole.equals("cus_indiv")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/myprojectcustomer.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Customer");

        }else if (userrole.equals("cus_com")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/customer/html/myprojectcustomer.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Customer");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        PrintWriter out = resp.getWriter();
        int userid = (int) session.getAttribute("userid");
        int projectid= Integer.parseInt(req.getParameter("myprojectid"));
        Project project = new Project();
        MyProjectDAO myProjectDAO = new MyProjectDAO();
        project.setProjectid(projectid);
        project.setEvent1(req.getParameter("event1"));
        project.setEvent2(req.getParameter("event2"));
        project.setEvent3(req.getParameter("event3"));
        project.setEvent4(req.getParameter("event4"));
        project.setOther(req.getParameter("other"));
        project.setMember1(req.getParameter("member1"));
        project.setMember2(req.getParameter("member2"));
        project.setMember3(req.getParameter("member3"));
        System.out.println("test12345");

        try {
            if(myProjectDAO.addDetails(project,userid)){
                System.out.println("Details added successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Details added successfull');");
            }else{
                System.out.println("Details added unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Details added unsuccessfull');");
            }
            out.println("location='"+req.getContextPath()+"/myproject?projectid="+projectid+"';");
            out.println("</script>");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
