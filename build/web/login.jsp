<html>
    <head> 
        <title>Internet Banking</title>
        <link href="./include/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./include/css/sweetalert.css">
    </head>
    <body>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4"></div>
            <div class="col-md-4"></div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-center">Login</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-8">
                                    <form action="login" method="post">
                                        <div class="form-group">
                                            <label for="nrConta">Número da Conta</label>
                                            <input type="text" class="form-control" name="nrConta" id="nrConta" placeholder="Número da Conta">
                                        </div>
                                        <div class="form-group">
                                            <label for="senha">Senha</label>
                                            <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha">
                                        </div>

                                        <button type="submit" class="btn btn-primary center-block">Entrar</button>
                                    </form>
                                    <div>
                                        <a href="cadastro.jsp">Novo Cadastro</a>
                                    </div>
                                </div>
                                <div class="col-lg-2"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4"></div>
            </div>
        </div>

        <%
            String erro = request.getParameter("erro");

            if (erro != null) {
                if (erro.equals("invasao")) {
                    out.print("<font color=white>Área restrita. Entre com nome e senha</font>");
                }
            }
        %>

        <%
            String msg = (String) request.getAttribute("mensagem");
            if (msg == null) {
                out.print("<input type='hidden' id='mensagem'>");
            } else {
                out.print("<input type='hidden' id='mensagem' value='" + msg + "'>");
            }
        %>
            
        <%
            String msgErro = (String) request.getAttribute("erro");
            if (msgErro == null) {
                out.print("<input type='hidden' id='erro'>");
            } else {
                out.print("<input type='hidden' id='erro' value='" + msgErro + "'>");
            }
        %>

        <script src="./include/js/jquery.min.js"></script>
        <script src="./include/js/jquery.mask.min.js"></script>
        <script src="./include/js/bootstrap.min.js"></script>
        <script src="./include/js/sweetalert.min.js"></script>

        <script language="javascript" type="text/javascript">
            $(document).ready(function () {
                $("#nrConta").mask("99999-9");

                var msg = document.getElementById('mensagem').value;
                console.log(msg);

                if (msg != "") {
                    swal("Sucesso!!", "Conta criada com sucesso", "success")
                }
                
                var msgErro = document.getElementById('erro').value;
                console.log(msgErro);

                if (msgErro != "") {
                    swal("Opss!!", "Número de conta já cadastrada", "error")
                }
            })
        </script>
    </body>
</html>







