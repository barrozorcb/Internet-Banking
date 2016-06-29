<%@page import="java.util.ArrayList"%>
<%@include file="_header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h1 id="title" class="text-center">Extrato Bancário</h1>
        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <%
                ArrayList movimentacoes = (ArrayList) request.getAttribute("lista");

                if (movimentacoes.size() == 0) {
                    out.print("Não há nenhuma movimentação na conta!");
                } else {
                    out.print("<table class='table table-striped text-center'>");
                    for (int i = 0; i < movimentacoes.size(); i++) {
                        out.print("<tr><td>" + movimentacoes.get(i) + "</td></tr>");
                    }
                    out.print("</table>");
                }
            %>
        </div>
    </div>
</div>

<%@include file="_footer.jsp" %>