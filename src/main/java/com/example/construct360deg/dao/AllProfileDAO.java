package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.AllUsers;

import javax.servlet.ServletOutputStream;
import java.sql.*;
import java.util.ArrayList;

public class AllProfileDAO {
    public ArrayList<AllUsers> getUserdetails() throws SQLException {
        ArrayList<AllUsers> allUsers=new ArrayList<>();
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="SELECT * FROM alluserview";
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
}
