<%@include file="_header.jsp" %>
<% String nrContad = (String) session.getAttribute("nrConta");%>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h1 id="title" class="text-center">Transferir</h1>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="contaserv" name="transferir" method="post" onsubmit="return valida(this)">
                <input type="hidden" name="comando" value="transferir" />
                <div class="form-group">
                    <input type="text" class="form-control center-block" name="valorTransferencia" id="valorTransferencia" placeholder="Valor da transferencia">
                </div>
                <input type="hidden" name="nrConta" id="nrConta" value="<%=nrContad%>">
                <button type="submit" class="btn btn-primary center-block">Transferir</button>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>

<%
    String msg = (String) request.getAttribute("mensagem");
    if (msg == null) {
        out.print("<input type='hidden' id='mensagem'>");
    } else {
        out.print("<input type='hidden' id='mensagem' value='" + msg + "'>");
    }
%>

<%@include file="_footer.jsp" %>

<script language="javascript" type="text/javascript">
    
    $(document).ready(function() {

        var msg = document.getElementById('mensagem').value;
        console.log(msg);
        
        if(msg != ""){
            swal("Sucesso!!", "Transferencia efetuada com sucesso", "success")
        }
    })
    
    
    function valida(){
        if(transferir.valorTransferencia.value == ""){
            swal("Oops...", "Valor da transferencia não informado", "error");
            deposito.valorDeposito.focus();
            return false;
        }
    }
    
</script>