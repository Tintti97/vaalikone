<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//@page import="java.util.*,vaalikone.Lisaa,persist.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lisää ehdokas</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <div id="container">
            
            <img id="headerimg" src="Logo.png" width="720" />
            <div class="kysymys">
                <h1>Lisää ehdokas</h1>
            </div>
                <br>     
        </div>
<form method="POST"action="/Lisaa" id="lisays">
	<label for="etunimi">Ehdokkaan etunimi: </label>
	<input type="text" id="etunimi" name="etunimi" required><br><br>
	<label for="sukunimi">Ehdokkaan sukunimi: </label>
	<input type="text" id="sukunimi" name="sukunimi" required><br><br>
	<label for="puolue">Ehdokkaan puolue: </label>
	<input type="text" id="puolue" name="puolue" required><br><br>
	<label for="ika">Ehdokkaan ikä: </label>
	<input type="text" id="ika" name="ika" required><br><br>
	<label for="kotipaikkakunta">Ehdokkaan kotipaikkakunta: </label>
	<input type="text" id="kotipaikkakunta" name="kotipaikkakunta" required><br><br>
	<label for="ammatti">Ehdokkaan ammatti: </label>
	<input type="text" id="ammatti" name="ammatti" required><br><br>
	<label for="miksiEduskuntaan">Miksi haluan eduskuntaan: </label>
	<input type="text" id="miksiEduskuntaan" name="miksiEduskuntaan" required><br><br>
	<label for="mitaAsioitaHaluatEdistaa">Mitä asioita haluan edistää: </label>
	<input type="text" id="mitaAsioitaHaluatEdistaa" name="mitaAsioitaHaluatEdistaa" required><br><br>
	<input id="submitnappi" type="submit" value="Lisää ehdokas">
	<input id="submitnappi" type="submit" onclick="history.back()" value="Peruuta">
</form>
<%
	//String message = (String) request.getAttribute("Message");
	//String etunimi = (String) request.getAttribute("Etunimi");
	//String sukunimi = (String) request.getAttribute("Sukunimi");
	
	//out.println("Servlet communicated message: " + message + ", ");
%>
</body>
</html>