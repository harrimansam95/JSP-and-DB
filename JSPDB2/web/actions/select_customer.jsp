<%-- 
    Document   : select_customer
    Created on : 16-Oct-2018, 10:21:49
    Author     : K00200540
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = null;
            PreparedStatement prepStat;
            Statement stat;

            String URL = "jdbc:mysql://localhost:3306/";
            String DB = "samdb";
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
            Statement stmt;

            response.setContentType("text/html");
            
            String title = "Database Result";
            String docType = "<!doctype html>";
            out.println(docType + "<html>\n"
                    + "<head><title>" + title + "</title></head>\n"
                    + "<h1 align=\"center\">" + title + "</h1>\n");
            try {
                stmt = (Statement) conn.createStatement();
                String sql;
                sql = "SELECT first_name, last_name FROM users";
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    String first = rs.getString("first_name");
                    String last = rs.getString("last_name");

                    out.println("First name: " + first + "<br>");
                    out.println("Last name: " + last + "<br>");
                }
                out.println("</body></html>");
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
