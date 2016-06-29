package servlets;

import business.Conta;
import dao.ContaDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NovaContaServlet extends HttpServlet implements Servlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String nomeCliente = request.getParameter("nomeCliente");
        String cpf = request.getParameter("cpf");
        String numeroConta = request.getParameter("numeroConta");
        String tipoConta = request.getParameter("tipoConta");
        String senha = request.getParameter("senha");
        String confirmaSenha = request.getParameter("confirmaSenha");

        if (senha.equals(confirmaSenha)) {
            try {
                Conta conta = new Conta();
                conta.setNomeCliente(nomeCliente);
                conta.setCpf(cpf);
                conta.setNrConta(numeroConta);
                conta.setTipoConta(tipoConta);
                conta.setSenha(senha);
                conta.setSaldo(0);

                ContaDAO dao = new ContaDAO();
                try {
                    dao.criaConta(conta);
                    String msg = "Conta criada com sucesso!";
                    request.setAttribute("mensagem", msg);
                    request.getRequestDispatcher("./login.jsp").forward(request, response);
                } catch (Exception ex) {
                    String msgErro = "Numero de conta já cadastrado!!!";
                    request.setAttribute("erro", msgErro);
                    request.getRequestDispatcher("./login.jsp").forward(request, response);
                    Logger.getLogger(NovaContaServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(NovaContaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("login.jsp?msg=Não foi possivel criar a conta!.");
        }

    }

}
