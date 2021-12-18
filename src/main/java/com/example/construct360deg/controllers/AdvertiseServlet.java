package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.model.Advertise;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/advertise")
@MultipartConfig
public class AdvertiseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userrole = (String) session.getAttribute("userrole");

        if (userrole.equals("prof_com")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional");
        } else if (userrole.equals("prof_indiv")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional");
        } else if (userrole.equals("prod_com")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/productcompany/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Product company");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();
        Advertise advertise = new Advertise();
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");

        /* me deka gana ahanna*/


        advertise.setUserid(userid);
        advertise.setHeadline(req.getParameter("headline"));
        advertise.setDescription(req.getParameter("description"));
        advertise.setWeburl(req.getParameter("weburl"));
        Part filePart = req.getPart("imgfile");
        if (filePart != null) {
            advertise.setImg(filePart.getInputStream());
        }
        try {
            if(advertiseDAO.advertise(advertise)){
                System.out.println("advertisement  adding is successful");
                out.println("<script type='text/javascript'>");
                out.println("alert('You successfully upload your advertisement');");
                out.println("location='"+req.getContextPath()+"/landingpage';");
                out.println("</script>");
            }else {
                System.out.println("advertisement adding is unsuccessful");
                out.println("<script type='text/javascript'>");
                out.println("alert('Insert unsuccessful');");
                out.println("location='"+req.getContextPath()+"/landingpage';");
                out.println("</script>");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}

/* my AdvertiseServlet
package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AdvertiseDAO;
import com.example.construct360deg.model.Advertise;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@WebServlet("/advertise")
public class AdvertiseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userrole = (String) session.getAttribute("userrole");

        if (userrole.equals("prof_com")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional");
        } else if (userrole.equals("prof_indiv")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/professionals/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Professional");
        } else if (userrole.equals("prod_com")) {
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/html/productcompany/html/advertise.jsp");
            requestDispatcher.forward(req, resp);
            System.out.println("Product company");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        AdvertiseDAO advertiseDAO = new AdvertiseDAO();
        Advertise advertise = new Advertise();
        HttpSession session = req.getSession();
        int userid = (int) session.getAttribute("userid");
        String addid = UUID.randomUUID().toString();



        advertise.setUserid(userid);
                advertise.setAddid(addid);
                advertise.setHeadline(req.getParameter("headline"));
                advertise.setDescription(req.getParameter("description"));
                advertise.setWeburl(req.getParameter("weburl"));
                Part filePart = req.getPart("img");
                if (filePart != null) {
                advertise.setImg(filePart.getInputStream());
                }

                }
                }
                */