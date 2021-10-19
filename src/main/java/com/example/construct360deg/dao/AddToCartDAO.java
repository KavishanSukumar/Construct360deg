package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddToCartDAO {
    public void insertToCart(Cart cart) throws SQLException {
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement;
        int row=0;
        String sql="INSERT INTO `addtocart`(`productid`, `userid`) VALUES (?,?)";

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,cart.getProductid());
        preparedStatement.setInt(2,cart.getUserid());
        row=preparedStatement.executeUpdate();
    }
}
