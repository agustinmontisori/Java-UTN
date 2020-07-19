package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;

public class DataLocalidad {
	public void setLocalidad(Nutricionista nut) {
		PreparedStatement stmt = null;
		ResultSet rs = null;	
		Localidad l = new Localidad();
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					  "select l.denominacion, l.cod_postal "
					+ "from localidad l "
					+ "inner join direccion d "
					+ "on l.cod_postal = d.cod_postal "
					+ "where d.id_nutricionista = ?"
					);
			stmt.setString(1, nut.getDni());
			rs= stmt.executeQuery();
			if(rs!=null) {
				l.setCodPostal(rs.getInt("cod_postal"));
				l.setDenominacion(rs.getString("denominacion"));
				nut.getDireccion().setLocalidad(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
