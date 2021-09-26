package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RegistrationDAO;
import com.example.construct360deg.model.CustomerIndividual;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/registercustomerindividual")
public class CustomerIndividualRegistrationSevlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDAO registrationDAO=new RegistrationDAO();
        CustomerIndividual customerIndividual=new CustomerIndividual();

        String firstname=req.getParameter("firstname");
        String lastname=req.getParameter("lastname");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String startDateStr = req.getParameter("dob");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        Date dob = null;
//        try {
//            dob = sdf.parse(startDateStr);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

        String email=req.getParameter("email");
       // FileInputStream profilepic=req.getParameter("profilepic");
        String province=req.getParameter("province");
        String district=req.getParameter("district");
        String city=req.getParameter("city");
        String street=req.getParameter("street");
        String houseno=req.getParameter("houseno");
        long  nic=Integer.parseInt(req.getParameter("nic"));
        //FileInputStream nicsoft=req.getParameter();
        String honorfic=req.getParameter("honorfic");
        String contactNo=req.getParameter("contactnum");
        //FileInputStream addressproof=req.getParameter();

        customerIndividual.setFirstname(honorfic+" "+firstname);
        customerIndividual.setLastname(lastname);
        customerIndividual.setUsername(username);
        customerIndividual.setPassword(password);
       // customerIndividual.setDob(dob);
        customerIndividual.setEmail(email);
        //customerIndividual.setProfilepic();
        customerIndividual.setProvince(province);
        customerIndividual.setDistrict(district);
        customerIndividual.setCity(city);
        customerIndividual.setStreet(street);
        customerIndividual.setHouseno(houseno);
        customerIndividual.setNic(nic);
        //customerIndividual.setNicsoft();
        customerIndividual.setHorrific(honorfic);
        customerIndividual.setContactNo(contactNo);
        //customerIndividual.setAddressproof();

        if(registrationDAO.customerIndividualRegistration(customerIndividual)){
            HttpSession session=req.getSession();
            resp.sendRedirect("./html/login.jsp");
        }else{
            resp.sendRedirect("./html/registrationform-customer-individual.jsp");
        }


    }
}
