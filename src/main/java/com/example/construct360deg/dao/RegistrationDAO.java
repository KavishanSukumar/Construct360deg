package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.CustomerIndividual;

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
//                String customer="INSERT INTO CustomerIndividual(`userid`, `firstname`, `lastname`, `addressproof`, `nic`, `nicsoftcopy`)" +
//                "VALUES(?,?,?,?,?,?)";
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
    public boolean customerCompanyRegistration(CustomerIndividual customerIndividual){
        boolean status=false;
        int row=0;




        if(row!=0){
            status=true;
        }
        return status;
    }
}
