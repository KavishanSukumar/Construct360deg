package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Account;

import javax.servlet.http.HttpSession;
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
            if (account.getUserrole().equals("prof_indiv") || account.getUserrole().equals("prof_com")) {
                String sql1 = "UPDATE `individualprof` SET `firstname`=?,`lastname`=?,`nic`=? WHERE userid=?";
                String sql2 = "UPDATE `users` SET `province`=?,`district`=?,`city`=?,`street`=?,`houseno`=? WHERE userid=?";
                String sql3 = "UPDATE `usercontactno` SET `contactno`=?,`email`=? WHERE userid=?";

                preparedStatement = connection.prepareStatement(sql1);
                preparedStatement.setString(1, account.getFirstname());
                preparedStatement.setString(2, account.getLastname());
                preparedStatement.setString(3, account.getNic());
                preparedStatement.setInt(4, account.getUserid());
                row = +preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setString(5, account.getHouseno());
                preparedStatement.setString(4, account.getStreet());
                preparedStatement.setString(3, account.getCity());
                preparedStatement.setString(2, account.getDistrict());
                preparedStatement.setString(1, account.getProvince());
                preparedStatement.setInt(6, account.getUserid());
                row += preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setString(2, account.getEmail());
                preparedStatement.setString(1, account.getContactno());
                preparedStatement.setInt(3, account.getUserid());
                row += preparedStatement.executeUpdate();

                System.out.println("Chathuri priyangika");

            }else if (account.getUserrole().equals("cus_indiv") || account.getUserrole().equals("cus_com")) {
                String sql1 = "UPDATE `customerindividual` SET `firstname`=?,`lastname`=?,`nic`=? WHERE userid=?";
                String sql2 = "UPDATE `users` SET `province`=?,`district`=?,`city`=?,`street`=?,`houseno`=? WHERE userid=?";
                String sql3 = "UPDATE `usercontactno` SET `contactno`=?,`email`=? WHERE userid=?";

                preparedStatement = connection.prepareStatement(sql1);
                preparedStatement.setString(1, account.getFirstname());
                preparedStatement.setString(2, account.getLastname());
                preparedStatement.setString(3, account.getNic());
                preparedStatement.setInt(4, account.getUserid());
                row = +preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setString(5, account.getHouseno());
                preparedStatement.setString(4, account.getStreet());
                preparedStatement.setString(3, account.getCity());
                preparedStatement.setString(2, account.getDistrict());
                preparedStatement.setString(1, account.getProvince());
                preparedStatement.setInt(6, account.getUserid());
                row += preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setString(2, account.getEmail());
                preparedStatement.setString(1, account.getContactno());
                preparedStatement.setInt(3, account.getUserid());
                row += preparedStatement.executeUpdate();

            }else if(account.getUserrole().equals("prod_com")){
                String sql1 = "UPDATE `productcompany` SET `companyname`=? WHERE userid=?";
                String sql2 = "UPDATE `users` SET `province`=?,`district`=?,`city`=?,`street`=?,`houseno`=? WHERE userid=?";
                String sql3 = "UPDATE `usercontactno` SET `contactno`=?,`email`=? WHERE userid=?";

                preparedStatement = connection.prepareStatement(sql1);
                preparedStatement.setString(1,account.getCompanyname());
                preparedStatement.setInt(2, account.getUserid());
                row = +preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setString(5, account.getHouseno());
                preparedStatement.setString(4, account.getStreet());
                preparedStatement.setString(3, account.getCity());
                preparedStatement.setString(2, account.getDistrict());
                preparedStatement.setString(1, account.getProvince());
                preparedStatement.setInt(6, account.getUserid());
                row += preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setString(2, account.getEmail());
                preparedStatement.setString(1, account.getContactno());
                preparedStatement.setInt(3, account.getUserid());
                row += preparedStatement.executeUpdate();

            }else if(account.getUserrole().equals("admin")){
//                String sql1 = "UPDATE `productcompany` SET `companyname`=? WHERE userid=?";
                String sql2 = "UPDATE `users` SET `province`=?,`district`=?,`city`=?,`street`=?,`houseno`=? WHERE userid=?";
                String sql3 = "UPDATE `usercontactno` SET `contactno`=?,`email`=? WHERE userid=?";

//                preparedStatement = connection.prepareStatement(sql1);
//                preparedStatement.setString(1,account.getCompanyname());
//                preparedStatement.setInt(2, account.getUserid());
//                row = +preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setString(5, account.getHouseno());
                preparedStatement.setString(4, account.getStreet());
                preparedStatement.setString(3, account.getCity());
                preparedStatement.setString(2, account.getDistrict());
                preparedStatement.setString(1, account.getProvince());
                preparedStatement.setInt(6, account.getUserid());
                row += preparedStatement.executeUpdate();

                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setString(2, account.getEmail());
                preparedStatement.setString(1, account.getContactno());
                preparedStatement.setInt(3, account.getUserid());
                row += preparedStatement.executeUpdate();
            }
                if (row >= 3) {
                    status = true;
                    System.out.println("All queries successfully updated-3");
                }
                return status;
        }

        public Account retriveDetails(int userid, String userrole) throws SQLException {
            Account account = new Account();
            Connection connection = Database.getConnection();
            PreparedStatement preparedStatement = null;
            ResultSet resultSet =null;

            if (userrole.equals("prof_indiv") || userrole.equals("prof_com")) {
                String sql1 = "SELECT * FROM `individualprof`WHERE userid=?";
                String sql2 = "SELECT * FROM `users` WHERE userid= ?";
                String sql3 = "SELECT * FROM `usercontactno` WHERE userid = ?";

                preparedStatement = connection.prepareStatement(sql1);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setFirstname(resultSet.getString("firstname"));
                    account.setLastname(resultSet.getString("lastname"));
                    account.setNic(resultSet.getString("nic"));
                }

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setHouseno(resultSet.getString("houseno"));
                    account.setStreet(resultSet.getString("street"));
                    account.setCity(resultSet.getString("city"));
                    account.setDistrict(resultSet.getString("district"));
                    account.setProvince(resultSet.getString("province"));
                }
                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setEmail(resultSet.getString("email"));
                    account.setContactno(resultSet.getString("contactno"));
                    account.setUserid(resultSet.getInt("userid"));
                }
            }else if (userrole.equals("cus_indiv") || userrole.equals("cus_com")) {
                String sql1 = "SELECT * FROM `customerindividual` WHERE userid=?";
                String sql2 = "SELECT * FROM `users` WHERE userid= ?";
                String sql3 = "SELECT * FROM `usercontactno` WHERE userid = ?";

                preparedStatement = connection.prepareStatement(sql1);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setFirstname(resultSet.getString("firstname"));
                    account.setLastname(resultSet.getString("lastname"));
                    account.setNic(resultSet.getString("nic"));
                }

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setHouseno(resultSet.getString("houseno"));
                    account.setStreet(resultSet.getString("street"));
                    account.setCity(resultSet.getString("city"));
                    account.setDistrict(resultSet.getString("district"));
                    account.setProvince(resultSet.getString("province"));
                }
                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setEmail(resultSet.getString("email"));
                    account.setContactno(resultSet.getString("contactno"));
                    account.setUserid(resultSet.getInt("userid"));
                }
            }else if(userrole.equals("prod_com")){
                String sql1 = "SELECT * FROM `productcompany` WHERE userid=?";
                String sql2 = "SELECT * FROM `users` WHERE userid= ?";
                String sql3 = "SELECT * FROM `usercontactno` WHERE userid = ?";

                preparedStatement = connection.prepareStatement(sql1);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setCompanyname(resultSet.getString("companyname"));
                }

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setHouseno(resultSet.getString("houseno"));
                    account.setStreet(resultSet.getString("street"));
                    account.setCity(resultSet.getString("city"));
                    account.setDistrict(resultSet.getString("district"));
                    account.setProvince(resultSet.getString("province"));
                }
                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setEmail(resultSet.getString("email"));
                    account.setContactno(resultSet.getString("contactno"));
                    account.setUserid(resultSet.getInt("userid"));
                }
            }else if(userrole.equals("admin")){
//                String sql1 = "SELECT * FROM `productcompany` WHERE userid=?";
                String sql2 = "SELECT * FROM `users` WHERE userid= ?";
                String sql3 = "SELECT * FROM `usercontactno` WHERE userid = ?";

//                preparedStatement = connection.prepareStatement(sql1);
//                preparedStatement.setInt(1, userid);
//                resultSet = preparedStatement.executeQuery();
//                while (resultSet.next()) {
//                    account.setCompanyname(resultSet.getString("companyname"));
//                }

                preparedStatement = connection.prepareStatement(sql2);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setHouseno(resultSet.getString("houseno"));
                    account.setStreet(resultSet.getString("street"));
                    account.setCity(resultSet.getString("city"));
                    account.setDistrict(resultSet.getString("district"));
                    account.setProvince(resultSet.getString("province"));
                }
                preparedStatement = connection.prepareStatement(sql3);
                preparedStatement.setInt(1, userid);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    account.setEmail(resultSet.getString("email"));
                    account.setContactno(resultSet.getString("contactno"));
                    account.setUserid(resultSet.getInt("userid"));
                }
            }
            return account;
        }
}
