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

public class LoginServlet extends HttpServlet implements Servlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        String nrConta = request.getParameter("nrConta");
        String senha = request.getParameter("senha");

        try {
            ContaDAO contaDAO = new ContaDAO();

            Conta consultaConta = contaDAO.consultaRegistroPorNrConta(nrConta);

            if (senha.equals(consultaConta.getSenha())) {
                HttpSession session = request.getSession();

                // registra no objeto de sess�o o usu�rio conectado.
                session.setAttribute("nrConta", nrConta);

                // configura time-out de sess�o: a sess�o expira ap�s 10 segundos inativa.
                session.setMaxInactiveInterval(5000);
                
                session.setAttribute("conta", consultaConta);

                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
