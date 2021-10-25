package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {
    public boolean addProduct(Product product) throws SQLException {
        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement=null;

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
