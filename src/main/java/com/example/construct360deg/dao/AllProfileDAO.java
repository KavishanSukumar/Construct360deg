package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.AllUsers;

import javax.servlet.ServletOutputStream;
import java.sql.*;
import java.util.ArrayList;

public class AllProfileDAO {
    public ArrayList<AllUsers> getUserdetails(String searchval) throws SQLException {
        ArrayList<AllUsers> allUsers=new ArrayList<>();
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String pattern = searchval;
        String sql = null;
        System.out.println(pattern);
        if(pattern==null || pattern=="" ){
            sql="SELECT * FROM alluserview";
        }else{
            sql="SELECT * FROM alluserview WHERE  profcompanyname like '%"+pattern+"%' OR  Proffullname like '%"+pattern+"%' OR  productcomname like '%"+pattern+"%' OR  cuscompanyname like '%"+pattern+"%' OR  cusindfullname like '%"+pattern+"%' ";
        }



        ResultSet resultSet;
        ServletOutputStream servletOutputStream=null;
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            AllUsers allUsers1=new AllUsers();
             allUsers1.setUserid(resultSet.getInt("userid"));
             //allUsers1.setProfilepic();
             byte[] bytes=resultSet.getBytes("profilepic");
             allUsers1.setImgbytes(bytes);
             allUsers1.setProfcompanyname(resultSet.getString("profcompanyname"));
             allUsers1.setProffullname(resultSet.getString("Proffullname"));
             allUsers1.setCuscompanyname(resultSet.getString("cuscompanyname"));
             allUsers1.setCusindfullname(resultSet.getString("cusindfullname"));
             allUsers1.setComlandflag(resultSet.getBoolean("comlandflag"));
             allUsers1.setComcontractflag(resultSet.getBoolean("comcontractflag"));
             allUsers1.setProductcomname(resultSet.getString("productcomname"));
             allUsers1.setIndivlandflag(resultSet.getBoolean("indivlandflag"));
             allUsers1.setIndivcontractflag(resultSet.getBoolean("indivcontractflag"));
             allUsers.add(allUsers1);
        }

        return allUsers;
    }
    public ArrayList<AllUsers> getAllProfessionals() throws SQLException {
            ArrayList<AllUsers> allUsers=new ArrayList<>();
            Connection connection= Database.getConnection();
            PreparedStatement preparedStatement=null;
            String sql="SELECT * FROM allcomview";
            ResultSet resultSet;
            preparedStatement=connection.prepareStatement(sql);
            resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                AllUsers allUsers1=new AllUsers();
                allUsers1.setUserid(resultSet.getInt("userid"));
                byte[] bytes=resultSet.getBytes("profilepic");
                allUsers1.setImgbytes(bytes);
                allUsers1.setProfcompanyname(resultSet.getString("profcompanyname"));
                allUsers1.setComlandflag(resultSet.getBoolean("comlandflag"));
                allUsers1.setComcontractflag(resultSet.getBoolean("comcontractflag"));
                allUsers.add(allUsers1);
            }
            String sql2="SELECT * FROM `allindivview`";
            preparedStatement=connection.prepareStatement(sql2);
            resultSet=preparedStatement.executeQuery();

            while (resultSet.next()){
                AllUsers allUsers1=new AllUsers();
                allUsers1.setUserid(resultSet.getInt("userid"));
                byte[] bytes=resultSet.getBytes("profilepic");
                allUsers1.setImgbytes(bytes);
                allUsers1.setProffullname(resultSet.getString("Proffullname"));
                allUsers1.setIndivlandflag(resultSet.getBoolean("indivlandflag"));
                allUsers1.setIndivcontractflag(resultSet.getBoolean("indivcontractflag"));
                allUsers.add(allUsers1);
            }

            return allUsers;
    }


    public ArrayList<AllUsers> getAllCustomers() throws SQLException {
        ArrayList<AllUsers> allUsers=new ArrayList<>();
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="SELECT * FROM allcuscompview";
        ResultSet resultSet;
        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            AllUsers allUsers1=new AllUsers();
            allUsers1.setUserid(resultSet.getInt("userid"));
            byte[] bytes=resultSet.getBytes("profilepic");
            allUsers1.setImgbytes(bytes);
            allUsers1.setCuscompanyname(resultSet.getString("companyname"));
            allUsers1.setCustomercomflag(true);
            allUsers.add(allUsers1);
        }
        String sql2="SELECT * FROM `allcusindivview`";
        preparedStatement=connection.prepareStatement(sql2);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            AllUsers allUsers1=new AllUsers();
            allUsers1.setUserid(resultSet.getInt("userid"));
            byte[] bytes=resultSet.getBytes("profilepic");
            allUsers1.setImgbytes(bytes);
            allUsers1.setCustomerindivflag(true);
            allUsers1.setCusindfullname(resultSet.getString("customerindivname"));
            allUsers.add(allUsers1);
        }

        return allUsers;
    }
    public AllUsers getuser(int userid) throws SQLException {
        AllUsers user=new AllUsers();
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="SELECT * FROM alluserview WHERE userid=?";
        ResultSet resultSet=null;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            user.setUserid(userid);
            user.setProfcompanyname(resultSet.getString("profcompanyname"));
            user.setProffullname(resultSet.getString("Proffullname"));
            user.setProductcomname(resultSet.getString("productcomname"));
            user.setCuscompanyname(resultSet.getString("cuscompanyname"));
            user.setCusindfullname(resultSet.getString("cusindfullname"));
            user.setProvince(resultSet.getString("province"));
            user.setDistrict(resultSet.getString("district"));
            user.setCity(resultSet.getString("city"));
            user.setStreet(resultSet.getString("street"));
            user.setHouseno(resultSet.getString("houseno"));
            user.setContactnum(resultSet.getString("contactno"));
            user.setEmail(resultSet.getString("email"));
        }
        return user;
    }
}
