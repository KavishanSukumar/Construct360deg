package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Advertise;
import com.example.construct360deg.model.Requirement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RequirementDAO {
    public void uploadRequirement(Requirement requirement) throws SQLException {

        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="INSERT INTO `requirement`( `useridcus`, `reqname`,`description`, `type`, `contactnum`, `requirementfile`, `street`, `city`, `district`, `province`,`submit_date`,`submit_time`,`filename`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        int row;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,requirement.getUseridcus());
        preparedStatement.setString(2,requirement.getReqname());
        preparedStatement.setString(3,requirement.getDescription());
        preparedStatement.setString(4,requirement.getType());
        preparedStatement.setString(5,requirement.getContactnum());
        preparedStatement.setBlob(6,requirement.getRequirementstream());
        preparedStatement.setString(7,requirement.getStreet());
        preparedStatement.setString(8,requirement.getCity());
        preparedStatement.setString(9,requirement.getDistrict());
        preparedStatement.setString(10,requirement.getProvince());
        preparedStatement.setDate(11,requirement.getReq_upload_date());
        preparedStatement.setTime(12,requirement.getReq_upload_time());
        preparedStatement.setString(13, requirement.getFilename());
        row=preparedStatement.executeUpdate();
        if (row>=1){
            status=true;
            System.out.println("All queries successfully updated");
        }else{
            status=false;
            System.out.println("Error");
        }

    }

    public void uploadRequirementToChooseProf(int reqid,int profid,int cusid) throws SQLException {
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="INSERT INTO `professionalprivatereq` (`reqid`, `profid`, `cusid`) VALUES (?,?,?)";
        int row = 0;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,reqid);
        preparedStatement.setInt(2,profid);
        preparedStatement.setInt(3,cusid);
        row=preparedStatement.executeUpdate();
        if (row>=1){

            System.out.println("uploadRequirementToChooseProf method in requirementDAO All queries successfully updated");
        }else{

            System.out.println("Error in uploadRequirementToChooseProf method in requirementDAO");
        }

    }

    public ArrayList<Requirement> displayownRequirement(int useridcus) throws SQLException {
        ArrayList<Requirement> displayRequirements = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `requirement` WHERE `useridcus` = ? ORDER BY `submit_date` DESC";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,useridcus);
        resultSet = preparedStatement.executeQuery();
        System.out.println("displayRequirement");
        while (resultSet.next()) {
            Requirement displayRequirement = new Requirement();
            displayRequirement.setRequirementid(resultSet.getInt("requirementid"));
            displayRequirement.setUseridcus(resultSet.getInt("useridcus"));
            displayRequirement.setReqname(resultSet.getString("reqname"));
            displayRequirement.setDescription(resultSet.getString("description"));
            displayRequirement.setContactnum(resultSet.getString("contactnum"));
            displayRequirement.setFilename(resultSet.getString("filename"));
            displayRequirement.setStreet(resultSet.getString("street"));
            displayRequirement.setCity(resultSet.getString("city"));
            displayRequirement.setDistrict(resultSet.getString("district"));
            displayRequirement.setProvince(resultSet.getString("province"));
            displayRequirement.setReq_upload_date(resultSet.getDate("submit_date"));
            displayRequirement.setReq_upload_time(resultSet.getTime("submit_time"));
            displayRequirement.setType(resultSet.getString("type"));
            displayRequirement.setDisplay_on_prof(resultSet.getInt("display_on_prof"));
            byte[] requirementfile = resultSet.getBytes("requirementfile");
            displayRequirement.setRequirementfile(requirementfile);

            displayRequirements.add(displayRequirement);
        }
        System.out.println("displayRequirement 2");
        return displayRequirements;
    }
/////////////  this is for professional purpose////////////////////////////////////////////////////////
    public ArrayList<Requirement> displayRequirement() throws SQLException {
        ArrayList<Requirement> displayRequirements = new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = "SELECT * FROM `requirement` ORDER BY `submit_date` DESC";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        System.out.println("displayRequirement");
        while (resultSet.next()) {
            Requirement displayRequirement = new Requirement();
            displayRequirement.setRequirementid(resultSet.getInt("requirementid"));
            displayRequirement.setUseridcus(resultSet.getInt("useridcus"));
            displayRequirement.setReqname(resultSet.getString("reqname"));
            displayRequirement.setDescription(resultSet.getString("description"));
            displayRequirement.setContactnum(resultSet.getString("contactnum"));
            displayRequirement.setFilename(resultSet.getString("filename"));
            displayRequirement.setStreet(resultSet.getString("street"));
            displayRequirement.setCity(resultSet.getString("city"));
            displayRequirement.setDistrict(resultSet.getString("district"));
            displayRequirement.setProvince(resultSet.getString("province"));
            displayRequirement.setReq_upload_date(resultSet.getDate("submit_date"));
            displayRequirement.setReq_upload_time(resultSet.getTime("submit_time"));
            displayRequirement.setType(resultSet.getString("type"));
            displayRequirement.setDisplay_on_prof(resultSet.getInt("display_on_prof"));
            byte[] requirementfile = resultSet.getBytes("requirementfile");
            displayRequirement.setRequirementfile(requirementfile);

            displayRequirements.add(displayRequirement);
        }
        System.out.println("displayRequirement 2");
        return displayRequirements;
    }
    /////////////  this is for professional purpose////////////////////////////////////////////////////////








    public void display_req_in_prof(int reqid, int dis_on_prof) throws SQLException{

        Connection connection = Database.getConnection();
        String sql="UPDATE `requirement` SET `display_on_prof`=? WHERE requirementid =?";
        PreparedStatement preparedStatement = null;
        preparedStatement=connection.prepareStatement(sql);

        preparedStatement.setInt(1,dis_on_prof);
        preparedStatement.setInt(2,reqid);
        preparedStatement.executeUpdate();
    }


    public  ArrayList<Requirement> display_cus_in_prof_public() throws SQLException{
        ArrayList<Requirement> displayReqonpublic= new ArrayList<>();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        String sql = null;
        sql="SELECT * FROM `allpublicreq`";
        ResultSet resultSet = null;
        preparedStatement = connection.prepareStatement(sql);
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Requirement displayRequirementonpublic = new Requirement();
            displayRequirementonpublic.setUseridcus(resultSet.getInt("cusid"));
            displayRequirementonpublic.setCusname(resultSet.getString("username"));
            byte [] cusprofimg = resultSet.getBytes("profilepic");
            displayRequirementonpublic.setCusprofimg(cusprofimg);
            displayReqonpublic.add(displayRequirementonpublic);
        }
        return displayReqonpublic;
    }
}





