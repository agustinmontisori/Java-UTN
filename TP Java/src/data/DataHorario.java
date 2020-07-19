package data;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entidades.*;
import java.util.ArrayList;

public class DataHorario {
	
	public Nutricionista setHorarios(Nutricionista nut) {
		PreparedStatement stmt=null;
		ResultSet rs=null;	
		Horario h;
		ArrayList<Horario> horarios = new ArrayList<>();	
		try {
			stmt=DbConnector.getInstancia().getConn().prepareStatement(
					  "select dia, hora_desde, hora_hasta "
					+ "from horario "
					+ "where id_nutricionista = ?"
					);
			stmt.setString(1, nut.getDni());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					h = new Horario();
					h.setDia(rs.getString("dia"));
					h.setHoraDesde(rs.getTime("hora_desde"));
					h.setHoraHasta(rs.getTime("hora_hasta"));
					horarios.add(h);
				}
				nut.setHorarios(horarios);
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
		return nut;
	}
	
	public void add(Horario hor, Nutricionista nut) {
		PreparedStatement stmt= null;
		try {
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into horario (id_nutricionista, dia, hora_desde, hora_hasta) values (?,?,?,?)"
							);
			stmt.setString(1, nut.getDni());
			stmt.setString(2, hor.getDia());
			stmt.setTime(3, hor.getHoraDesde());
			stmt.setTime(4, hor.getHoraHasta());
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
	
	public void update(Nutricionista nut, Horario hor) {
		PreparedStatement stmt= null;
		try {
			stmt=DbConnector.getInstancia().getConn().
					prepareStatement(
							"update horario set hora_desde = ?, hora_hasta = ? "
							+ "where id_nutricionista = ? and dia = ? and hora_desde = ?"
							);
			stmt.setTime(1, hor.getHoraDesde());
			stmt.setTime(2, hor.getHoraHasta());
			stmt.setString(3, nut.getDni());
			stmt.setString(4, hor.getDia());
			stmt.setTime(5, hor.getHoraDesde());
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
	
	public void remove(Nutricionista nut, Horario hor) {
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"delete from horario where id_nutricionista = ? and dia = ? and hora_desde = ?"
					);
			stmt.setString(1, nut.getDni());
			stmt.setString(2, hor.getDia());
			stmt.setTime(3, hor.getHoraDesde());
			stmt.execute();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) stmt.close();
                DbConnector.getInstancia().releaseConn();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
