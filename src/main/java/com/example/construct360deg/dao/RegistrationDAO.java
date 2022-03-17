package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.UserRegistration;

import javax.mail.MessagingException;
import java.sql.*;

public class RegistrationDAO {
    public boolean userRegistration(UserRegistration userRegistration) throws SQLException, MessagingException {
        boolean status=false;
        int row;
        String sql="INSERT INTO `login`( `username`, `password`,`user_role`) VALUES (?,?,?);";
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,userRegistration.getUsername());
        preparedStatement.setString(2,userRegistration.getPassword());
        preparedStatement.setString(3,userRegistration.getProfessionalrole());
        row=preparedStatement.executeUpdate();

        String sql2="SELECT userid FROM login where username=?";
        PreparedStatement preparedStatement1;
        preparedStatement1=connection.prepareStatement(sql2);
        preparedStatement1.setString(1,userRegistration.getUsername());
        ResultSet resultSet=preparedStatement1.executeQuery();

        if(resultSet.next()){

            int userid=resultSet.getInt("userid");
            String sql5="INSERT INTO `users`(`userid`) VALUES (?)";
            PreparedStatement preparedStatement2;
            preparedStatement2=connection.prepareStatement(sql5);
            preparedStatement2.setInt(1,userid);
            preparedStatement2.executeUpdate();


            String sql3="INSERT INTO `usercontactno`(`userid`, `contactno`, `email`) VALUES (?,?,?)";
            PreparedStatement preparedStatement3;
            preparedStatement3=connection.prepareStatement(sql3);
            preparedStatement3.setInt(1,userid);
            preparedStatement3.setString(2,userRegistration.getContactno());
            preparedStatement3.setString(3,userRegistration.getEmail());
            row=preparedStatement3.executeUpdate();

            PreparedStatement preparedStatement4=null;

            if(userRegistration.getProfessionalrole().equals("cus_indiv")){
                String sql4="INSERT INTO CustomerIndividual (`userid`) VALUES (?)";
                preparedStatement4=connection.prepareStatement(sql4);
                preparedStatement4.setInt(1,userid);
                row+=preparedStatement4.executeUpdate();

            }else if(userRegistration.getProfessionalrole().equals("cus_com")){
                String sql4="INSERT INTO CustomerCompany (`userid`) VALUES (?)";
                preparedStatement4=connection.prepareStatement(sql4);
                preparedStatement4.setInt(1,userid);
                row+=preparedStatement4.executeUpdate();

            }else if(userRegistration.getProfessionalrole().equals("prof_indiv")){
                String sql4="INSERT INTO Individualprof (`userid`) VALUES (?)";
                preparedStatement4=connection.prepareStatement(sql4);
                preparedStatement4.setInt(1,userid);
                row+=preparedStatement4.executeUpdate();

            }else if (userRegistration.getProfessionalrole().equals("prof_com")){
                String sql4="INSERT INTO CompanyProf (`userid`) VALUES (?)";
                preparedStatement4=connection.prepareStatement(sql4);
                preparedStatement4.setInt(1,userid);
                row+=preparedStatement4.executeUpdate();
            }
            else if (userRegistration.getProfessionalrole().equals("prod_com")){
                String sql4="INSERT INTO productcompany (`userid`) VALUES (?)";
                preparedStatement4=connection.prepareStatement(sql4);
                preparedStatement4.setInt(1,userid);
                row+=preparedStatement4.executeUpdate();
            }
        }else{
            System.out.println("Failed to get the data");
        }

        if (row!=0){
            status=true;
        }

        SendEmailDAO sendEmailDAO=new SendEmailDAO();

//        System.out.println(sendEmailDAO.sendEmail("kavishansukumar@gmail.com","Testing","Testing"));

        System.out.println("Regirstration DAO");
        return status;
    }
    public boolean getEmail(String data,String field) throws SQLException {
        boolean status=false;
        data=data.trim();

        String sql;
        if(field.equals("email")){
            sql="SELECT COUNT(email) AS count FROM `usercontactno` WHERE usercontactno.email=?";
        }else{
            sql="SELECT COUNT(username) AS count FROM `login` WHERE username=?";
        }

        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,data);

        resultSet=preparedStatement.executeQuery();
        while (resultSet.next()){
            if(resultSet.getInt("count")!=0){
             status=true;
            }
        }

        return status;
    }
}
