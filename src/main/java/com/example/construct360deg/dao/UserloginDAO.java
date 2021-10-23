package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Userlogin;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserloginDAO {

    public int verify(Userlogin userlogin) throws SQLException {
        int status=0;
        Connection connection= Database.getConnection();
        String sql="SELECT * FROM users where username=?";
        PreparedStatement statement;
            statement=connection.prepareStatement(sql);

            statement.setString(1,userlogin.getUsername());
            ResultSet resultSet=statement.executeQuery();
            if(resultSet.next()){
                String password= DigestUtils.sha256Hex(userlogin.getPassword());
                if(resultSet.getString("password").equals(password)){
                    status=resultSet.getInt("userid");
                }
            }

            return status;
    }
}
