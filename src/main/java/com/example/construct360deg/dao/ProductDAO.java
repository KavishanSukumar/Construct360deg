package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {
    public boolean addProduct(Product product,String uname) throws SQLException {
        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql1="SELECT * FROM `users` WHERE username= ?";

        preparedStatement=connection.prepareStatement(sql1);

        preparedStatement.setString(1,uname);

        ResultSet resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            product.setCompanyid(resultSet.getInt("userid"));
        }

        String sql2="INSERT INTO `product`(`companyid`, `productname`, `quantity`, `productimage`, `productdes`, `productprice`) VALUES(?,?,?,?,?,?)";
        PreparedStatement preparedStatement1;
        preparedStatement1=connection.prepareStatement(sql2);
        preparedStatement1.setInt(1,product.getCompanyid());
        preparedStatement1.setString(2,product.getProductName());
        preparedStatement1.setFloat(3,product.getQuantity());
        preparedStatement1.setBlob(4,product.getProductimage());
        preparedStatement1.setString(5,product.getProductdes());
        preparedStatement1.setFloat(6,product.getPrice());

        int rows=preparedStatement1.executeUpdate();

        if(rows>0){
            status=true;
        }

        return status;
    }
}
