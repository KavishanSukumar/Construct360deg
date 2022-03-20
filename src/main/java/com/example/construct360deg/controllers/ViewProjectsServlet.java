package com.example.construct360deg.controllers;
import com.example.construct360deg.dao.ChatDAO;
import com.example.construct360deg.dao.MyProjectDAO;
import com.example.construct360deg.dao.NewProjectDAO;
import com.example.construct360deg.model.Chat;
import com.example.construct360deg.model.Project;
import com.example.construct360deg.dao.RequirementDAO;
import com.example.construct360deg.model.Requirement;
import com.example.construct360deg.dao.*;
import com.example.construct360deg.model.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/viewproject")
public class ViewProjectsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        int userid = (int) session.getAttribute("userid");
//        int projectid = (int) session.getAttribute("projectid");
        String userrole= (String) session.getAttribute("userrole");
        if (userrole.equals("cus_indiv")){

            //chat
            ChatDAO chatDAO=new ChatDAO();
            ArrayList<Chat> chats=new ArrayList<>();

            try {
                chats=chatDAO.ViewChats(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("chats",chats);

            //Add project
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProjectcus(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojectscus",newprojects);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);


            ArrayList<Requirement> requirements = new ArrayList<>();
            RequirementDAO   requirementDAO = new RequirementDAO();
            try {
                requirements=requirementDAO.displayownRequirement(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("requirements", requirements);

            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);


            System.out.println("Customer");
        }else if (userrole.equals("cus_com")){
            //chat
            ChatDAO chatDAO=new ChatDAO();
            ArrayList<Chat> chats=new ArrayList<>();

            try {
                chats=chatDAO.ViewChats(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("chats",chats);
            //Add project
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProjectcus(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojectscus",newprojects);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);


            ArrayList<Requirement> requirements = new ArrayList<>();
            RequirementDAO   requirementDAO = new RequirementDAO();
            try {
                requirements=requirementDAO.displayownRequirement(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("requirements", requirements);


            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/customer/html/viewproject-customer.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Customer");
        }else if(userrole.equals("prof_com")){
            //chat
            ChatDAO chatDAO=new ChatDAO();
            ArrayList<Chat> chats=new ArrayList<>();

            try {
                chats=chatDAO.ViewChats(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("chats",chats);
            //Add project
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            try {
                newprojects=newProjectDAO.viewProject(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("newprojects",newprojects);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);

        ///////------senal's part------------///////////////////////// ////////////////////////////////////////////////////////////////
            ArrayList<AllUsers> allcustomers = new ArrayList<>();
            AllProfileDAO allProfileDAO = new AllProfileDAO();
            ArrayList<Requirement> displayRequirement = new ArrayList<>();
            RequirementDAO requirementDAO = new RequirementDAO();
            ArrayList<Proposal>   displayownproposals = new ArrayList<>();
            ProposalsDAO proposalsDAO = new ProposalsDAO();
            ArrayList<Appointment> appointments = new ArrayList<>();
            AppointmentDAO appointmentDAO = new AppointmentDAO();

            try {
                allcustomers=allProfileDAO.allcustomers();
                displayRequirement = requirementDAO.displayRequirement();
                displayownproposals = proposalsDAO.displayownproposals(userid);
                appointments = appointmentDAO.retriveAppointments(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("allcustomers",allcustomers);
            req.setAttribute("displayRequirement",displayRequirement);
            req.setAttribute("displayownproposals",displayownproposals);
            req.setAttribute("appointment",appointments);
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }else if (userrole.equals("prof_indiv")){
            //chat
            ChatDAO chatDAO=new ChatDAO();
            ArrayList<Chat> chats=new ArrayList<>();

            try {
                chats=chatDAO.ViewChats(userid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            req.setAttribute("chats",chats);
            //Add project
            ArrayList<Project> newprojects = new ArrayList<>();
            NewProjectDAO newProjectDAO = new NewProjectDAO();
            ArrayList<Appointment> appointments = new ArrayList<>();
            AppointmentDAO appointmentDAO = new AppointmentDAO();
            System.out.println("I,m in view project line 199");
            try {
                System.out.println("success retriveAppointment");
                appointments=appointmentDAO.retriveAppointments(userid);
                System.out.println("success retriveAppointment 2");
//                newprojects=newProjectDAO.viewProject(userid);

            } catch (SQLException throwables) {
                throwables.printStackTrace();
                System.out.println("unsuccefull");
            }
            try {


                newprojects=newProjectDAO.viewProject(userid);

            } catch (SQLException throwables) {
                throwables.printStackTrace();

            }

            req.setAttribute("newprojects",newprojects);
            req.setAttribute("appointment",appointments);

            //close project
            Project project = new Project();
            MyProjectDAO myProjectDAO = new MyProjectDAO();
//            CloseProjectDAO closeProjectDAO = new CloseProjectDAO();
            try {
                project = myProjectDAO.displayData(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("closeprojects",project);
            ///////------senal's part------------///////////////////////// ////////////////////////////////////////////////////////////////
            ArrayList<AllUsers> allcustomers = new ArrayList<>();
            AllProfileDAO allProfileDAO = new AllProfileDAO();
            ArrayList<Requirement> displayRequirement = new ArrayList<>();
            RequirementDAO requirementDAO = new RequirementDAO();
            ArrayList<Proposal>   displayownproposals = new ArrayList<>();
            ProposalsDAO proposalsDAO = new ProposalsDAO();

            try {
                allcustomers=allProfileDAO.allcustomers();
                displayRequirement = requirementDAO.displayRequirement();
                displayownproposals = proposalsDAO.displayownproposals(userid);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            req.setAttribute("allcustomers",allcustomers);
            req.setAttribute("displayRequirement",displayRequirement);
            req.setAttribute("displayownproposals",displayownproposals);
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/html/professionals/html/viewproject-professional.jsp");
            requestDispatcher.forward(req,resp);
            System.out.println("Professional");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int appointmentid= Integer.parseInt( req.getParameter("appointmentid"));
        int task= Integer.parseInt( req.getParameter("task"));
        System.out.println(appointmentid);
        System.out.println(task);
        AppointmentDAO appointmentDAO=new AppointmentDAO();

        try {
            appointmentDAO.Appointmentstatus(appointmentid,task);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("test you");
    }
}
