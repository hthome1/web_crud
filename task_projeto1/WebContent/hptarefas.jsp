<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ page import= "java.util.*, br.edu.insper.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Tarefas</title>
</head>
<body>
<h1>Lista de tarefas para serem feitas</h1>

<form action="Adiciona" method = 'post'>
	Tarefa: <input type="text" name="Tarefa"/><br/>
<input type="submit" value="Adicionar tarefa" /> 
</form>
			
<table border = '1'>
<c:forEach var = "tarefas" items = "${tarefas}">
<tr>

<td>${tarefas.tarefa}</td>
<td>

<form action="Remove" method = 'post'>
<input type="submit" value="Deletar"/> 
<input type= "hidden" name ="id" value = "${tarefas.id}">
</form>
</td>
<td>
<form action="Atualiza" method = 'get'>
<input type="submit" value="Editar" />
<input type= "hidden" name ="id" value = "${tarefas.id}">
</form>

</td>

</tr>

</c:forEach>
</table>
</body>
</html>