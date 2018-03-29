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
 	  <div>
		Word:<input id="word" type="text" name="Word"placeholder="Type in a word"><br /> 
		Meaning:<input id="meaning" type="text" name="Meaning" placeholder="meaning of the word"><br />
		 source:<input	id="source" type="text" name="Source"placeholder="source of the word"><br /> 
		 <input id="submit-form" type="submit"value="submit" >
</div>
	


	<script type="text/javascript" src="Submit.js"></script>
	
</body>
</html>