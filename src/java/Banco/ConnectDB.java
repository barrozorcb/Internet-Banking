package Banco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectDB {

    private Connection conexao;
    private static volatile ConnectDB instanciaUnica;

    //SINGLETON USADO PARA MANTER SEMPRE UMA INSTANCIA DE BANCO
    private ConnectDB() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/InternetBanking", "root", "root");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public static ConnectDB obterInstancia() {
        if (instanciaUnica == null) {
            synchronized (ConnectDB.class) {
                if (instanciaUnica == null) {
                    instanciaUnica = new ConnectDB();
                }
            }
        }
        return instanciaUnica;
    }

    public Connection obterConexao() {
        if (conexao != null) {
            return conexao;
        } else {
            throw new NullPointerException("Variavel conexão não iniciada.");
        }
    }

}
