package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.CustomerCompany;
import com.example.construct360deg.model.CustomerIndividual;
import com.example.construct360deg.model.ProfessionalCompany;

import java.sql.*;

public class RegistrationDAO {
    public boolean customerIndividualRegistration(CustomerIndividual customerIndividual) throws SQLException {
            boolean status=false;
            int row=0;
            Connection connection=Database.getConnection();
                String users="INSERT INTO Users(`userid`,`addressproof`, `province`, `district`, `city`, `street`, `houseno`)" +
                        "VALUES(?,?,?,?,?,?,?)";

                String UserContactNo="INSERT INTO UserContactNo(`userid`, `contactno`, `email`)" +
                        "VALUES(?,?,?)";

                String login="INSERT INTO login(`username`, `password`, `userid`)"+
                        "VALUES(?,?,?)";
                String customer="INSERT INTO CustomerIndividual(`userid`, `firstname`, `lastname`, `nic`, `nicsoftcopy`, `dob`)" +
                        "VALUES(?,?,?,?,?,?)";
                try {
                    PreparedStatement preparedStatement=connection.prepareStatement(users);
                    preparedStatement.setString(1,customerIndividual.getUserid());
                    preparedStatement.setBlob(2,customerIndividual.getAddressproof());
                    preparedStatement.setString(3,customerIndividual.getProvince());
                    preparedStatement.setString(4,customerIndividual.getDistrict());
                    preparedStatement.setString(5,customerIndividual.getCity());
                    preparedStatement.setString(6,customerIndividual.getStreet());
                    preparedStatement.setString(7,customerIndividual.getHouseno());
                    row=preparedStatement.executeUpdate();

                }catch (SQLException throwables){
                    throwables.printStackTrace();
                }


                try{
                    PreparedStatement preparedStatement=connection.prepareStatement(UserContactNo);
                    preparedStatement.setString(1,customerIndividual.getUserid());
                    preparedStatement.setString(2,customerIndividual.getContactNo());
                    preparedStatement.setString(3,customerIndividual.getEmail());
                    row+=preparedStatement.executeUpdate();

                }catch (SQLException throwables){
                    throwables.printStackTrace();
                }


                try{
                    PreparedStatement preparedStatement=connection.prepareStatement(login);
                    preparedStatement.setString(1,customerIndividual.getUsername());
                    preparedStatement.setString(2,customerIndividual.getPassword());
                    preparedStatement.setString(3,customerIndividual.getUserid());
                    row+=preparedStatement.executeUpdate();

                }catch (SQLException throwables){
                    throwables.printStackTrace();
                }

                try{
                    PreparedStatement preparedStatement=connection.prepareStatement(customer);
                    preparedStatement.setString(1,customerIndividual.getUserid());
                    preparedStatement.setString(2,customerIndividual.getFirstname());
                    preparedStatement.setString(3,customerIndividual.getLastname());
                    preparedStatement.setString(4,customerIndividual.getNic());
                    preparedStatement.setBlob(5,customerIndividual.getNicsoft());
                    preparedStatement.setDate(6, (Date) customerIndividual.getDob());
                    row+=preparedStatement.executeUpdate();

                }catch (SQLException throwables){
                    throwables.printStackTrace();
                }
                if(row!=0){
                    status=true;
                }
                return status;
    }
    public boolean customerCompanyRegistration(CustomerCompany customerCompany){
        boolean status=false;
        int row=0;
        Connection connection=Database.getConnection();
        String users="INSERT INTO Users(`userid`,`addressproof`, `province`, `district`, `city`, `street`, `houseno`)" +
                "VALUES(?,?,?,?,?,?,?)";

        String UserContactNo="INSERT INTO UserContactNo(`userid`, `contactno`, `email`)" +
                "VALUES(?,?,?)";

        String login="INSERT INTO login(`username`, `password`, `userid`)"+
                "VALUES(?,?,?)";
        String customer="INSERT INTO `customercompany`(`userid`, `registrationnum`, `registrationsoftcopy`, `companyname`) " +
                "VALUES(?,?,?,?)";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(users);
            preparedStatement.setString(1,customerCompany.getUserid());
            preparedStatement.setBlob(2,customerCompany.getAddressproof());
            preparedStatement.setString(3,customerCompany.getProvince());
            preparedStatement.setString(4,customerCompany.getDistrict());
            preparedStatement.setString(5,customerCompany.getCity());
            preparedStatement.setString(6,customerCompany.getStreet());
            preparedStatement.setString(7,customerCompany.getHouseno());
            row=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }


        try{
            PreparedStatement preparedStatement=connection.prepareStatement(UserContactNo);
            preparedStatement.setString(1,customerCompany.getUserid());
            preparedStatement.setString(2,customerCompany.getContactNo());
            preparedStatement.setString(3,customerCompany.getEmail());
            row+=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }


        try{
            PreparedStatement preparedStatement=connection.prepareStatement(login);
            preparedStatement.setString(1,customerCompany.getUsername());
            preparedStatement.setString(2,customerCompany.getPassword());
            preparedStatement.setString(3,customerCompany.getUserid());
            row+=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }

        try{
            PreparedStatement preparedStatement=connection.prepareStatement(customer);
            preparedStatement.setString(1,customerCompany.getUserid());
            preparedStatement.setString(2,customerCompany.getRegistrationnum());
            preparedStatement.setBlob(3,customerCompany.getRegistrationsoftcopy());
            preparedStatement.setString(4,customerCompany.getCompanyname());
            row+=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }

        if(row!=0){
            status=true;
        }
        return status;
    }

    public boolean professionalCompanyRegistration(ProfessionalCompany professionalCompany){
        boolean status=false;
        int row=0;
        Connection connection=Database.getConnection();
        String users="INSERT INTO Users(`userid`,`addressproof`, `province`, `district`, `city`, `street`, `houseno`)" +
                "VALUES(?,?,?,?,?,?,?)";

        String UserContactNo="INSERT INTO UserContactNo(`userid`, `contactno`, `email`)" +
                "VALUES(?,?,?)";

        String login="INSERT INTO login(`username`, `password`, `userid`)"+
                "VALUES(?,?,?)";
        String companyprof="INSERT INTO `companyprof`(`userid`, `registrationno`,  `registrationsoftcopy`,`companyname`, `contractorflag`, `landscapedesignerflag`,  `productcompflag`) " +
                "VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(users);
            preparedStatement.setString(1,professionalCompany.getUserid());
            preparedStatement.setBlob(2,professionalCompany.getAddressproof());
            preparedStatement.setString(3,professionalCompany.getProvince());
            preparedStatement.setString(4,professionalCompany.getDistrict());
            preparedStatement.setString(5,professionalCompany.getCity());
            preparedStatement.setString(6,professionalCompany.getStreet());
            preparedStatement.setString(7,professionalCompany.getHouseno());
            row=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }


        try{
            PreparedStatement preparedStatement=connection.prepareStatement(UserContactNo);
            preparedStatement.setString(1,professionalCompany.getUserid());
            preparedStatement.setString(2,professionalCompany.getContactNo());
            preparedStatement.setString(3,professionalCompany.getEmail());
            row+=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }


        try{
            PreparedStatement preparedStatement=connection.prepareStatement(login);
            preparedStatement.setString(1,professionalCompany.getUsername());
            preparedStatement.setString(2,professionalCompany.getPassword());
            preparedStatement.setString(3,professionalCompany.getUserid());
            row+=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }

        try{

            PreparedStatement preparedStatement=connection.prepareStatement(companyprof);
            preparedStatement.setString(1,professionalCompany.getUserid());
            preparedStatement.setString(2,professionalCompany.getRegistrationnum());
            preparedStatement.setBlob(3,professionalCompany.getRegistrationsoftcopy());
            preparedStatement.setString(4,professionalCompany.getCompanyname());

            if(professionalCompany.getProftype().equals("cont"))
            {
                preparedStatement.setBoolean(5,true);
                preparedStatement.setBoolean(6,false);
                preparedStatement.setBoolean(7,false);
                System.out.println("Constractor");
            }
            else if(professionalCompany.getProftype().equals("land"))
            {
                preparedStatement.setBoolean(5,false);
                preparedStatement.setBoolean(6,true);
                preparedStatement.setBoolean(7,false);
                System.out.println("Lanscape");
            }
            else if(professionalCompany.getProftype().equals("cont_land"))
            {
                preparedStatement.setBoolean(5,true);
                preparedStatement.setBoolean(6,true);
                preparedStatement.setBoolean(7,false);
                System.out.println("Constractor and Lanscape");
            }
            else if(professionalCompany.getProftype().equals("product"))
            {
                preparedStatement.setBoolean(5,false);
                preparedStatement.setBoolean(6,false);
                preparedStatement.setBoolean(7,true);
                System.out.println("product");
            }
            row+=preparedStatement.executeUpdate();

        }catch (SQLException throwables){
            throwables.printStackTrace();
        }

        if(row!=0){
            status=true;
        }
        return status;
    }
}
