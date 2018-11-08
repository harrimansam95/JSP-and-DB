<%-- 
    Document   : select
    Created on : 09-Oct-2018, 10:49:12
    Author     : K00200540
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Operation</title>
    </head>
    <body>




        <%

            String prod_code;
            String prod_desc;
            String prod_price;
         
            Connection conn = null;
            PreparedStatement prepStat;
            Statement stat;

            String URL = "jdbc:mysql://localhost:3306/";
            String DB = "sambd3";
            String USERNAME = "root";
            String PASSWORD = "";
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(URL + DB, USERNAME, PASSWORD);
                System.out.println("Connected");
                stat = conn.createStatement();
                stat.execute("CREATE TABLE if not exists product (prod_code CHAR (20), prod_desc CHAR(20), price CHAR(20))");

            } catch (Exception e) {
                System.err.println(e);
            }

            prod_code = request.getParameter("prod_code");
            prod_desc = request.getParameter("prod_desc");
            prod_price = request.getParameter("prod_price");


            try {
                String query = "INSERT INTO product VALUES(?,?,?)";
                prepStat = (PreparedStatement) conn.prepareStatement(query);
                prepStat.setString(1, prod_code);
                prepStat.setString(2, prod_desc);
                prepStat.setString(3, prod_price);
    
                prepStat.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }
        %>

        <h1>Inserted Successfully</h1><br>
        <a href="../index.html"><p>Menu</p></a>
    </body>
</html>
