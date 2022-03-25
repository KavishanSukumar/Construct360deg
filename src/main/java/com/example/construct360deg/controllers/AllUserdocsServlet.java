package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.AllUserdocsDAO;
import com.example.construct360deg.model.AllUserdocs;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/AllUserdocsServlet")
@MultipartConfig
public class AllUserdocsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AllUserdocs allUserdocs = new AllUserdocs();
        AllUserdocsDAO allUserdocsDAO = new AllUserdocsDAO();
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        LocalDate nowdate = LocalDate.now();
        allUserdocs.setUploaded_date(Date.valueOf(nowdate));
        int userid = (int) session.getAttribute("userid");
        allUserdocs.setUserid(userid);
        String userrole = (String) session.getAttribute("userrole");
        allUserdocs.setUser_role(userrole);
        allUserdocs.setDoc_name(request.getParameter("filename"));
        System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        System.out.println(request.getParameter("filename"));

        Part filePart = request.getPart("reqfile");
        System.out.println(request.getPart("reqfile"));
        if(filePart!=null){
            allUserdocs.setDocumentfile(filePart.getInputStream());
            System.out.println(filePart.getInputStream());        }

        try {
            allUserdocsDAO.uploadUserDocs(allUserdocs);
            System.out.println("Requirement added is successfull");
            out.println("<script type='text/javascript'>");
            out.println("alert('Insert successful');");
            out.println("location='"+request.getContextPath()+"/viewproject';");
            out.println("</script>");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Requirement added is Unsuccessfull");
            out.println("<script type='text/javascript'>");
            out.println("alert('Insert Unsuccessful');");
            out.println("location='"+request.getContextPath()+"/viewproject';");
            out.println("</script>");
        }


    }
}
