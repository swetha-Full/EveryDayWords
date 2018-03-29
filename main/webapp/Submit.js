document.getElementById('submit-form').onclick = function() {
	var word = document.getElementById("word").value;
	var meaning = document.getElementById("meaning").value;
	var source = document.getElementById("source").value;
	var xhr = new XMLHttpRequest();
	var url="/PostToSheet?word="+word+"&&meaning="+meaning+"&&source="+source;
	xhr.onreadystatechange= function()
	{
		if(xhr.readyStatus==4){
			if(xhr.responseText)
			{
			window.location="https://docs.google.com/spreadsheets/d/1K3quW46lnYMNOnY6hk6rgbGauycYkq8vajUC-b2ovpk/edit#gid=0";
			}
			
		}
	};
	xhr.open("POST",url,true);
	xhr.send();
}