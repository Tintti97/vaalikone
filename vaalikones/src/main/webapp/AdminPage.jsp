<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ylläpitosivu</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <div id="container">
            <img id="headerimg" src="Logo.png" width="720" />
            <div class="kysymys">
                <h1>Ylläpitosivu</h1>
            </div>
                <br>     
        </div>
        <div id="buttonit">
            <form action="AddEditRemoveCand.jsp"> <!-- ohjaa ehdokkaiden muokkasasetuksiin -->
            <input id="submitnappi" type="submit" value="Ehdokkaiden asetukset" name="btnLisaa" />                                                              
            </form>
            <form action="Register.jsp">  <!-- ohjaa rekisteröinti sivulle -->
            <input id="submitnappi" type="submit" value="Rekisteröi admin käyttäjä"/>
            </form>
			<form action="LisaaK.jsp">  <!-- ohjaa Lisaa kysymys sivulle -->
            <input id="submitnappi" type="submit" value="Lisaa kysymys"/>
            </form>
            <form action="index.html"> <!-- takaisin etusivulle -->
            <input id="submitnappi" type="submit" value="Takaisin etusivulle"/>
            </form>
        </div>
    </body>
</html>