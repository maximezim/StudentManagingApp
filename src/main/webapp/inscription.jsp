<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inscription</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet"> 
<link rel = "stylesheet" href = "stylesheet.css">
</head>
<body>
    <% ArrayList<String> specialites = (ArrayList<String>) request.getSession().getAttribute("specialites"); %>
    
    <!-- formulaire d'inscription d'un étudiant avec le nom, prenom et spécialité -->
    <form action="ScolariteManager" method="post">
    <h1>Inscription</h1>
    <br>
        <br>
        <label for="nom">Nom</label>
        <input type="text" name="nom" id="nom" required placeholder="Veuillez compléter ce champ"/>
        <label for="prenom">Prenom</label>
        <input type="text" name="prenom" id="prenom" required placeholder="Veuillez compléter ce champ"/>
        <label for="specialite">Specialite</label>
        <select name="specialite" id="specialite">
            <% for (String specialite : specialites) { %>
                <option value="<%= specialite %>"><%= specialite %></option>
            <% } %>
        </select>
        <input type="submit" name="InscrireEtu" value="Inscrire" />
    </form>

</body>
</html>