<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//@page import="java.util.*,vaalikone.Lisaa,persist.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista ehdokkaista</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <div id="container">
            
            <img id="headerimg" src="Logo.png" width="720" />
            <div class="kysymys">
                <h1>Lista ehdokkaista</h1>
            </div>
                <br>     
        </div>
    <body>
       
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/vaalikone"
         user = "root"  password = "Qwerty1!"/> <!-- Jos heittää erroria niin vaihda oikeat tunnukset -->
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from ehdokkaat;
      </sql:query>
 
      <table border = "1" width = "100%">
 
		<tr>
			<!--<th>ID</th> -->
			<th>Sukunimi</th>
			<th>Etunimi</th>
			<th>Puolue</th>
			<th>Kotipaikkakunta</th>
			<th>ikä</th>
			<th>Miksi eduskuntaan</th>
			<th>Mitä asioida haluat edistää</th>
			<th>Ammatti</th>
		</tr>
      <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <!--<td contenteditable="true"><c:out value = "${row.EHDOKAS_ID}"/></td> -->
               <td contenteditable="true"><c:out value = "${row.SUKUNIMI}"/></td>
               <td contenteditable="true"><c:out value = "${row.ETUNIMI}"/></td>
               <td contenteditable="true"><c:out value = "${row.PUOLUE}"/></td>
               <td contenteditable="true"><c:out value = "${row.KOTIPAIKKAKUNTA}"/></td>
               <td contenteditable="true"><c:out value = "${row.IKA}"/></td>
               <td contenteditable="true"><c:out value = "${row.MIKSI_EDUSKUNTAAN}"/></td>
               <td contenteditable="true"><c:out value = "${row.MITA_ASIOITA_HALUAT_EDISTAA}"/></td>
               <td contenteditable="true"><c:out value = "${row.AMMATTI}"/></td>
               <td>
               <a href ="EhdokasEdit.jsp"<c:out value="${Row.EHDOKAS_ID}"/>>Edit</a> 
               </td>
            </tr>
         </c:forEach>
      </table>
		</body>
</html>