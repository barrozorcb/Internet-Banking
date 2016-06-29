<%@include file="_header.jsp" %>

<p><% String nrContad = (String) session.getAttribute("nrConta");%></p>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h1 id="title" class="text-center">Depositar</h1>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="contaserv" name="deposito" method="post" onsubmit="return valida(this)">
                <input type="hidden" name="comando" value="depositar" />
                <div class="form-group">
                    <input type="text" class="form-control center-block" name="valorDeposito" id="valorDeposito" placeholder="Valor do deposito">
                </div>
                <input type="hidden" name="nrConta" id="nrConta" value="<%=nrContad%>">
                <button type="submit" id="enviar" class="btn btn-primary center-block" >Depositar</button>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>

<%--<%=request.getAttribute("mensagem")%>--%>

<%
    String msg = (String) request.getAttribute("mensagem");
    if(msg == null){
        out.print("<input type='hidden' id='mensagem'>");
    }else{
        out.print("<input type='hidden' id='mensagem' value='" + msg + "'>");
    }
%>


<%@include file="_footer.jsp" %>



<script language="javascript" type="text/javascript">
    
    $(document).ready(function() {

        var msg = document.getElementById('mensagem').value;
        console.log(msg);
        
        if(msg != ""){
            swal("Sucesso!!", "Deposito efetuado com sucesso", "success")
        }
    })
    
    
    function valida(){
        if(deposito.valorDeposito.value == ""){
            swal("Oops...", "Valor do deposito não informado", "error");
            deposito.valorDeposito.focus();
            return false;
        }
    }
    
</script>