<%@include file="_header.jsp" %>
			

<h1 id="title">Depositar</h1>

<form action="contaserv" method="post">
    <input type="hidden" name="comando" value="depositar" />
  <div class="form-group">
    <label for="valorDeposito">Valor a ser depositado</label>
    <input type="text" class="form-control" name="valorDeposito" id="valorDeposito" placeholder="Valor do deposito">
  </div>
  <button type="submit" class="btn btn-primary">Depositar</button>
</form>


<%@include file="_footer.jsp" %>