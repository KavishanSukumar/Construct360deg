package com.example.construct360deg.controllers;

import com.example.construct360deg.dao.RegistrationDAO;
import com.example.construct360deg.model.CustomerIndividual;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@WebServlet("/registercustomerindividual")
@MultipartConfig
public class CustomerIndividualRegistrationSevlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDAO registrationDAO=new RegistrationDAO();
        CustomerIndividual customerIndividual=new CustomerIndividual();
        InputStream inputStream1=null;
        InputStream inputStream2=null;
        InputStream inputStream3=null;

        String firstname=req.getParameter("firstname");
        String lastname=req.getParameter("lastname");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String dateofbirth = req.getParameter("dob");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try {
            dob = sdf.parse(dateofbirth);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        String email=req.getParameter("email");
        String province=req.getParameter("province");
        String district=req.getParameter("district");
        String city=req.getParameter("city");
        String street=req.getParameter("street");
        String houseno=req.getParameter("houseno");
        String  nic=req.getParameter("nic");
        String honorfic=req.getParameter("honorfic");
        String contactNo=req.getParameter("contactnum");


        //FileInputStream addressproof=req.getParameter();
        // FileInputStream profilepic=req.getParameter("profilepic");
        //FileInputStream nicsoft=req.getParameter();


        Part addressproof=req.getPart("addressproof");
        if(addressproof!=null){
            inputStream1=addressproof.getInputStream();
            System.out.println("Addressproof");
        }
        Part nicsoft=req.getPart("nicsoftcpy");
        if(addressproof!=null){
            inputStream2=nicsoft.getInputStream();
            System.out.println("Niccopy");
        }


        Date date = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String currentdate = dateFormat.format(date);



        customerIndividual.setUserid(nic+currentdate);
        customerIndividual.setFirstname(honorfic+" "+firstname);
        customerIndividual.setLastname(lastname);
        customerIndividual.setUsername(username);
        customerIndividual.setPassword(password);

        customerIndividual.setEmail(email);
        customerIndividual.setDob(dob);
        customerIndividual.setDob(new java.sql.Date(customerIndividual.getDob().getTime()));

        customerIndividual.setProvince(province);
        customerIndividual.setDistrict(district);
        customerIndividual.setCity(city);
        customerIndividual.setStreet(street);
        customerIndividual.setHouseno(houseno);
        customerIndividual.setNic(nic);
        customerIndividual.setHorrific(honorfic);
        customerIndividual.setContactNo(contactNo);

        customerIndividual.setAddressproof(inputStream1);
        //customerIndividual.setProfilepic();
        customerIndividual.setNicsoft(inputStream2);


        try {
            if(registrationDAO.customerIndividualRegistration(customerIndividual)){
                HttpSession session=req.getSession();
                RequestDispatcher requestDispatcher= getServletContext().getRequestDispatcher("/login");
                requestDispatcher.include(req,resp);
            }else{
                resp.sendRedirect("./html/registrationform-customer-individual.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
