<%
    String username = (String) session.getAttribute("nrConta");

    if (username == null)
        response.sendRedirect("login.jsp?erro=invasao");
%>
<jsp:useBean id="beanConta" class="business.Conta" scope="page"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <style>

        #container {
            border: 3px solid #000;
            padding: 0;
            BACKGROUND-IMAGE: url('include/common/logo-estacio-horizontal.png');
            BACKGROUND-REPEAT: no-repeat;
            BACKGROUND-COLOR: white;
            BACKGROUND-POSITION: left top;
            WIDTH: 760px;
            TEXT-ALIGN: left
        }

        #banner {
            BORDER-BOTTOM: #000 2px solid;
            height: 57px;
        }

        #menu {
            DISPLAY: block;
            width: 150px;
        }

        #menu a {
            font-family: Verdana, Arial, sans-serif;
            FONT-WEIGHT: bold;
            FONT-SIZE: 0.8em;
            COLOR: rgb(0, 105, 163);
            LINE-HEIGHT: 180%;
            TEXT-DECORATION: none;
        }

        #menu a:hover, #menu a.active {
            COLOR: rgb(161, 210, 251);
            BORDER-BOTTOM: #999966 1px dotted
        }

        #menu UL {
            padding: 0;
            MARGIN: 0;
        }

        #menu LI {
            BACKGROUND-IMAGE: url('common/bglih.png');
            BACKGROUND-REPEAT: repeat-x;
            MARGIN-BOTTOM: 3px;
            LIST-STYLE-TYPE: none
        }


    </style>

    <title>Internet Banking</title>

</head>

<body>

<div id="container">

    <div id="banner">
        <p align="right" id="estacio"><% out.print("Olá, " + session.getAttribute("username")); %></p>
    </div>

    <div id="sidebar-a">
        <ul id="menu">
            <li><a href="index.jsp">Principal</a></li>
            <hr/>
            <li><a href="sacar.jsp">Sacar</a></li>
            <li><a href="depositar.jsp">Depositar</a></li>
            <li><a href="transferir.jsp">Transferir</a></li>
            <hr/>
            <li><a href="logout">Logout</a></li>
        </ul>
    </div>

    <div id="content">

        <br/>
    </div>
</div>