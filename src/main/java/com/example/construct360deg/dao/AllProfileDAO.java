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
             allUsers1.setCustcompanyname(resultSet.getString("custcompanyname"));
             allUsers1.setCusfullname(resultSet.getString("cusfullname"));
             allUsers1.setComlandflag(resultSet.getBoolean("comlandflag"));
             allUsers1.setComcontractflag(resultSet.getBoolean("comcontractflag"));
             allUsers1.setProductcompflag(resultSet.getBoolean("productcompflag"));
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
            allUsers1.setComlandflag(resultSet.getBoolean("comlandflag"));
            allUsers1.setComcontractflag(resultSet.getBoolean("comcontractflag"));
            allUsers1.setIndivlandflag(resultSet.getBoolean("indivlandflag"));
            allUsers1.setIndivcontractflag(resultSet.getBoolean("indivcontractflag"));
            allUsers.add(allUsers1);
        }

        return allUsers;
    }
}
