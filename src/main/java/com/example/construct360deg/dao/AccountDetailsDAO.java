package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AccountDetailsDAO {
        public boolean addDetails(Account account) throws SQLException {
            Connection connection = Database.getConnection();
            String sql = "UPDATE `account` SET `firstname`=?,`lastname`=?,`bio`=?,`nic`=?,`email`=?,`address`=?,`contactnum`=? WHERE userid=?";
            PreparedStatement preparedStatement = null;
            int row = 0;

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,account.getFirstname());
            preparedStatement.setString(2,account.getLastname());
            preparedStatement.setString(3,account.getBio());
            preparedStatement.setString(4,account.getNic());
            preparedStatement.setString(5,account.getEmail());
            preparedStatement.setString(6,account.getAddress());
            preparedStatement.setInt(7,account.getContactnum());
            preparedStatement.setInt(8,account.getUserid());
            row = preparedStatement.executeUpdate();

            System.out.println("Chathuri priyangika");

            if(row>0) {
                return true;
            }else {
                return false;
            }
        }

        public ArrayList<Account> retriveDetails() throws SQLException {
            ArrayList<Account> accounts = new ArrayList<>();
            Connection connection = Database.getConnection();
            String sql = "SELECT * FROM `account`";
            PreparedStatement preparedStatement = null;
            ResultSet resultSet =null;
            preparedStatement= connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                Account account = new Account();
                account.setUserid(resultSet.getInt("userid"));
                account.setFirstname(resultSet.getString("firstname"));
                account.setLastname(resultSet.getString("lastname"));
                account.setBio(resultSet.getString("bio"));
                account.setNic(resultSet.getString("nic"));
                account.setEmail(resultSet.getString("email"));
                account.setAddress(resultSet.getString("address"));
                account.setContactnum(resultSet.getInt("contactnum"));
                accounts.add(account);
            }
            return accounts;

        }
}
