<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inscription1</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet"> 
<link rel = "stylesheet" href = "stylesheet.css">
</head>
<body>
    <% ArrayList<String> specialites = (ArrayList<String>) request.getSession().getAttribute("specialites"); %>

    <!-- formulaire de choix d'une spécialité -->

    <form action="ScolariteManager" method="post">
        
        <h1>Afficher les étudiants</h1>
        <br>
        <br>
        <label for="specialite">Specialite</label>
        
        <select name="specialite" id="specialite">
            <% for (String specialite : specialites) { %>
                <option value="<%= specialite %>"><%= specialite %></option>
            <% } %>
        </select>
        <input type="submit" name="AfficherEtu" value="Afficher" />

</body>
</html>