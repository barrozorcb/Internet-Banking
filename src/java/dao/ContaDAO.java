package dao;

import Banco.ConnectDB;
import business.Conta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ContaDAO {

    private Conta conta;
    private ConnectDB con;

    public static ArrayList<String> lista = new ArrayList<String>();

    public ContaDAO() throws ClassNotFoundException {
        this.conta = new Conta();
        this.con = ConnectDB.obterInstancia();
        //lista.add("Saldo Inicial e de R$ " + conta.getSaldo());
    }
    
    public ContaDAO(String nrConta) throws ClassNotFoundException, SQLException {
        
        this.con = ConnectDB.obterInstancia();
        this.conta = consultaRegistroPorNrConta(nrConta);
        if(ContaDAO.lista.isEmpty()){
            ContaDAO.lista.add("Saldo Inicial e de R$ " + conta.getSaldo());
        }
    }

    public void sacar(int valor) throws SQLException {
        int novoSaldo = conta.getSaldo() - valor;
        updateSaldoConta(conta.getNrConta(), novoSaldo);
        Conta cont = consultaRegistroPorNrConta(conta.getNrConta());
        //conta.setSaldo(novoSaldo);
        //this.lista.add("Saque no valor de R$ " + valor);
        //this.lista.add("Novo saldo e R$ " + conta.getSaldo());
        
        gerarLista("Saque no valor de R$ ", "Novo saldo e R$ ", valor, cont.getSaldo());
    }

    public void depositar(int valor) throws SQLException {
        int novoSaldo = conta.getSaldo() + valor;
        updateSaldoConta(conta.getNrConta(), novoSaldo);
        Conta cont = consultaRegistroPorNrConta(conta.getNrConta());
        //conta.setSaldo(novoSaldo);
        //this.lista.add("Deposito no valor de R$ " + valor);
        //this.lista.add("Novo saldo e R$ " + conta.getSaldo());
        
        gerarLista("Deposito no valor de R$ ", "Novo saldo e R$ ", valor, cont.getSaldo());
    }

    public void tranferir(int valor) throws SQLException {
        int novoSaldo = 0;
        if (valor <= conta.getSaldo()) {
            novoSaldo = conta.getSaldo() - valor;
        }
        updateSaldoConta(conta.getNrConta(), novoSaldo);
        Conta cont = consultaRegistroPorNrConta(conta.getNrConta());
        //conta.setSaldo(novoSaldo);
        //this.lista.add("Transferencia no valor de R$ " + valor);
        //this.lista.add("Novo saldo e R$ " + conta.getSaldo());
        
        gerarLista("Transferencia no valor de R$ ", "Novo saldo e R$ ", valor, cont.getSaldo());
        
        
    }

    public void gerarLista(String msg1, String msg2, int valor, int novoSaldo) {
        ContaDAO.lista.add(msg1 + " " + valor);
        ContaDAO.lista.add(msg2 + " " + novoSaldo);
        
    }
    
    public ArrayList getLista(){
        return this.lista;
    }

    public Conta getConta() {
        return this.conta;
    }

    public void criaConta(Conta conta) throws SQLException {

        Conta verificaConta = consultaRegistroPorNrConta(conta.getNrConta());

        String sql = "INSERT INTO Conta (nomeCliente, senha, cpf, tipoConta, saldo, nrConta) "
                + "values (?,?,?,?,?,?)";

        try {
            if (!conta.getNrConta().equals(verificaConta.getNrConta())) {

                Connection connection = this.con.obterConexao();
                
                PreparedStatement stmt = connection.prepareStatement(sql);

                stmt.setString(1, conta.getNomeCliente());
                stmt.setString(2, conta.getSenha());
                stmt.setString(3, conta.getCpf());
                stmt.setString(4, conta.getTipoConta());
                stmt.setString(5, String.valueOf(conta.getSaldo()));
                stmt.setString(6, String.valueOf(conta.getNrConta()));

                stmt.execute();
                stmt.close();
            }else{
                throw new Exception();
            }
        } catch (Exception e) {
            System.out.println(e);
        } 

    }

    public Conta consultaRegistroPorNrConta(String nrConta) throws SQLException {

        String sql = "SELECT * FROM Conta WHERE NRCONTA = '" + nrConta + "'";
        Conta contaSelect = new Conta();

        try {
            
            Connection connection = this.con.obterConexao();
            
            Statement stmt = connection.createStatement();

            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {

                contaSelect.setNomeCliente(rs.getString("nomeCliente"));
                contaSelect.setCpf(rs.getString("cpf"));
                contaSelect.setSenha(rs.getString("senha"));
                contaSelect.setSaldo(Integer.parseInt(rs.getString("saldo")));
                contaSelect.setTipoConta(rs.getString("tipoConta"));
                contaSelect.setNrConta(rs.getString("nrConta"));
            }

            stmt.close();
            return contaSelect;
        } catch (SQLException e) {
            System.out.println(e);
        }

        return new Conta();
    }
    
    public void updateSaldoConta(String nrConta, int novoSaldo) {
        String sql = "UPDATE Conta SET saldo=? WHERE nrconta=?";

        try {
            Connection connection = this.con.obterConexao();

            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, String.valueOf(novoSaldo));
            stmt.setString(2, nrConta);

            stmt.execute();
            stmt.close();
        } catch (Exception e) {
            System.out.print(e);
        }

    }

}
