<%@include file="_header.jsp" %>
<% String nrContad = (String) session.getAttribute("nrConta");%>
			
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h1 id="title" class="text-center">Extrato Bancário</h1>
        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="contaserv" method="post">
                <input type="hidden" name="comando" value="extrato" />
                <input type="hidden" name="nrConta" id="nrConta" value="<%=nrContad%>">
                <button type="submit" class="btn btn-primary center-block">Emitir Extrato</button>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>

<%@include file="_footer.jsp" %>