package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RegistrationDAO;
import com.example.construct360deg.model.CustomerCompany;
import com.example.construct360deg.model.CustomerIndividual;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/registercustomercompany")
@MultipartConfig
public class CustomerCompanyRegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDAO registrationDAO=new RegistrationDAO();
        CustomerCompany customerCompany=new CustomerCompany();
        InputStream inputStream1=null;
        InputStream inputStream2=null;
        InputStream inputStream3=null;

        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String email=req.getParameter("email");
        String province=req.getParameter("province");
        String district=req.getParameter("district");
        String city=req.getParameter("city");
        String street=req.getParameter("street");
        String houseno=req.getParameter("houseno");
        String contactNo=req.getParameter("contactnum");
        String registrationnum=req.getParameter("regnum");
        String companyname=req.getParameter("companyname");

        Part addressproof=req.getPart("addressproof");
        if(addressproof!=null){
            inputStream1=addressproof.getInputStream();
            System.out.println("Addressproof");
        }

        Part registrationsoftcopy=req.getPart("regsoftcpy");
        if(registrationsoftcopy!=null){
            inputStream2=registrationsoftcopy.getInputStream();
            System.out.println("registrationsoftcopy");
        }

        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String currentdate = dateFormat.format(date);


        customerCompany.setUserid(registrationnum+currentdate);
        customerCompany.setUsername(username);
        customerCompany.setPassword(password);
        customerCompany.setEmail(email);
        customerCompany.setProvince(province);
        customerCompany.setDistrict(district);
        customerCompany.setCity(city);
        customerCompany.setStreet(street);
        customerCompany.setHouseno(houseno);
        customerCompany.setContactNo(contactNo);
        customerCompany.setAddressproof(inputStream1);
        customerCompany.setCompanyname(companyname);
        customerCompany.setRegistrationnum(registrationnum);
        customerCompany.setRegistrationsoftcopy(inputStream2);


        if(registrationDAO.customerCompanyRegistration(customerCompany)){
            HttpSession session=req.getSession();
            RequestDispatcher requestDispatcher= getServletContext().getRequestDispatcher("/login");
            requestDispatcher.include(req,resp);
        }else{
            resp.sendRedirect("./html/registrationform-customer-individual.jsp");
        }


    }
}
