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
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;

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
}
