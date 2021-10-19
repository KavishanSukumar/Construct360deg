package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Requirement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RequirementDAO {
    public void uploadRequirement(Requirement requirement) throws SQLException {
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="INSERT INTO `requirement`( `useridcus`, `description`, `type`, `contactnum`, `requirementfile`, `street`, `city`, `district`, `province`) VALUES (?,?,?,?,?,?,?,?,?)";
        int row;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,requirement.getUseridcus());
        preparedStatement.setString(2,requirement.getDescription());
        preparedStatement.setString(3,requirement.getType());
        preparedStatement.setString(4,requirement.getContactnum());
        preparedStatement.setBlob(5,requirement.getRequirementstream());
        preparedStatement.setString(6,requirement.getStreet());
        preparedStatement.setString(7,requirement.getCity());
        preparedStatement.setString(8,requirement.getDistrict());
        preparedStatement.setString(9,requirement.getProvince());
        row=preparedStatement.executeUpdate();

    }
}
