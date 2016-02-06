<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="fyp.TextBean" import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="generator"
	content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
<title>Final Year Project</title>
<script src="jquery.js"></script>
<script src="logic.js"></script>
<script>
	function changeLimit() {
		var limit = document.getElementById("limit_id").value;
		document.TextForm.limit.value = limit;

	}

	function validation() {
		if (document.FileForm.file.value == "") {
			window.alert('Please upload a document.');
			console.log("testing");
			document.FileForm.file.focus();
			return false;
		}
		return true;
	}

	function myFunction() {
		document.execCommand('SaveAs', 'true', 'C:/Tomcat7/webapps/Result.txt');
	}
</script>
<link rel="stylesheet" href="style.css" />
<meta charset="utf-8" />
</head>
<body>
	<%
		session = request.getSession(true);

		TextBean bean = null;
		if (session.getAttribute("Bean") != null) {
			bean = (TextBean) session.getAttribute("Bean");
		}
		System.out.println("hello " + session.getAttribute("email"));
		session.getAttribute("userName");
		if (session.getAttribute("userName") == null) {
			response.sendRedirect("UserLogin.html");
		}

		session.getAttribute("email");
	%>
	<table width="100%">

		<tr>
			<td></td>
			<td margin-left="50px"><h1 align="center" style="padding-left: 110px">Final Year
					Project - My Turnitin</h1></td>
			<td>
				<form action="Logout.jsp" method="get" align="right">
					<button id="submit" type="submit">Logout</button>
				</form>

			</td>
			<table>
				<tr>
					<td style="padding-left: 70px">


						<table id='inputfield' align="left">
							<form name="TextForm" action="MainServlet" method="post">
								<tr>
									<td style="padding-right: 70px"><strong>Input
											Query Sentence:</strong> <br /> <textarea name="querySentence"
											cols="60" rows="10">How are You</textarea></td>
									<td>
										<button type="Submit" name="submitText" align="top"
											class="myButton" id='submitButton'>Submit</button> <input
										type="hidden" name="limit" value="1">
									</td>
								</tr>
							</form>
							<form name="FileForm" onsubmit="return (validation())"
								action="FileServlet" method="post" enctype="multipart/form-data">
								<tr>
									<td height="60"><strong>File Query:</strong> <input
										type="file" name="file" class="upload"
										accept=".txt, .pdf, .doc, .docx" id="validateButton" /></td>
									<td>
										<button type="Submit" name="submitFile" class="myButton">Submit</button>
									</td>
								</tr>
								<tr>
									<td height="80"><font size="2">Word Limitation:</font></td>
									<td><select id='limit_id' name='limit'
										onChange="changeLimit()">
											<option value='1' selected="selected">No limit</option>
											<option value='2'>2</option>
											<option value='3'>3</option>
											<option value='4'>4</option>
											<option value='5'>5</option>
											<option value='6'>6</option>
											<option value='7'>7</option>
											<option value='8'>8</option>
											<option value='9'>9</option>
									</select></td>
								</tr>
							</form>
						</table> <br />
					</td>
					<td style="padding-left: 100px" width="500px">

						<div id="ResultTable">
							<table id='resultlist' align="top">

<%-- 								<% --%>
// 									if (bean == null) {
// 										out.println("<tr><td colspan=4>&nbsp;</td></tr>");
// 									} else {
// 										out.println("<thead><tr><th>File property</th></tr></thead>");
// 										for (List<String> result : bean.getResultTable()) {
// 											for (String field : result) {
// 												out.println("<tr><td>" + field + "</td></tr>");
// 											}
// 											out.println("<tr><td>&nbsp;</td></tr>");
// 										}

// 									}
<%-- 								%> --%>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
			<%
				if (bean != null) {
					if (bean.getUrlCount() != 0) {
						out.println("<form action=\"Confirm.jsp\" method=\"post\">");
						out.println("<p align=\"top\" style=\"margin-right: 300px\">");
						out.println("<input type=\"button\" id=\"exportResult\" value=\"Confirm\"  >");
						out.println("</p>");
						out.println("</form>");
					}
				}
			%>

			<!-- 	<input onclick="myFunction()" type=button value="save as"/> -->
</body>
</html>
