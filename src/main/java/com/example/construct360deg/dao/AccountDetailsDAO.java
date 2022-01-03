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
            boolean status = false;
            Connection connection = Database.getConnection();
            PreparedStatement preparedStatement = null;
            int row = 0;
//            String sql = "UPDATE `account` SET `firstname`=?,`lastname`=?,`bio`=?,`nic`=?,`email`=?,`address`=?,`contactnum`=? WHERE userid=?";
            String sql1 = "UPDATE `individualprof` SET `firstname`=?,`lastname`=?,`nic`=? WHERE userid=?";
            String sql2 = "UPDATE `users` SET `province`=?,`district`=?,`city`=?,`street`=?,`houseno`=? WHERE userid=?";
            String sql3 = "UPDATE `usercontactno` SET `contactno`=?,`email`=? WHERE userid=?";

            preparedStatement = connection.prepareStatement(sql1);

            preparedStatement.setString(1,account.getFirstname());
            preparedStatement.setString(2,account.getLastname());
            preparedStatement.setString(3,account.getNic());
            preparedStatement.setInt(4,account.getUserid());
            row=+preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement(sql2);
            preparedStatement.setString(5,account.getHouseno());
            preparedStatement.setString(4,account.getStreet());
            preparedStatement.setString(3,account.getCity());
            preparedStatement.setString(2,account.getDistrict());
            preparedStatement.setString(1,account.getProvince());
            preparedStatement.setInt(6,account.getUserid());
            row+=preparedStatement.executeUpdate();

            preparedStatement = connection.prepareStatement(sql3);
            preparedStatement.setString(2,account.getEmail());
            preparedStatement.setString(1,account.getContactno());
            preparedStatement.setInt(3,account.getUserid());
            row+=preparedStatement.executeUpdate();

            System.out.println("Chathuri priyangika");

            if (row>=3){
                status=true;
                System.out.println("All queries successfully updated");
            }
            return status;
        }

        public Account retriveDetails(int userid) throws SQLException {
//            ArrayList<Account> accounts = new ArrayList<>();
            Account account = new Account();
            Connection connection = Database.getConnection();
            String sql1 = "SELECT * FROM `individualprof`WHERE userid=?";
            String sql2 = "SELECT * FROM `users` WHERE userid= ?";
            String sql3 = "SELECT * FROM `usercontactno` WHERE userid = ?";
            PreparedStatement preparedStatement = null;
            ResultSet resultSet =null;

            preparedStatement= connection.prepareStatement(sql1);
            preparedStatement.setInt(1,userid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                account.setFirstname(resultSet.getString("firstname"));
                account.setLastname(resultSet.getString("lastname"));
                account.setNic(resultSet.getString("nic"));
            }

            preparedStatement= connection.prepareStatement(sql2);
            preparedStatement.setInt(1,userid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                account.setHouseno(resultSet.getString("houseno"));
                account.setStreet(resultSet.getString("street"));
                account.setCity(resultSet.getString("city"));
                account.setDistrict(resultSet.getString("district"));
                account.setProvince(resultSet.getString("province"));
            }
            preparedStatement= connection.prepareStatement(sql3);
            preparedStatement.setInt(1,userid);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                account.setEmail(resultSet.getString("email"));
                account.setContactno(resultSet.getString("contactno"));
                account.setUserid(resultSet.getInt("userid"));
            }
            return account;
        }
}
