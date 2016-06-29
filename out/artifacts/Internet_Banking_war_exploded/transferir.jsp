<%@include file="_header.jsp" %>
			

<h1 id="title">Transferir</h1>

<form action="contaserv" method="post">
    <input type="hidden" name="comando" value="transferir" />
  <div class="form-group">
    <label for="valorTransferencia">Valor a ser transferido</label>
    <input type="text" class="form-control" name="valorTransferencia"
           id="valorTransferencia" placeholder="Valor da transferencia">
  </div>
  <button type="submit" class="btn btn-primary">Transferir</button>
</form>


<%@include file="_footer.jsp" %>