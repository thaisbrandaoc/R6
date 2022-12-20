<%@page language="java" import="java.sql.*" %>
<%
    String vnome  = request.getParameter("usuario");
    String vsenha  = request.getParameter("password");
    String vemailcad = request.getParameter("email_cad");

    String banco = "formulario";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ; 
    String usuario = "root";
    String senha = "";

    String driver = "com.mysql.jdbc.Driver";
    class.forName(driver); 

    Connection conexao ; 
    conexao = DriverManager.getConnection(endereco, usuario, senha ); 

    String sql = "INSERT INTO usuarios (usuario, password, email_cad) values(?, ?, ?, ?, ?)"; 

    PreparedStatement stm = conexao.prepareStatement (sql); 
    stm.setString(1, vnome);
    stm.setString(2, vsenha);
    stm.setString(3, vemailcad);

    stm.execute();
    stm.close(); 

    out.print ("Dados gravados com sucesso!");
    out.print ("<br> <br>");
    out.print("<a href= "cadastro.html">Voltar</a>");
%>