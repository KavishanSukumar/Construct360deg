package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.ForgotPassword;
import com.example.construct360deg.model.Userlogin;
import org.apache.commons.codec.digest.DigestUtils;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.Random;

public class UserloginDAO {

    public Userlogin verify(Userlogin userlogin) throws SQLException {
        Connection connection= Database.getConnection();
        String sql="SELECT * FROM login where username=?";
        PreparedStatement statement;
            statement=connection.prepareStatement(sql);

            statement.setString(1,userlogin.getUsername());
            ResultSet resultSet=statement.executeQuery();
            if(resultSet.next()){
                String password= DigestUtils.sha256Hex(userlogin.getPassword());
                if(resultSet.getString("password").equals(password)){
                   userlogin.setUserid(resultSet.getInt("userid"));
                   userlogin.setUserrole(resultSet.getString("user_role"));
                }else{

                }
            }

            return userlogin;
    }
    public ForgotPassword forgotPassword(String data,String field) throws SQLException, MessagingException {
        String email=null;
        String sql=null;
        ForgotPassword forgotPassword=new ForgotPassword();
        ResultSet resultSet=null;
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        SendEmailDAO sendEmailDAO=new SendEmailDAO();
        if(field.equals("email")){
            sql="SELECT `email` FROM `usercontactno` WHERE usercontactno.email=?";

            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,data);
            resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                email=resultSet.getString("email");
            }
        }else{
            sql="SELECT `userid` FROM `login` WHERE username=?";
            int userid=0;
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,data);

            resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                userid=resultSet.getInt("userid");
            }
            if (userid!=0){
                sql="SELECT `email` FROM `usercontactno` WHERE usercontactno.userid=?";

                preparedStatement=connection.prepareStatement(sql);
                preparedStatement.setInt(1,userid);
                resultSet=preparedStatement.executeQuery();

                while (resultSet.next()){
                    email=resultSet.getString("email");
                }
            }
        }


        if (email!=null){

            Random rnd = new Random();
            int number = rnd.nextInt(999999);
            forgotPassword.setEmail(email);
            forgotPassword.setToken(number);
            String content="<h3>Reset Password</h3>" +
                    "<p>You've requested to reset the password linked with your Construct360deg.</p>" +
                    "<p>To confirm your request, please use the 6-digit code below:</p>" +
                    "<h2>"+number+"</h2>";
            sendEmailDAO.sendEmail(email,"Reset password",content);
            return forgotPassword;
        }else {
            forgotPassword.setToken(0);
            return forgotPassword;
        }
    }

    public boolean changeThePassword(ForgotPassword forgotPassword) throws SQLException {
        boolean status=false;
        String sql="SELECT `userid` FROM `usercontactno` WHERE email=?";
        PreparedStatement preparedStatement=null;
        Connection connection=Database.getConnection();
        ResultSet resultSet=null;
        int userid=0;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setString(1,forgotPassword.getEmail());
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            userid=resultSet.getInt("userid");
        }

        String sql1="UPDATE `login` SET `password`=? WHERE `userid`=?";
        PreparedStatement preparedStatement1=connection.prepareStatement(sql1);
        preparedStatement1.setString(1,forgotPassword.getPassword());
        preparedStatement1.setInt(2,userid);
        int row=preparedStatement1.executeUpdate();
        if (row>0){
            return true;
        }else {
            return false;
        }

    }
}
