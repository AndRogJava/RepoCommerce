<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Form</title>
  <link rel="stylesheet" href="registration.css">
</head>
<body>
<% String messaggio = (String) request.getAttribute("msg"); %>
<div class="wrapper">
  <div class="title">
    Registration Form
  </div>
  <div class="form">
    <div class="inputfield">
      <label>Username</label>
      <input id="username" type="text" class="input" required>
    </div>

    <div class="inputfield">
      <label>Nome</label>
      <input id="nome" type="text" class="input" required>
    </div>
    <div class="inputfield">
      <label>Cognome</label>
      <input id="cognome" type="text" class="input" required>
    </div>
    <div class="inputfield">
      <label>Password</label>
      <input id="password" type="password" class="input" required>
    </div>
    <div class="inputfield">
      <label>Conferma Password</label>
      <input type="password" class="input" required>
    </div>

    <div class="inputfield">
      <label>Data di nascita</label>
      <input id="data_nascita" type="date" class="input" placeholder="dd/mm/yyyy" required>
    </div>

    <div class="inputfield">
      <label>Via</label>
      <input id="via" type="text" class="input" required>
      <label style="margin-left: 10px">Numero</label>
      <input id="numero" type="text" class="input" required>
    </div>
    <div class="inputfield">
      <label>Citta'</label>
      <input id="citta" type="text" class="input" required>
      <label style="margin-left: 10px">CAP</label>
      <input id="cap" type="number" class="input" required>
    </div>
    <div class="inputfield terms">
      <label class="check">
        <input type="checkbox">
        <span class="checkmark"></span>
      </label>
      <p>Agreed to terms and conditions</p>
    </div>
    <div class="inputfield">
      <input type="submit" value="Registrati" class="btn">
    </div>
    <%
      if(messaggio != null){ %>
        <p align="left"><% messaggio.toString(); %></p>
    <% } %>
  </div>
</div>
</body>
</html>
