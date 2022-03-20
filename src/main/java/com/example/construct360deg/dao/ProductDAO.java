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
    public ArrayList<Product> getProductDetails(String searchval) throws SQLException {
        ArrayList<Product> products=new ArrayList<>();
        PreparedStatement preparedStatement=null;
        Connection connection= Database.getConnection();
        String pattern = searchval;
        String sql = null;
        System.out.println(pattern);

        if (pattern==null || pattern==""){
            sql = "SELECT * FROM product";
        }else {
            sql = "SELECT * FROM product WHERE productname like '%"+pattern+"%'";
        }
        ResultSet resultSet;
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
    public ArrayList<Product> getProductDetailsCom(int userid) throws SQLException {
        ArrayList<Product> products=new ArrayList<>();
        PreparedStatement preparedStatement=null;
        Connection connection= Database.getConnection();
        String sql="SELECT * FROM `product` WHERE companyid =?";
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
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

    public boolean Updateproduct(Product product) throws SQLException{
        Boolean status=false;
        Connection connection= Database.getConnection();
        PreparedStatement preparedStatement3=null;

        String sql2="UPDATE `product`  SET    `quantity`=?, `productimage`=?, `productdes`=?, `productprice`=?, `productname`=? WHERE  productid=?";

        preparedStatement3=connection.prepareStatement(sql2);

        preparedStatement3.setFloat(1,product.getQuantity());
        preparedStatement3.setBlob(2,product.getProductimage());
        preparedStatement3.setString(3,product.getProductdes());
        preparedStatement3.setFloat(4,product.getPrice());
        preparedStatement3.setString(5,product.getProductName());
        preparedStatement3.setInt(6,product.getProductid());

        int rows=preparedStatement3.executeUpdate();

        if(rows>0){
            status=true;
        }

        return status;

    }


    public Product editProductDetailsCom(int userid,int productid) throws SQLException {
        Product product=new Product();
        PreparedStatement preparedStatement=null;
        Connection connection= Database.getConnection();
        String sql="SELECT * FROM `product` WHERE companyid =? AND productid=? ";
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
        preparedStatement.setInt(2,productid);
        resultSet=preparedStatement.executeQuery();

        if(resultSet.next()){
            product.setProductName(resultSet.getString("productname"));
            product.setQuantity(resultSet.getFloat("quantity"));
            product.setPrice(resultSet.getFloat("productprice"));
            product.setCompanyid(resultSet.getInt("companyid"));
            product.setProductid(resultSet.getInt("productid"));
            byte[] bytes=resultSet.getBytes("productimage");
            product.setImgBytes(bytes);
            product.setProductdes(resultSet.getString("productdes"));
        }
        return product;

    }

    public boolean deleteProduct(int productid) throws SQLException{
        Boolean status=false;
        Connection connection = Database.getConnection();
        PreparedStatement preparedStatement = null;

        String sql = "DELETE FROM `product` WHERE productid=?";


        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,productid);

        int rows = preparedStatement.executeUpdate();
        if(rows>0){
            status=true;
        }

        return status;
}

    public Product viewproductdetails(int productid) throws SQLException {
        Product product=new Product();
        PreparedStatement preparedStatement=null;
        Connection connection= Database.getConnection();
        String sql="SELECT * FROM `product` WHERE productid=? ";
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,productid);
        resultSet=preparedStatement.executeQuery();

        if(resultSet.next()){
            product.setProductName(resultSet.getString("productname"));
            product.setQuantity(resultSet.getFloat("quantity"));
            product.setPrice(resultSet.getFloat("productprice"));
//            product.setCompanyid(resultSet.getInt("companyid"));
            product.setProductid(resultSet.getInt("productid"));
            byte[] bytes=resultSet.getBytes("productimage");
            product.setImgBytes(bytes);
            product.setProductdes(resultSet.getString("productdes"));
        }
        return product;

    }
    public ArrayList<Product> getProductDetailsComSerach(int userid,String searchval) throws SQLException {
        ArrayList<Product> products=new ArrayList<>();
        PreparedStatement preparedStatement=null;
        Connection connection= Database.getConnection();
        String pattern = searchval;
        String sql = null;
        System.out.println(pattern);
        if(pattern==null || pattern=="" ){
            sql="SELECT * FROM product WHERE companyid =?";
        }else{
            sql="SELECT * FROM product WHERE companyid =? AND productname like '%"+pattern+"%'";
        }
//        String sql="SELECT * FROM `product` WHERE companyid =?";
        ResultSet resultSet=null;

        preparedStatement=connection.prepareStatement(sql);
        preparedStatement.setInt(1,userid);
//        preparedStatement.setString(2,searchval);
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
