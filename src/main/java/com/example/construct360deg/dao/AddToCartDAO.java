package com.example.construct360deg.dao;

import com.example.construct360deg.database.Database;
import com.example.construct360deg.model.Cart;
import com.example.construct360deg.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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


    public ArrayList<Cart> getAllItemsInCart(int userid) throws SQLException {
        ArrayList<Cart> products=new ArrayList<>();
        Connection connection=Database.getConnection();
        PreparedStatement preparedStatement=null;
        String sql="SELECT `companyid`, `productid`, `productname`, `quantity`, `productimage`, `productdes`, `productprice`, `cartid` FROM `cartproductsview` WHERE userid=?";
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        resultSet=preparedStatement.executeQuery();

        while (resultSet.next()){
            Cart cart=new Cart();

            cart.setProductid(resultSet.getInt("productid"));
            cart.setCompanyid(resultSet.getInt("companyid"));
            cart.setProductName(resultSet.getString("productname"));
            cart.setQuantity(resultSet.getFloat("quantity"));
            cart.setImgBytes(resultSet.getBytes("productimage"));
            cart.setProductdes(resultSet.getString("productdes"));
            cart.setPrice(resultSet.getFloat("productprice"));
            cart.setCartid(resultSet.getInt("cartid"));

            products.add(cart);
        }


        return products;
    }
}
