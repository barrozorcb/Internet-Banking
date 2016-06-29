<%@include file="_header.jsp" %>
			

<h1 id="title">Sacar</h1>

<form action="contaserv" method="post">
    <input type="hidden" name="comando" value="sacar" />
  <div class="form-group">
    <label for="valorSaque">Valor a ser sacado</label>
    <input type="text" class="form-control" name="valorSaque" id="valorSaque" placeholder="Valor do saque">
  </div>
  <button type="submit" class="btn btn-primary">Sacar</button>
</form>


<%@include file="_footer.jsp" %>