package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.CustomerIndividual;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RegistrationDAO {
    public boolean customerIndividualRegistration(CustomerIndividual customerIndividual){
//        String insertqueryusertable="INSERT INTO customerindividualview" +
//                "  (profilepic,province,district,city,street,houseno,firstname,lastname,addressproof,nic,nicsoftcopy,dob,username,password) VALUES " +
//                " (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        String insertqueryusertable="INSERT INTO customerindividualview" +
                "  (province,district,city,street,houseno,firstname,lastname,nic,username,password) VALUES " +
                " (?,?,?,?,?,?,?,?,?,?);";
        boolean status=false;
        Connection connection =Database.getConnection();
        PreparedStatement statement;

        try {
            statement=connection.prepareStatement(insertqueryusertable);
            //statement.setBinaryStream(1,customerIndividual.getProfilepic());
            statement.setString(1,customerIndividual.getProvince());
            statement.setString(2,customerIndividual.getDistrict());
            statement.setString(3,customerIndividual.getCity());
            statement.setString(4,customerIndividual.getStreet());
            statement.setString(5,customerIndividual.getHouseno());
            statement.setString(6,customerIndividual.getFirstname());
            statement.setString(7,customerIndividual.getLastname());
            //statement.setBinaryStream(9,customerIndividual.getAddressproof());
            statement.setLong(8,customerIndividual.getNic());
            //statement.setBinaryStream(11,customerIndividual.getNicsoft());
            //statement.setDate(12,customerIndividual.getDob());
            statement.setString(9,customerIndividual.getUsername());
            statement.setString(10,customerIndividual.getPassword());
            ResultSet resultSet=statement.executeQuery();
            status=resultSet.next();

        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return status;
    }
}
