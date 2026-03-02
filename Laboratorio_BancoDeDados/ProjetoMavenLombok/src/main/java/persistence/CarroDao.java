package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Carro;

public class CarroDao {
	private GenericDao gDao = new GenericDao();
	
	public void inserir(Carro car) throws Exception{
		Connection c = gDao.getConnection();
		String sql = "INSERT INTO Carro VALUES(?,?,?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, car.getPlaca());
		ps.setString(2, car.getMarca());
		ps.setString(3, car.getModelo());
		ps.setInt(4, car.getAno());
		ps.setString(5, car.getCor());
		ps.executeUpdate();
		ps.close();
		c.close();
	}
	
	public List<Carro> listar() throws Exception{
		Connection c = gDao.getConnection();
		String sql = "SELECT * FROM carro";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<Carro> lista = new ArrayList<>();
		while(rs.next()) {
			Carro car = new Carro();
			car.setPlaca(rs.getString("placa"));
			car.setMarca(rs.getString("marca"));
			car.setModelo(rs.getString("modelo"));
			car.setAno(rs.getInt("ano"));
			car.setCor(rs.getString("cor"));
			lista.add(car);
		}
		rs.close();
		ps.close();
		c.close();
		return lista;
	}
}
