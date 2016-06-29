<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro nova conta</title>
        <link href="./include/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Cadastro</h3>
                        </div>
                        <div class="panel-body">
                            <form action="novaConta" method="post">
                                <div class="form-group">
                                    <label for="nomeCliente">Nome</label>
                                    <input type="text" class="form-control" name="nomeCliente" id="nomeCliente" placeholder="Nome Completo">
                                </div>
                                <div class="form-group">
                                    <label for="cpf">CPF</label>
                                    <input type="text" class="form-control" name="cpf" id="cpf" placeholder="CPF">
                                </div>
                                <div class="form-group">
                                    <label for="numeroConta">Número da Conta</label>
                                    <input type="text" class="form-control" name="numeroConta" id="numeroConta" placeholder="Número da conta">
                                </div>
                                <div class="form-group">
                                    <label>Tipo da Conta</label>
                                    <select class="form-control" name="tipoConta" id="tipoConta">
                                        <option value=""></option>
                                        <option value="contaCorrente">Conta Corrente</option>
                                        <option value="contaPoupanca">Conta Poupança</option>
                                        <option value="contaSalario">Conta Salário</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="senha">Senha</label>
                                    <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha">
                                </div>
                                <div class="form-group">
                                    <label for="confirmaSenha">Repita a Senha</label>
                                    <input type="password" class="form-control" name="confirmaSenha" id="confirmaSenha" placeholder="Repita a Senha">
                                </div>

                                <button type="submit" class="btn btn-primary center-block">Cadastrar</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4"></div>
            </div>
        </div>
        
        <script src="./include/js/bootstrap.min.js"></script>
        <script src="./include/js/jquery.min.js"></script>
        <script src="./include/js/jquery.mask.min.js"></script>
        <script>
            $("#numeroConta").mask("99999-9");
            $("#cpf").mask("999.999.999-99");
        </script>
    </body>
</html>
