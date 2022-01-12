package com.example.construct360deg.dao;
import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Account;
import com.example.construct360deg.model.Viewprofile;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ViewProfileDAO {
    public static void SaveSummary(String task, String summaryText, int userid) throws SQLException {
        Connection connection = Database.getConnection();
        String sql = "INSERT INTO `userdetails`(`userid`, `type`, `data`) VALUES (?,?,?)";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userid);
        preparedStatement.setString(2, task);
        preparedStatement.setString(3, summaryText);
        preparedStatement.executeUpdate();
        System.out.println("test me");
    }


    public ArrayList<Viewprofile> displaySummary(int userid) throws SQLException {
        ArrayList<Viewprofile> addsummary = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        Connection connection = Database.getConnection();
        String sql = "SELECT * FROM `userdetails` WHERE userid = ? AND type = 'summary'";
        ResultSet resultSet = null;

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, userid);
        resultSet = preparedStatement.executeQuery();


        while (resultSet.next()) {
            Viewprofile viewprofile = new Viewprofile();
            viewprofile.setUserid(userid);
            viewprofile.setSummaryText(resultSet.getString("data"));
            viewprofile.setTask(resultSet.getString("type"));

            addsummary.add(viewprofile);
        }
        return addsummary;

    }

    //Profil pic change
    public boolean addImage(Account account) throws SQLException {
        boolean status = false;
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        int row = 0;
        if (account.getUserrole().equals("prof_indiv") || account.getUserrole().equals("prof_com")) {
            String sql = "UPDATE `users` SET `profilepic`=? WHERE userid=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBlob(1, account.getProfilepic());
            preparedStatement.setInt(2, account.getUserid());
            row = preparedStatement.executeUpdate();
        } else if (account.getUserrole().equals("cus_indiv") || account.getUserrole().equals("cus_com")) {
            String sql = "UPDATE `users` SET `profilepic`=? WHERE userid=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBlob(1, account.getProfilepic());
            preparedStatement.setInt(2, account.getUserid());
            row = preparedStatement.executeUpdate();
        } else if (account.getUserrole().equals("prod_com") || account.getUserrole().equals("admin")) {
            String sql = "UPDATE `users` SET `profilepic`=? WHERE userid=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBlob(1, account.getProfilepic());
            preparedStatement.setInt(2, account.getUserid());
            row = preparedStatement.executeUpdate();
        }
        if (row > 0) {
            status = true;
        }
        return status;
    }

    public Account viewImage(int userid, String userrole) throws SQLException {
        Account account = new Account();
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        if (userrole.equals("prof_indiv") || userrole.equals("prof_com")) {
            String sql = "SELECT * FROM `users` WHERE userid=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userid);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                account.setUserid(resultSet.getInt("userid"));
                byte[] bytes = resultSet.getBytes("profilepic");
                account.setImgBytes(bytes);
            }
        } else if (userrole.equals("cus_indiv") || userrole.equals("cus_com")) {
            String sql = "SELECT * FROM `users` WHERE userid=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userid);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                account.setUserid(resultSet.getInt("userid"));
                byte[] bytes = resultSet.getBytes("profilepic");
                account.setImgBytes(bytes);
            }
        }else if(userrole.equals("prod_com") || userrole.equals("admin")){
            String sql = "SELECT * FROM `users` WHERE userid=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userid);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                account.setUserid(resultSet.getInt("userid"));
                byte[] bytes = resultSet.getBytes("profilepic");
                account.setImgBytes(bytes);
            }
        }
        return account;
    }
}
//    public boolean deleteImage(int userid) throws SQLException {
//        boolean status= false;
//        Connection connection = Database.getConnection();
//        PreparedStatement preparedStatement = null;
//        String sql = "DELETE FROM `users` WHERE userid=?";
//        int row = 0;
//        preparedStatement = connection.prepareStatement(sql);
//        preparedStatement.setInt(1,userid);
//        row = preparedStatement.executeUpdate();
//        if (row>0){
//            return true;
//        }
//        return status;
//    }

