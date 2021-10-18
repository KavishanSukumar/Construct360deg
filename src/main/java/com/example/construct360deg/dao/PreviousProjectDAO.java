package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.PreviousProject;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

public class PreviousProjectDAO {
    public void uploadPreviousProject(PreviousProject previousProject) throws SQLException {
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String projectid=previousProject.getProjectid();
        int row=0;
        String sql1="INSERT INTO `previousprojectdone`(`userid`, `projectid`) VALUES (?,?)";
        String sql2="INSERT INTO `preprojectimage`(`projectid`, `image`) VALUES (?,?)";
        String sql3="INSERT INTO `previousproject`(`projectid`, `customerfeedback`, `province`, `district`, `city`, `street`, `houseno`, `noofstars`) VALUES (?,?,?,?,?,?,?,?)";
        String sql4="INSERT INTO `previousprojectcontno`(`projectid`, `referancecontactno`, `referenceemail`, `referencename`) VALUES (?,?,?,?)";

        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setInt(1,previousProject.getUserid());
        preparedStatement.setString(2,projectid);
        row=+preparedStatement.executeUpdate();

        preparedStatement=connection.prepareStatement(sql2);
        preparedStatement.setString(1,projectid);
        preparedStatement.setBlob(2,previousProject.getImage());
        row+=preparedStatement.executeUpdate();


        preparedStatement=connection.prepareStatement(sql3);
        preparedStatement.setString(1,projectid);
        preparedStatement.setString(2,previousProject.getCustomerfeedback());
        preparedStatement.setString(3,previousProject.getProvince());
        preparedStatement.setString(4,previousProject.getDistrict());
        preparedStatement.setString(5,previousProject.getCity());
        preparedStatement.setString(6,previousProject.getStreet());
        preparedStatement.setString(7,previousProject.getHouseno());
        preparedStatement.setInt(8,previousProject.getNoofstars());
        row+=preparedStatement.executeUpdate();

        preparedStatement=connection.prepareStatement(sql4);
        preparedStatement.setString(1,projectid);
        preparedStatement.setString(2,previousProject.getReferancecontactno());
        preparedStatement.setString(3,previousProject.getReferenceemail());
        preparedStatement.setString(4,previousProject.getReferencename());
        row+=preparedStatement.executeUpdate();
        if (row>=4){
            System.out.println("All queries successfully updated");
        }
    }
}
