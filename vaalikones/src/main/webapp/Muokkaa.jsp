<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%//@page import="java.util.*,vaalikone.Muokkaa,persist.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LISTA EHDOKKAISTA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
       
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/vaalikone"
         user = "root"  password = "Qwerty1!"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from ehdokkaat;
      </sql:query>
     
     
      	
 
     
		
		 
		
      <c:forEach var = "row" items = "${result.rows}">
      <form accept-charset="UTF-8" action="/MuokkaaK" method="Post">
      <table border = "1" width = "100%">
     		
            <tr> 
               <%-- <td><c:out value = "${row.EHDOKAS_ID}"/></td> --%>
               <td><input type="text" name="snimi" value = "${row.SUKUNIMI}"/></td>
               <td><input type="text" name="enimi" value = "${row.ETUNIMI}"/></td>
               <td><input type="text" name="puolue" value = "${row.PUOLUE}"/></td>
               <td><input type="text" name="kotip" value = "${row.KOTIPAIKKAKUNTA}"/></td>
               <td><input type="number" name="ika" value = "${row.IKA}"/></td>
               <td><input type="text" name="me" value = "${row.MIKSI_EDUSKUNTAAN}"/></td>
               <td><input type="text" name="mie" value = "${row.MITA_ASIOITA_HALUAT_EDISTAA}"/></td>
               <td><input type="text" name="ammatti" value = "${row.AMMATTI}"/></td>
               <td>
               
               <input type="hidden" name="id" value="${row.EHDOKAS_ID}">

               <input type="submit" value="Muokkaa">
               
          
 				
 				</td>
            </tr>
              </table></form>
            
         </c:forEach>
    

		</body>

</html>