package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Product;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchProductDAO {
    public ArrayList<Product> getProductDetails() throws SQLException {
        ArrayList<Product> products=new ArrayList<>();
        PreparedStatement preparedStatement=null;
        Connection connection= Database.getConnection();
        String sql="SELECT * FROM `product`";
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Product product=new Product();
            product.setProductName(resultSet.getString("productname"));
            product.setQuantity(resultSet.getFloat("quantity"));
            product.setPrice(resultSet.getFloat("productprice"));
            product.setCompanyid(resultSet.getInt("companyid"));
            product.setProductid(resultSet.getInt("productid"));
            byte[] bytes=resultSet.getBytes("productimage");
            product.setImgBytes(bytes);
            product.setProductdes(resultSet.getString("productdes"));
            products.add(product);
        }
        return products;

    }
}
