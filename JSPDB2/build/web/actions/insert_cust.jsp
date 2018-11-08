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

            String cust_name;
            String cust_email;
            String cust_phone;
            String cust_add1;
            String cust_add2;
            String cust_add3;
            String cust_add4;
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
                stat.execute("CREATE TABLE if not exists customer (cust_name CHAR (20), cust_email CHAR(20), cust_phoneNo CHAR(20), cust_address1 CHAR(20), cust_address2 CHAR(20), cust_address3 CHAR(20), cust_address4 CHAR(20))");

            } catch (Exception e) {
                System.err.println(e);
            }

            cust_name = request.getParameter("cust_name");
            cust_email = request.getParameter("cust_email");
            cust_phone = request.getParameter("cust_phone");
            cust_add1 = request.getParameter("cust_add1");
            cust_add2 = request.getParameter("cust_add2");
            cust_add3 = request.getParameter("cust_add3");
            cust_add4 = request.getParameter("cust_add4");

            try {
                String query = "INSERT INTO customer VALUES(?,?,?,?,?,?,?)";
                prepStat = (PreparedStatement) conn.prepareStatement(query);
                prepStat.setString(1, cust_name);
                prepStat.setString(2, cust_email);
                prepStat.setString(3, cust_phone);
                prepStat.setString(4, cust_add1);
                prepStat.setString(5, cust_add2);
                prepStat.setString(6, cust_add3);
                prepStat.setString(7, cust_add4);
                prepStat.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }
        %>

        <h1>Inserted Successfully</h1><br>
        <a href="../index.html"><p>Menu</p></a>
    </body>
</html>
