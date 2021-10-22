package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.PreviousProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViewUploadProjectDAO {
    public ArrayList<PreviousProject> getProjectDetails() throws SQLException {
        ArrayList<PreviousProject> projects = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        Connection connection = Database.getConnection();
        String sql1 = "SELECT * FROM `previousprojectdone`";
        String sql2 = "SELECT * FROM `preprojectimage`";
        String sql3 = "SELECT * FROM `previousproject`";
        String sql4 = "SELECT * FROM `previousprojectcontno`";

        ResultSet resultSet = null;

        preparedStatement = connection.prepareStatement(sql1);
        resultSet = preparedStatement.executeQuery();

        preparedStatement = connection.prepareStatement(sql2);
        resultSet = preparedStatement.executeQuery();

        preparedStatement = connection.prepareStatement(sql3);
        resultSet = preparedStatement.executeQuery();

        preparedStatement = connection.prepareStatement(sql4);
        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            PreviousProject PreviousProject = new PreviousProject();
            PreviousProject.setProjectid(resultSet.getString("projectid"));
            PreviousProject.setUserid(resultSet.getInt("userid"));
            PreviousProject.setCustomerfeedback(resultSet.getString("customerfeedback"));
            PreviousProject.setProvince(resultSet.getString("province"));
            PreviousProject.setDistrict(resultSet.getString("district"));
            PreviousProject.setCity(resultSet.getString("city"));
            PreviousProject.setStreet(resultSet.getString("street"));
            PreviousProject.setHouseno(resultSet.getString("houseno"));
            PreviousProject.setNoofstars(resultSet.getInt("noofstars"));
            PreviousProject.setImageid(resultSet.getInt("imageid"));
            byte[] bytes = resultSet.getBytes("image");
            PreviousProject.setImgBytes(bytes);
            PreviousProject.setReferancecontactno(resultSet.getString("referancecontactno"));
            PreviousProject.setReferenceemail(resultSet.getString("referenceemail"));
            PreviousProject.setReferencename(resultSet.getString("referencename"));
            projects.add(PreviousProject);
        }
        return projects;
    }
}
