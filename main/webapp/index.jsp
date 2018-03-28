<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="116725367766-hf13gjp82j1a0c8mb0lm00doofaq18h1.apps.googleusercontent.com">

<title>EveryDayWords</title>
</head>
<body>
	<h2>EveryDayWords</h2>
	<br>
	<div class="g-signin2" data-onsuccess="onSignIn"></div>

  <script>
      //google callback. This function will redirect to our login servlet
      function onSignIn(googleUser) {
         var profile = googleUser.getBasicProfile();
         console.log('ID: ' + profile.getId());
         console.log('Name: ' + profile.getName());
         console.log('Image URL: ' + profile.getImageUrl());
         console.log('Email: ' + profile.getEmail());
         console.log('id_token: ' + googleUser.getAuthResponse().id_token);
         Image_URL:profile.getImageUrl();

         //do not post all above info to the server because that is not secure.
         //just send the id_token

        var redirectUrl = 'login';
         /*var http=new XmlHttpRequest();
         http.oreadyStateChange = function(){
         	if(http.readyState==4 && http.status==200)
         		<input type="text" name="id_token" value="' + googleUser.getAuthResponse().id_token + '" />
         	
http.open("Post","redirectUrl",true);
         http.send();*/
         //using jquery to post data dynamically
        var form = $('<form action="' + redirectUrl + '" method="post">' +
                          '<input type="text" name="id_token" value="' +
                          googleUser.getAuthResponse().id_token + '" />' +
                                                                '</form>')
         $('body').append(form);
         form.submit();
       
     }

   </script>
  
</body>
</html>