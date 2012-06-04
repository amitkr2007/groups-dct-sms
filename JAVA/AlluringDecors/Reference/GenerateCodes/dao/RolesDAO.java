package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.RolesDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of Roles table from database
@Stateless
@LocalBean
public class RolesDAO {
	public ArrayList<RolesDTO> selectAll() {
		ArrayList<RolesDTO> list = new ArrayList<RolesDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Roles_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				RolesDTO roles = new RolesDTO();
				roles.setID(rs.getInt("ID"));
				roles.setName(rs.getString("Name"));
				list.add(roles);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public RolesDTO selectById(int id) {
		RolesDTO roles = new RolesDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Roles_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				roles.setID(rs.getInt("ID"));
				roles.setName(rs.getString("Name"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return roles;
	}

	public boolean insert(RolesDTO roles) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Roles_Insert(?)}");
			cs.setString(1, roles.getName());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(RolesDTO roles) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Roles_Update(?, ?)}");
			cs.setInt(1, roles.getID());
			cs.setString(2, roles.getName());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Roles_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RolesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

}
