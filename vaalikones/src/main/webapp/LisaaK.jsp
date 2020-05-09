<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Lisaa kysymys</title>

<!-- JavaScript -->
<script>
function sendData() {
	var kys = new Object();
	kys.kysymys = document.getElementById("kys").value;
	
	var jsonKys = JSON.stringify(kys);
	var xhttp = new XMLHttpRequest();
	
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("response").innerHTML = "Kysymys lisätty!";
			document.getElementById("kys").innerHTML = "";
			var returned=JSON.parse(this.responseText);
		}
	};
	
	xhttp.open("POST", "./vaalikone/kys/lisaak", true);
	xhttp.setRequestHeader("Content-type","application/json");
	xhttp.send(jsonKys);
}
</script>
</head>

<!-- LisaaK.jsp HTML-tiedoston CSS-tyylitys --> 
<style>
@charset "utf-8";
body {
    margin: 0 auto;
    width: 500px;
}

img {
    margin-left: 20px;
}

form {
    margin-left: 25px;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    border-radius: 25px;
    transition: 0.4s;
}

button:hover {
    opacity: 0.8;
}

@media screen and (max-width: 300px) {
    span.psw {
        display: block;
        float: none;
    }
    .cancelbtn {
        width: 100%;
    }
}

input.required {
    opacity: 0.8;
}

input[type=text],
input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    border-radius: 25px;
    height: 50px;
}
</style>
 
<body>

<img id="headerimg" src="Logo.png" width="500" />
<form action="#" method="post" onsubmit="return false;">
  <div class="container">
    <input type="text" maxlength="100" placeholder="Syötä kysymys" id="kys" name="kys" required>
    <button type="submit" onclick="sendData();">Lisää kysymys</button>
    <br>
    <p id="response"></p>
    </div>   
</form>
	<button type="submit" name="back" onclick="history.back()">Takaisin</button>
</body>
</html>