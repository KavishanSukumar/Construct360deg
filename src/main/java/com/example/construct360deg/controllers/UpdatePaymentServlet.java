package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.ProjectDAO;
import com.example.construct360deg.model.Payment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/uploadpayment")
@MultipartConfig
public class UpdatePaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Payment payment=new Payment();
        ProjectDAO projectDAO=new ProjectDAO();
        PrintWriter out=resp.getWriter();

        payment.setPaymentName(req.getParameter("paymentname"));
        payment.setProjectid(Integer.parseInt(req.getParameter("projectid")));
        DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now=LocalDateTime.now();
        String datetime=dtf.format(now);
        payment.setPaymentdatetime(datetime);

        Part filepart=req.getPart("paymentfile");
        if (filepart!=null){
            payment.setImage(filepart.getInputStream());
        }
        try {
            if(projectDAO.uploadPayemnt(payment)){
                System.out.println("payment added is successfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Payment uploaded successfully');");
                out.println("location='"+req.getContextPath()+"/myproject?projectid="+payment.getProjectid()+"';");
                out.println("</script>");
            }else{
                System.out.println("payment added is unsuccessfull");
                out.println("<script type='text/javascript'>");
                out.println("alert('Payment upload unsuccessful');");
                out.println("location='"+req.getContextPath()+"/myproject?projectid="+payment.getProjectid()+"';");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
