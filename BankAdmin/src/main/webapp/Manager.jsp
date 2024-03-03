<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>manager</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script type="text/javascript">
function test(ty)
{
	document.getElementById("res").innerHTML="selected "+ty;
	}


function createRequestObject() {
    var tmpXmlHttpObject;
    if (window.XMLHttpRequest) {
            tmpXmlHttpObject = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
    }

    return tmpXmlHttpObject;
}


var http = createRequestObject();

function makeGetRequest(ty) {
    
    http.open('get', 'HyperlinkResult.jsp?acctype=' + ty);
    http.onreadystatechange = processResponse;
    http.send(null);
}

function processResponse() {
    if(http.readyState == 4){
        var response = http.responseText;
        document.getElementById('res').innerHTML = response;
    }
}



</script>


</head>
<body style="margin-top:35px">
<div class="container">
<h1 class="display-4">Manager Home</h1>
<%
String id=String.valueOf(session.getAttribute("usweid"));
%>
UserID : <%=id%>
<hr>

<a href="NewAccount.html">Open New Account</a> | 
<a href="AccountReport.jsp">Account Report</a> | 
<a href="CloseAccount.html">Close Account</a> | 
<a href="Logout">Logout</a>

<br>

<a href="javascript:makeGetRequest('saving')">Saving</a> | 
<a href="javascript:makeGetRequest('fixed')">Fixed</a> |
<a href="javascript:makeGetRequest('current')">Current</a> |
<a href="javascript:makeGetRequest('ppf')">PPF</a> 

<br><br>
<div id="res"></div>


</div>
</body>
</html>