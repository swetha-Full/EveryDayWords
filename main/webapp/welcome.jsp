<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="116725367766-hf13gjp82j1a0c8mb0lm00doofaq18h1.apps.googleusercontent.com">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Welcome</title>
<script>
		function postContactToGoogle() {
			var word = $('#word').val();
			var meaning = $('#meaning').val();
			var source = $('#source').val();

			
					$.ajax({
						url : "https://docs.google.com/forms/d/e/1FAIpQLSfo-uopHchgKKggmVDyCz2I7KumVd4KXmadaD61WHJhiwL--Q/formResponse?",
						data : {
							"entry.1432248718" : word,
							"entry.655136650" : meaning,
							"entry.1566407520" : source
						},
						type : "POST",
						dataType : "xml",
						statusCode : {0 : function() {window.location.replace("ThankYou.html");},200 : function() {window.location.replace("ThankYou.html");}}
});
		}
	</script>
</head>
<body>
	<%
		if (session.getAttribute("userName") == null) {
	%>
	<jsp:forward page="/index.jsp" />
	<%
		}
	%>

	<h3>Welcome ${userName}</h3>

	
	<form id="myForm" action="" method="Post" target="no-target">
		Word:<input id="word" type="text" name="word"
			placeholder="Type in a word"><br /> Meaning:<input
			id="meaning" type="text" name="meaning"
			placeholder="meaning of the word"><br /> source:<input
			id="source" type="text" name="source"
			placeholder="source of the word"><br />
		<button id="formSubmit" type="button" onclick="postContactToGoogle()">Submit
		</button>
	</form>




	<a href="index.jsp" onclick="signOut();">SignOut</a>

	<script>
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
		};
	</script>
</body>
</html>