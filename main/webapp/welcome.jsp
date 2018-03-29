<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="
665127871186-rts59tahaio5d9qhttqranq3gg2kat8i.apps.googleusercontent.com">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Welcome</title>
<!--  
<script>
function postToSheet(){
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status== 200){
			document.getElementById("demo").innerHTML=this.responseText(),
		$.ajax({
				  "range": "Sheet1!A6",
				  "majorDimension": "ROWS",
				  "values": [
				    ["word", "meaning", "source"]
				    
				  ]
		});
  }
	xhttp.open("Post","https://sheets.googleapis.com/v4/spreadsheets/1CnICvq_wLLxya8z72TmMKw89yhPLlSHUawjJ9xuT4I8/values/Sheet1!A1:D5?valueInputOption=USER_ENTERED",true);
	//xhttp.send();
 }
</script>-->
<!--  
<script>
		function postContactToGoogle() {
			
		    console.log("Hello james");
			var word = $('#word').val();
			var meaning = $('#meaning').val();
			var source = $('#source').val();
			
            $.ajax({
						url : "https://crossorigin.me/https://docs.google.com/forms/d/e/1FAIpQLSfo-uopHchgKKggmVDyCz2I7KumVd4KXmadaD61WHJhiwL--Q/formResponse?",
						data : {
							"entry.1432248718" : word,
							"entry.655136650" : meaning,
							"entry.1566407520" : source
						},
						type : "POST",
						dataType : "xml",
						statusCode : {
							0 : function() {
							     // window.location.replace("ThankYou.html");
							},
							200 : function() {
						          //window.location.replace("ThankYou.html");
						    }
						}
           });
		}
	</script>-->
</head>
<body>
	<% if (session.getAttribute("userName") == null) {%>
<jsp:forward page="/index.jsp"/>
<% } %>
	<h1>Welcome ${userName}</h1>
  <a href="https://docs.google.com/forms/d/e/1FAIpQLSfo-uopHchgKKggmVDyCz2I7KumVd4KXmadaD61WHJhiwL--Q/formResponse?">Click here to add words into the form</a><br/>
  <button type="button" onclick="signOut()">SignOut</button>
<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		};
	</script>
</script>
 	  <form id="myForm" >
		Word:<input id="word" type="text" name="Word"placeholder="Type in a word"><br /> 
		Meaning:<input id="meaning" type="text" name="Meaning" placeholder="meaning of the word"><br />
		 source:<input	id="source" type="text" name="Source"placeholder="source of the word"><br /> 
		 <input type="submit"value="submit" id="submit-form">

	</form> 


	<script type="text/javascript" src="Submit.js"></script>
	
</body>
</html>