package servlets;

import business.Conta;
import dao.ContaDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jboss.weld.servlet.SessionHolder;

public class ContaServlet extends HttpServlet {

    //public ContaDAO contaDAO = new ContaDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String comando = request.getParameter("comando");

        if (comando != null) {
            try {
                if (comando.equals("sacar")) {
                    comandoSacar(request, response);
                } else if (comando.equals("depositar")) {
                    comandoDepositar(request, response);
                } else if (comando.equals("transferir")) {
                    comandoTransferir(request, response);
                } else if (comando.equals("extrato")) {
                    comandoEmiteExtrato(request, response);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ContaServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ContaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    private void comandoSacar(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, ClassNotFoundException, SQLException {

        String nrConta = request.getParameter("nrConta");
        int valorSaque = Integer.parseInt(request.getParameter("valorSaque"));
        
        ContaDAO contaDAO = new ContaDAO(nrConta);
        Conta conta = contaDAO.getConta();

        if (conta.getSaldo() > valorSaque) {
            contaDAO.sacar(valorSaque);
            String msg = "Saque efetuado!";
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("sacar.jsp").forward(request, response);
        } else {
            String msg = "";
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("sacar.jsp").forward(request, response);
        }

    }

    private void comandoDepositar(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, ClassNotFoundException, SQLException {
            
            int valorDeposito = Integer.parseInt(request.getParameter("valorDeposito"));
            String nrConta = request.getParameter("nrConta");

            ContaDAO contaDAO = new ContaDAO(nrConta);
            contaDAO.depositar(valorDeposito);
            String msg = "Deposito efetuado!";
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("depositar.jsp").forward(request, response);
     
        
    }

    private void comandoTransferir(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException, ClassNotFoundException, SQLException {
        
        String nrConta = request.getParameter("nrConta");
        int valorTransferencia = Integer.parseInt(request.getParameter("valorTransferencia"));
        
        ContaDAO contaDAO = new ContaDAO(nrConta);
        Conta conta = contaDAO.getConta();
         
        if(conta.getSaldo() > valorTransferencia){
            contaDAO.tranferir(valorTransferencia);
            String msg = "Transferencia efetuado!";
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("transferir.jsp").forward(request, response);
        }else{
            String msg = "";
            request.setAttribute("mensagem", msg);
            request.getRequestDispatcher("transferir.jsp").forward(request, response);
        }

    }

    private void comandoEmiteExtrato(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException, ClassNotFoundException, SQLException {
        
        String nrConta = request.getParameter("nrConta");
        
        ContaDAO contaDAO = new ContaDAO(nrConta);
        ArrayList lista = contaDAO.getLista();

        request.setAttribute("lista", lista);

        RequestDispatcher rd = request.getRequestDispatcher("emitirExtrato.jsp");
        rd.forward(request, response);
    }

}
