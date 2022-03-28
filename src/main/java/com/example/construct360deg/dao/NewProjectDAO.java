package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Payment;
import com.example.construct360deg.model.Project;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class NewProjectDAO {
    public boolean addProject(Project project, int reqid, int proposalid, int cusid, int profid) throws SQLException {
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        int projectid=0;
        String sql2=null;
//        String sql = "INSERT INTO `addproject`(`newproject`) VALUES (?)";
//        String sql = "INSERT INTO `project`(`projectname`,`reqid`,`proposalid`,`cusid`,`profid`) VALUES (?,?,?,?,?)";
//        String sql = "INSERT INTO `project`(`profid`, `projectname`, `contractor`, `landscape`, `customer`, `address`, `starttime`, `finishtime`, `proposalid`, `reqid`, `cusid`) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

        String sql1="SELECT `projectid`  FROM `project` WHERE `proposalid`=?";
        preparedStatement=connection.prepareStatement(sql1);
        preparedStatement.setInt(1,proposalid);
        ResultSet resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            projectid=resultSet.getInt("projectid");
        }
        if (projectid!=0){

            sql2="UPDATE `project` SET `profid`=?,`projectname`=?,`contractor`=?,`landscape`=?,`customer`=?,`address`=?,`starttime`=?,`finishtime`=?,`reqid`=?,`cusid`=? WHERE `projectid`=?";
            preparedStatement = connection.prepareStatement(sql2);
            preparedStatement.setInt(1,profid);
            preparedStatement.setString(2,project.getProjectname());
            preparedStatement.setString(3,project.getContractor());
            preparedStatement.setString(4,project.getLandscape());
            preparedStatement.setString(5,project.getCustomer());
            preparedStatement.setString(6,project.getAddress());
            preparedStatement.setString(7,project.getStarttime());
            preparedStatement.setString(8,project.getFinishtime());
            preparedStatement.setInt(9,reqid);
            preparedStatement.setInt(10,cusid);
        preparedStatement.setInt(11,projectid);
//            preparedStatement.setInt(11,proposalid);

        }else {
            sql2="INSERT INTO `project`(`profid`, `projectname`, `contractor`, `landscape`, `customer`, `address`, `starttime`, `finishtime`, `reqid`, `cusid`, `proposalid`) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
            preparedStatement = connection.prepareStatement(sql2);
            preparedStatement.setInt(1,profid);
            preparedStatement.setString(2,project.getProjectname());
            preparedStatement.setString(3,project.getContractor());
            preparedStatement.setString(4,project.getLandscape());
            preparedStatement.setString(5,project.getCustomer());
            preparedStatement.setString(6,project.getAddress());
            preparedStatement.setString(7,project.getStarttime());
            preparedStatement.setString(8,project.getFinishtime());
            preparedStatement.setInt(9,reqid);
            preparedStatement.setInt(10,cusid);
//        preparedStatement.setInt(11,projectid);
            preparedStatement.setInt(11,proposalid);
        }
        int row =0;
        row = preparedStatement.executeUpdate();
         if (row>0){
             return true;
         }else{
             return false;
         }
    }
// this is for professionals ///////////////////////////////

    public ArrayList<Project> viewProjects(int profid) throws SQLException {
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
            project.setIsclosed(resultSet.getInt("isclosed"));
            newprojects.add(project);
        }
        return newprojects;

    }
/////////////// thus is for customers /////////////////////////////

    public ArrayList<Project> viewProject(int projectid) throws SQLException {
        ArrayList<Project> newprojects = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql ="SELECT * FROM `project` where projectid=?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,projectid);
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
            project.setUserid(resultSet.getInt("cusid"));
            project.setIsclosed(resultSet.getInt("isclosed"));
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

    public boolean addField( int proposalid, String fieldname, int fieldval) throws SQLException {
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        int row=0;
        int projectid=0;
        ResultSet resultSet=null;
        String sql=null;
        String sql1=null;
        String sql2=null;
        String sql3=null;


        sql="SELECT `projectid`  FROM `project` WHERE `proposalid`=?";
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,proposalid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            projectid=resultSet.getInt("projectid");
        }

        if (projectid==0){
            sql1="INSERT INTO `project`(`proposalid`) VALUES (?)";
            preparedStatement=connection.prepareStatement(sql1);
            preparedStatement.setInt(1,proposalid);
            preparedStatement.executeUpdate();

            sql2="SELECT `projectid`  FROM `project` WHERE `proposalid`=?";
            preparedStatement=connection.prepareStatement(sql2);
            preparedStatement.setInt(1,proposalid);
            resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                projectid=resultSet.getInt("projectid");
            }
        }

        sql3="INSERT INTO `proposedgraph`(`projectid`, `graphpoint`, `graphattribute`) VALUES (?,?,?)";
        preparedStatement=connection.prepareStatement(sql3);
        preparedStatement.setInt(1,projectid);
        preparedStatement.setInt(2,fieldval);
        preparedStatement.setString(3,fieldname);
        row=preparedStatement.executeUpdate();

        String sql4="INSERT INTO `ongoinggraph`(`projectid`, `graphpoint`, `graphattribute`) VALUES (?,?,?)";
        preparedStatement=connection.prepareStatement(sql4);
        preparedStatement.setInt(1,projectid);
        preparedStatement.setInt(2,0);
        preparedStatement.setString(3,fieldname);
        row+=preparedStatement.executeUpdate();
        if (row>0){
            return  true;
        }else {
            return  false;
        }
    }


}
