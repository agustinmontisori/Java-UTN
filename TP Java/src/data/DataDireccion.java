package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;

public class DataDireccion {
	
	public void setDireccion(Nutricionista nut) {
		PreparedStatement stmt=null;
		DataLocalidad dl = new DataLocalidad();
		ResultSet rs=null;	
		Direccion d = new Direccion();
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					  "select cod_postal, calle, altura, piso, depto "
					+ "from direccion "
					+ "where id_nutricionista = ?"
					);
			stmt.setString(1, nut.getDni());
			rs = stmt.executeQuery();
			if(rs != null) {
				d.setCalle(rs.getString("calle"));
				d.setDepto(rs.getString("depto"));
				d.setPiso(rs.getInt("piso"));
				d.setAltura(rs.getInt("altura"));
				nut.setDireccion(d);
				dl.setLocalidad(nut);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(stmt != null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void update(Nutricionista nut) {
		
	}
}
