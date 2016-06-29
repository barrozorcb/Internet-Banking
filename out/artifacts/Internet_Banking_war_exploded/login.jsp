<html>
    <head> 
        <title>Internet Banking</title>
        <link href="./include/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <form class="form-horizontal" action="login" method="post">
                        <div class="form-group">
                            <label for="nrConta" class="control-label">Número da Conta</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="nrConta" id="nrConta" placeholder="Número da Conta">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="senha" class="control-label">Senha</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default" value="entrar">Entrar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4"></div>
            </div>

        </div>
        <!--<form action="login" method="post">
            Login: <input type="text" name="username" size="20" /><br/>
            Senha: <input type="password" name="password" size="20" /><br/>

            <br/>

            <input type="submit" value="Entrar"/>
        </form>-->

        <%
            String erro = request.getParameter("erro");

            if (erro != null) {
                if (erro.equals("invasao")) {
                    out.print("<font color=white>Área restrita. Entre com nome e senha</font>");
                }
            }
        %>

        <script src="./include/js/bootstrap.min.js"></script>
    </body>
</html>







