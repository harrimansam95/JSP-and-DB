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

            String inv_num;
            String cust_num;
            String payment;
         
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
                stat.execute("CREATE TABLE if not exists InvoiceCustomer (inv_num CHAR (20), cust_num CHAR(20), payment CHAR(20))");

            } catch (Exception e) {
                System.err.println(e);
            }

            inv_num = request.getParameter("inv_number");
            cust_num = request.getParameter("cust_number");
            payment = request.getParameter("payment");


            try {
                String query = "INSERT INTO InvoiceCustomer VALUES(?,?,?)";
                prepStat = (PreparedStatement) conn.prepareStatement(query);
                prepStat.setString(1, inv_num);
                prepStat.setString(2, cust_num);
                prepStat.setString(3, payment);
    
                prepStat.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }
        %>

        <h1>Inserted Successfully</h1><br>
        <a href="../index.html"><p>Menu</p></a>
    </body>
</html>
