package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;

public class DataLocalidad {
	public void setLocalidad(Localidad loc) {
		PreparedStatement stmt = null;
		ResultSet rs = null;	
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					"select denominacion from localidad where cod_postal = ?"
					);
			stmt.setInt(1, loc.getCodPostal());
			rs = stmt.executeQuery();
			if(rs != null && rs.next()) {
				loc.setDenominacion(rs.getString("denominacion"));
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
