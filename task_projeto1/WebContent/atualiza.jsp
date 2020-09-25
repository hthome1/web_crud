<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<%@ page import= "java.util.*, br.edu.insper.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edição</title>
</head>
<body>
<form action="Atualiza" method = 'post'>
	atualizacao: <input type="text" name="atualizacao"/><br/>
	<input type= "hidden" name ="id" value = "<%= request.getParameter("id") %>">
	<input type="submit" value="Atualizar" /> 
</form>

</body>
</html>