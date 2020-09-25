package br.edu.insper.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DAO {
private Connection connection = null;
	
	public DAO() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost/tarefas_p1","root","");
	}
	public List<Task> getLista() throws SQLException{
		
		List<Task> tarefas = new ArrayList<Task>();
		PreparedStatement stmt = connection.prepareStatement("SELECT * FROM task_p1");
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			
			Task task = new Task();
			task.setId(rs.getInt("id"));
			task.setTarefa(rs.getNString("task"));
			tarefas.add(task);
		}
		
		rs.close();
		stmt.close();
		
		return tarefas;
		
		
		
	}
	
	public void adiciona (Task task) throws SQLException {
		
		String sql = "INSERT INTO task_p1 (task) VALUES (?)";
		
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setNString(1, task.getTarefa());
		stmt.execute();
		stmt.close();
		
	}
	public void remove (Integer id) throws SQLException {
		String deleta = "DELETE FROM task_p1 WHERE id = ?";
		
		PreparedStatement stmt = connection.prepareStatement(deleta);
		stmt.setLong(1, id);
		stmt.execute();
		stmt.close();
		
	}
	
	public void altera(Task tarefas) throws SQLException {
		String altera = " UPDATE task_p1 SET  task =? WHERE id = ?;";
		PreparedStatement stmt = connection.prepareStatement(altera);
		stmt.setNString(1, tarefas.getTarefa());
		stmt.setInt(2, tarefas.getId());
		stmt.execute();
		stmt.close();
	}
	
	public void close() throws SQLException {
		connection.close();
	}

}
