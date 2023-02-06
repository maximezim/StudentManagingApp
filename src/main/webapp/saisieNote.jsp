<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saisie de notes</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap" rel="stylesheet"> 
<link rel = "stylesheet" href = "stylesheet.css">
</head>
<body>
    <% ArrayList<String> modules = (ArrayList<String>) request.getSession().getAttribute("modules"); %>

    <!-- formulaire d'ajout de la note d'un étudiant avec le nom, prenom et spécialité et sa note -->
    <!-- les spécialités sont demandées au servlet et mise dans une liste de choix -->
    <form action="ScolariteManager" method="post">
    <h1>Saisie de notes</h1>
    <br>
        <br>
        <label for="nom">Nom</label>
        <input type="text" name="nom" id="nom" required placeholder="Veuillez compléter ce champ"/>
        <label for="prenom">Prenom</label>
        <input type="text" name="prenom" id="prenom" required placeholder="Veuillez compléter ce champ"/>
        <label for="module">Module</label>
        <select name="module" id="module">
            <% for (String module : modules) { %>
                <option value="<%= module %>"><%= module %></option>
            <% } %>
        </select>
        <label for="note">Note</label>
        <input type="number" name="note" id="note" min="0" max="20" required placeholder="Veuillez compléter ce champ"/>
        <input type="submit" name="AjouterNote" value="Ajouter" />
</body>
</html>