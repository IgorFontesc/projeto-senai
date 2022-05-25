package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * @author igor fontes
 *
 */

public class Vagas {
	
	
	private int id;
	private String descricao;
	private String requisitosobrigatorios;
	private String requisitosdesejaveis;
	private String remuneracao;
	private String beneficios;
	private String localdetrabalho;
	private String aberta;
	


	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAberta() {
		return aberta;
	}

	public void setAberta(String aberta) {
		this.aberta = aberta;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getRequisitosobrigatorios() {
		return requisitosobrigatorios;
	}

	public void setRequisitosobrigatorios(String requisitosobrigatorios) {
		this.requisitosobrigatorios = requisitosobrigatorios;
	}

	public String getRequisitosdesejaveis() {
		return requisitosdesejaveis;
	}

	public void setRequisitosdesejaveis(String requisitosdesejaveis) {
		this.requisitosdesejaveis = requisitosdesejaveis;
	}

	public String getRemuneracao() {
		return remuneracao;
	}

	public void setRemuneracao(String remuneracao) {
		this.remuneracao = remuneracao;
	}

	public String getBeneficios() {
		return beneficios;
	}

	public void setBeneficios(String beneficios) {
		this.beneficios = beneficios;
	}

	public String getLocaldetrabalho() {
		return localdetrabalho;
	}

	public void setLocaldetrabalho(String localdetrabalho) {
		this.localdetrabalho = localdetrabalho;
	}
	
	

	public boolean inserirVaga () throws ClassNotFoundException, SQLException {
		
		
		try {
				
		ConectandoMySql bd = new ConectandoMySql();
		
		Connection conexao = bd.conectarBd();
		//script sql
		String sql = "insert into tblVagas (descricao, requisitosobrigatorios, requisitosdesejaveis, remuneracao, "
				+ "beneficios, localdetrabalho, aberta) values (?, ?, ?, ?, ?, ?, ?)";
		
		//instancia para o objeto Statement para tratar valores
		PreparedStatement statement = (PreparedStatement) conexao.prepareStatement(sql);
		
		//agrega os valores do atributos da classe a serem colocados no script SQL
		statement.setString(1, this.descricao);
		statement.setString(2, this.requisitosobrigatorios);
		statement.setString(3, this.requisitosdesejaveis);
		statement.setString(4, this.remuneracao);
		statement.setString(5, this.beneficios);
		statement.setString(6, this.localdetrabalho);
		statement.setString(7, this.aberta);
		
		
		System.out.println(this.descricao);
		
		//excuta NO bd i script SQL
		statement.execute();
		
		//feCha o statement e a conexao com o BD
		statement.close();
		conexao.close();
		
		}catch (Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		
		return true;
		
	}
		
		
	public void excluirVaga (int idVagas){
		
		try	{
			ConectandoMySql bd = new ConectandoMySql();
			Connection conexao = bd.conectarBd();
			
			String sql = "delete from tblVagas where idVagas =" + idVagas;
			
			PreparedStatement statement = (PreparedStatement) conexao.prepareStatement(sql);
			
			statement.execute();
			
			}catch (Exception e) {
				
			
			}
		
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
				vg.setDescricao(rs.getString(1));
				vg.setRequisitosobrigatorios(rs.getString(2)); 
				vg.setRequisitosdesejaveis(rs.getString(3));
				vg.setRemuneracao(rs.getString(4));
				vg.setBeneficios(rs.getString(5));
				vg.setLocaldetrabalho(rs.getString(6)); 
				vg.setAberta(rs.getString(7));
			}

		} catch (Exception e) {
			System.out.println("Erro em Listar:" + e);
		}
		
		return vg;
	}

	
	
}
	

