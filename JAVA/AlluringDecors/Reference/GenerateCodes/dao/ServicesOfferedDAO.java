package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ServicesOfferedDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of ServicesOffered table from database
@Stateless
@LocalBean
public class ServicesOfferedDAO {
	public ArrayList<ServicesOfferedDTO> selectAll() {
		ArrayList<ServicesOfferedDTO> list = new ArrayList<ServicesOfferedDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServicesOffered_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServicesOfferedDTO servicesoffered = new ServicesOfferedDTO();
				servicesoffered.setID(rs.getInt("ID"));
				servicesoffered.setIDDomainList(rs.getInt("IDDomainList"));
				servicesoffered.setName(rs.getString("Name"));
				servicesoffered.setPrice(rs.getDouble("Price"));
				servicesoffered.setDescription(rs.getString("Description"));
				servicesoffered.setBriefDescription(rs.getString("BriefDescription"));
				servicesoffered.setImage(rs.getString("Image"));
				list.add(servicesoffered);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ServicesOfferedDTO selectById(int id) {
		ServicesOfferedDTO servicesoffered = new ServicesOfferedDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServicesOffered_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				servicesoffered.setID(rs.getInt("ID"));
				servicesoffered.setIDDomainList(rs.getInt("IDDomainList"));
				servicesoffered.setName(rs.getString("Name"));
				servicesoffered.setPrice(rs.getDouble("Price"));
				servicesoffered.setDescription(rs.getString("Description"));
				servicesoffered.setBriefDescription(rs.getString("BriefDescription"));
				servicesoffered.setImage(rs.getString("Image"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return servicesoffered;
	}

	public boolean insert(ServicesOfferedDTO servicesoffered) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServicesOffered_Insert(?, ?, ?, ?, ?, ?)}");
			cs.setInt(1, servicesoffered.getIDDomainList());
			cs.setString(2, servicesoffered.getName());
			cs.setDouble(3, servicesoffered.getPrice());
			cs.setString(4, servicesoffered.getDescription());
			cs.setString(5, servicesoffered.getBriefDescription());
			cs.setString(6, servicesoffered.getImage());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(ServicesOfferedDTO servicesoffered) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServicesOffered_Update(?, ?, ?, ?, ?, ?, ?)}");
			cs.setInt(1, servicesoffered.getID());
			cs.setInt(2, servicesoffered.getIDDomainList());
			cs.setString(3, servicesoffered.getName());
			cs.setDouble(4, servicesoffered.getPrice());
			cs.setString(5, servicesoffered.getDescription());
			cs.setString(6, servicesoffered.getBriefDescription());
			cs.setString(7, servicesoffered.getImage());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServicesOffered_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<ServicesOfferedDTO> selectByIDDomainList(int iddomainlist) {
		ArrayList<ServicesOfferedDTO> list = new ArrayList<ServicesOfferedDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServicesOffered_SelectByIDDomainList(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServicesOfferedDTO servicesoffered = new ServicesOfferedDTO();
				servicesoffered.setID(rs.getInt("ID"));
				servicesoffered.setIDDomainList(rs.getInt("IDDomainList"));
				servicesoffered.setName(rs.getString("Name"));
				servicesoffered.setPrice(rs.getDouble("Price"));
				servicesoffered.setDescription(rs.getString("Description"));
				servicesoffered.setBriefDescription(rs.getString("BriefDescription"));
				servicesoffered.setImage(rs.getString("Image"));
				list.add(servicesoffered);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServicesOfferedDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
