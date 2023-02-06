<!-- import arraylist -->
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "TP3.*" %>
    

<!DOCTYPE html>
<html>
<head>
<style>

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

th {
    background-color: #dddddd;
}


</style>
<meta charset="ISO-8859-1">
<title>notes</title>
</head>
<body>
    <% ArrayList<Etudiant> specialiteEtu = (ArrayList<Etudiant>) request.getSession().getAttribute("specialiteEtu"); %>
	
	<% if (specialiteEtu.isEmpty()) { %>
        <script>
            alert("Aucun �tudiant n'est inscrit dans cette sp�cialit�");
            window.location.href = "http://localhost:8080/TP3/Accueil.html";
        </script>
    <% } %>

    <!-- affiche le nom et pr�nom des �tudiants -->
    <table>
        <tr>
            <th>Nom</th>
            <th>Pr�nom</th>
        </tr>
        <% for (Etudiant etu : specialiteEtu) { %>
            <tr>
                <td><%= etu.getNom() %></td>
                <td><%= etu.getPrenom() %></td>
            </tr>
        <% } %>
   	</table>
</body>
</html>