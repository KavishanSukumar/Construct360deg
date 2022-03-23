package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Project;

import java.sql.*;
import java.util.ArrayList;

public class NewProjectDAO {
    public boolean addProject(Project project, int reqid, int proposalid, int cusid, int profid) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
//        String sql = "INSERT INTO `addproject`(`newproject`) VALUES (?)";
//        String sql = "INSERT INTO `project`(`projectname`,`reqid`,`proposalid`,`cusid`,`profid`) VALUES (?,?,?,?,?)";
        String sql = "INSERT INTO `project`(`profid`, `projectname`, `contractor`, `landscape`, `customer`, `address`, `starttime`, `finishtime`, `proposalid`, `reqid`, `cusid`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        preparedStatement = connection.prepareStatement(sql);
        int row =0;

        preparedStatement.setInt(1,profid);
        preparedStatement.setString(2,project.getProjectname());
        preparedStatement.setString(3,project.getContractor());
        preparedStatement.setString(4,project.getLandscape());
        preparedStatement.setString(5,project.getCustomer());
        preparedStatement.setString(6,project.getAddress());
        preparedStatement.setString(7,project.getStarttime());
        preparedStatement.setString(8,project.getFinishtime());
//        preparedStatement.setDate(7, Date.valueOf(project.getStarttime()));
//        preparedStatement.setDate(8, Date.valueOf(project.getFinishtime()));
        preparedStatement.setInt(9,proposalid);
        preparedStatement.setInt(10,reqid);
        preparedStatement.setInt(11,cusid);
        row = preparedStatement.executeUpdate();
         if (row>0){
             return true;
         }else{
             return false;
         }
    }
// this is for professionals ///////////////////////////////

    public ArrayList<Project> viewProject(int profid) throws SQLException {
        ArrayList<Project> newprojects = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql ="SELECT * FROM `project` where profid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,profid);
//        preparedStatement.setInt(1,projectid);
        ResultSet resultSet = null;
        resultSet= preparedStatement.executeQuery();

        while (resultSet.next()){
            Project project = new Project();
            project.setProjectname(resultSet.getString("projectname"));
            project.setContractor(resultSet.getString("contractor"));
            project.setLandscape(resultSet.getString("landscape"));
            project.setCustomer(resultSet.getString("customer"));
            project.setAddress(resultSet.getString("address"));
            project.setStarttime(resultSet.getString("starttime"));
            project.setFinishtime(resultSet.getString("finishtime"));
            project.setCusaccept(resultSet.getByte("cus_accept"));
            project.setProjectid(resultSet.getInt("projectid"));
            newprojects.add(project);
        }
        return newprojects;

    }
/////////////// thus is for customers /////////////////////////////

    public ArrayList<Project> viewProjectcus(int cusid) throws SQLException {
        ArrayList<Project> newprojects = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql ="SELECT * FROM `project` where cusid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,cusid);
//        preparedStatement.setInt(1,projectid);
        ResultSet resultSet = null;
        resultSet= preparedStatement.executeQuery();

        while (resultSet.next()){
            Project project = new Project();
            project.setProjectname(resultSet.getString("projectname"));
            project.setContractor(resultSet.getString("contractor"));
            project.setLandscape(resultSet.getString("landscape"));
            project.setCustomer(resultSet.getString("customer"));
            project.setAddress(resultSet.getString("address"));
            project.setStarttime(resultSet.getString("starttime"));
            project.setFinishtime(resultSet.getString("finishtime"));
            project.setCusaccept(resultSet.getByte("cus_accept"));
            project.setProjectid(resultSet.getInt("projectid"));
            newprojects.add(project);
        }
        return newprojects;

    }
    public boolean customerAcceptProject(int projectid) throws SQLException{
        int row = 0;

        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql ="UPDATE `project` set cus_accept=1   where projectid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,projectid);
        row = preparedStatement.executeUpdate();
        if(row>0){
            return true;
        }else{
            return false;
        }
    }
}
