<!-- import arraylist -->
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <% ArrayList<String[]> notesEtu = (ArrayList<String[]>) request.getSession().getAttribute("notesEtu"); %>

	<% if (notesEtu.isEmpty()) { %>
        <script>
            alert("Il n'y a aucune notes dans ce module");
            window.location.href = "http://localhost:8080/TP3/Accueil.html";
        </script>
    <% } %>

    <!-- affiche les etudiants et leurs notes sous forme de tableau -->
    <table>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Note</th>
        </tr>
        <% for (String[] note : notesEtu) { %>
            <tr>
                <td><%= note[0] %></td>
                <td><%= note[1] %></td>
                <td><%= note[2] %></td>
            </tr>
        <% } %>
    </table>

</body>
</html>