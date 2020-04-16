<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
        <div id="container">
            <img id="headerimg" src="Logo.png" width="720" />
            <div class="kysymys">
                <h1>Admin sivu</h1>
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
        </div>
    </body>
</html>