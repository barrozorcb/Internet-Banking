<%@page import="business.Conta"%>
<%
    String nrConta = (String) session.getAttribute("nrConta");

    if (nrConta == null) {
        response.sendRedirect("login.jsp?erro=invasao");
    }
    
    Conta conta = (Conta) session.getAttribute("conta");
%>
<jsp:useBean id="beanConta" class="business.Conta" scope="page"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Internet Banking</title>
        <link href="./include/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./include/css/style.css">
        <link rel="stylesheet" href="./include/css/sweetalert.css">
    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-2"></div>
                <div class="col-lg-8 col-md-8 col-sm-8">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Internet Banking</h3>
                        </div>
                        <div class="panel-body">
                            <div id="banner">
                                <div class="row">
                                    <div class="col-lg-1 col-md-1 col-sm-1">
                                        <img src="include/img/banco.jpg" class="img-responsive" alt="">
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-8">
                                        <h2>Banco do Porquinho</h2>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3">
                                        <h5 class="text-right"><% out.print("Olá, " + conta.getNomeCliente());%></h5>
                                    </div>
                                </div>
                            </div>

                            <div id="sidebar-a">
                                <ul id="menu">
                                    <li><a href="index.jsp">Principal</a></li>
                                    <hr/>
                                    <li><a href="sacar.jsp">Sacar</a></li>
                                    <li><a href="depositar.jsp">Depositar</a></li>
                                    <li><a href="transferir.jsp">Transferir</a></li>
                                    <li><a href="extrato.jsp">Extrato Bancário</a></li>
                                    <hr/>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </div>
                            <div id="content">

                                <br/>
                                
                        

        




