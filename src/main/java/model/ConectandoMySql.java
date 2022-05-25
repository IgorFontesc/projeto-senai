package model;



import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

public class ConectandoMySql {
	
	private String user = "root";
	private String password = "Holzie784598@";
	
			public Connection conectarBd () throws SQLException, ClassNotFoundException
			{
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				String Url = "jdbc:mysql://localhost/conectarBd?useTimezone=true&serverTimezone=UTC";
				java.sql.Connection conexao = DriverManager.getConnection(Url,this.user,this.password);
			
				return conexao;
				
			}
			
			
			public Vagas buscar(int idVagas) {
				
				Vagas vg=new Vagas();
				try {
					ConectandoMySql bd = new ConectandoMySql();
					Connection conexao = bd.conectarBd();

					
					String sql = "SELECT * FROM tblVagas where idVagas ="+ idVagas;
					PreparedStatement statement = conexao.prepareStatement(sql);
					//ps.setInt(1, idaux);
					
					ResultSet rs = statement.executeQuery();
					while (rs.next()) {				
						vg.setDescricao(rs.getString(2));
						vg.setRequisitosobrigatorios(rs.getString(3)); 
						vg.setRequisitosdesejaveis(rs.getString(4));
						vg.setRemuneracao(rs.getString(5));
						vg.setBeneficios(rs.getString(6));
						vg.setLocaldetrabalho(rs.getString(7)); 
						vg.setAberta(rs.getString(8));
					}

				} catch (Exception e) {
					System.out.println("Erro em Listar:" + e);
				}
				
				return vg;
			}

			
		public void editar(Vagas vg)
			{
				try {
					ConectandoMySql bd = new ConectandoMySql();
					Connection conexao = bd.conectarBd();
					
					
					String sql = "Update tblVagas set "					
							+ "descricao=?,"
							+ "requisitosobrigatorios=?,"
							+ "requisitosdesejaveis=?,"
							+ "remuneracao=?,"
							+ "beneficios=?,"
							+ "localdetrabalho=?,"
							+ "aberta=?"										
							+ " where idVagas=? ";
					
					PreparedStatement statement = (PreparedStatement) conexao.prepareStatement(sql);
					
					statement.setString(1, vg.getDescricao());
					statement.setString(2, vg. getRequisitosobrigatorios()); 
					statement.setString(3, vg.getRequisitosdesejaveis());
					statement.setString(4, vg.getRemuneracao());
					statement.setString(5, vg.getBeneficios());
					statement.setString(6, vg.getLocaldetrabalho()); 
					statement.setString(7, vg.getAberta());
					statement.setInt(8, vg.getId());
					
					 statement.execute();	
			
				} catch (Exception e) {
					System.out.println("Erro ao Editar:" + e.getMessage());
				}
			
			}
}