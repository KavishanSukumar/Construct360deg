package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RegistrationDAO;
import com.example.construct360deg.model.ProfessionalCompany;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
@WebServlet("/registerprofessionalcompany")
@MultipartConfig
public class ProfessionalCompanyRegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDAO registrationDAO=new RegistrationDAO();
        ProfessionalCompany professionalCompany=new ProfessionalCompany();
        InputStream inputStream1=null;
        InputStream inputStream2=null;

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
        String proftype=req.getParameter("professional") ;

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


        professionalCompany.setUserid(registrationnum+currentdate);
        professionalCompany.setUsername(username);
        professionalCompany.setPassword(password);
        professionalCompany.setEmail(email);
        professionalCompany.setProvince(province);
        professionalCompany.setDistrict(district);
        professionalCompany.setCity(city);
        professionalCompany.setStreet(street);
        professionalCompany.setHouseno(houseno);
        professionalCompany.setContactNo(contactNo);
        professionalCompany.setAddressproof(inputStream1);
        professionalCompany.setCompanyname(companyname);
        professionalCompany.setRegistrationnum(registrationnum);
        professionalCompany.setRegistrationsoftcopy(inputStream2);
        professionalCompany.setProftype(proftype);


        if(registrationDAO.professionalCompanyRegistration(professionalCompany)){
            HttpSession session=req.getSession();
            RequestDispatcher requestDispatcher= getServletContext().getRequestDispatcher("/login");
            requestDispatcher.include(req,resp);
        }else{
            resp.sendRedirect("./html/registrationform-customer-individual.jsp");
        }
    }
}
