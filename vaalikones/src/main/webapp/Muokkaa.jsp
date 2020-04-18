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
        <title>Muokkaa ehdokasta</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
@charset "UTF-8";
/* CSS Document */

#container{
	width: 800px;
	border-radius: 20px;
	background-color: #D3D3D3;
	-webkit-box-shadow: 4px 4px 39px -8px #000000;
	box-shadow: 4px 4px 39px -8px #000000;
	background-image: url(images/concrete_seamless.png);
	padding: 20px;
    font-family: Gotham, "Helvetica Neue", Helvetica, Arial, sans-serif;
    margin: auto;
}
body {
	background-image: url(images/wild_oliva.png);
	padding: 10;
	background-repeat: repeat;
}
#headerimg {
	margin: auto;
	width: 500px;
	height: 144px;
	display: block;
	padding-top: 10px;
}

.kysymys{
	width: 600px;
	margin: auto;
    padding-top: 50px;
	height: 100px;
	color: #3E3E3E;
	font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", "Arial Black", sans-serif;
	text-align: center;
}
#submitnappi{
	float: none;
	margin-left: auto;
	margin-right: auto;
	width: 200px;
	height: 50px;
	display: block;
	margin-top: 20px;
	font-family: Impact, Haettenschweiler, "Franklin Gothic Bold", "Arial Black", sans-serif;
	font-style: normal;
	font-size: large;
}


 .form-inline {   
   margin: auto;
   margin-top: 25px;
   width: 800px;
   display: flex; 
   flex-flow: row wrap; 
   align-items: center; 
   border: 2px solid #ddd;
   border-radius: 4px;
   padding: 10px;
 } 

.nimi {
float: left;
}

.pkotip {
float: left;
}

.ikaam {
float: left;
}

.edusk1 {
float: left;
}

.edusk1 input{
width: 450px;
}

.edusk2 {
float: left;
}

.edusk2 input{
width: 450px;
}

 .form-inline label { 
   margin: 5px 10px 5px 0;
   font-family: "Times New Roman", Times, serif;
   font-weight: bold;
 } 

 .form-inline input { 
   vertical-align: middle; 
   margin: 5px 10px 5px 0; 
   padding: 10px; 
   background-color: #fff; 
   border: 1px solid #ddd; 
 } 

 .form-inline button { 
   padding: 10px 20px; 
   background-color: dodgerblue; 
   border: 1px solid #ddd; 
   color: white; 
   cursor: pointer; 
 } 

 @media (max-width: 800px) { 
   .form-inline input { 
     margin: 10px 0; 
   } 
  
   .form-inline { 
     flex-direction: column; 
     align-items: stretch; 
   } 

#nappi {
margin: auto;
}
</style>
        
    </head>
    <body>
        <div id="container">
            
            <img id="headerimg" src="Logo.png" width="720" />
            <div class="kysymys">
                <h1>Muokkaa ehdokasta</h1>
                <form action="AddEditRemoveCand.jsp">
            		<input id="submitnappi" type="submit" value="Takaisin"/>
           		</form>
                
            </div>
                <br>     
                <br>
                <br>
        </div>
       
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/vaalikone"
         user = "root"  password = "Qwerty1!"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from ehdokkaat;
      </sql:query>
     
     
      	
 
     
		
		 
		
      <c:forEach var = "row" items = "${result.rows}">
      <form class="form-inline" accept-charset="UTF-8" action="/MuokkaaK" method="Post">
   		         
               <%-- <td><c:out value = "${row.EHDOKAS_ID}"/></td> --%>
               <div class="nimi">
               <label for="snimi">Sukunimi:</label>
               <input type="text" name="snimi" value = "${row.SUKUNIMI}"/>
               <label for="enimi">Etunimi:</label>
               <input type="text" name="enimi" value = "${row.ETUNIMI}"/>
               </div>
               <div class="pkotip">
               <label for="puolue">Puolue:</label>
               <input type="text" name="puolue" value = "${row.PUOLUE}"/>
               <label for="kotip">Kotipaikkakunta:</label>
               <input type="text" name="kotip" value = "${row.KOTIPAIKKAKUNTA}"/>
               </div>
               <div class="ikaam">
               <label for="ika">Ik‰:</label>
               <input type="number" name="ika" value = "${row.IKA}"/>
               <label for="ammatti">Ammatti:</label>
               <input type="text" name="ammatti" value = "${row.AMMATTI}"/>
               </div>
               <div class="edusk1">               
               <label for="me">Miksi haluat eduskuntaan?:</label>
               <input type="text" name="me" value = "${row.MIKSI_EDUSKUNTAAN}"/>
               </div>
               <div class="edusk2">
               <label for="mie">Mit‰ asioita haluat edist‰‰?:</label>
               <input type="text" name="mie" value = "${row.MITA_ASIOITA_HALUAT_EDISTAA}"/>
               </div>
                            
               <input type="hidden" name="id" value="${row.EHDOKAS_ID}">
               <input id="nappi" type="submit" value="Muokkaa">
                       
      </form>
            
         </c:forEach>
    

		</body>

</html>