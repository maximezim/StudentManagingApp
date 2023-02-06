<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note modules</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet"> 
<link rel = "stylesheet" href = "stylesheet.css">
</head>
<body>
    <% ArrayList<String> modules = (ArrayList<String>) request.getSession().getAttribute("modules"); %>

    <!-- formulaire de choix d'un module -->

    <form action="ScolariteManager" method="post">
    <h1>Afficher les notes</h1>
    <br>
    <br>
        <label for="module">Module</label>
        <select name="module" id="module">
            <% for (String module : modules) { %>
                <option value="<%= module %>"><%= module %></option>
            <% } %>
        </select>
        <input type="submit" name="AfficherEtu" value="Afficher" />

</body>
</html>