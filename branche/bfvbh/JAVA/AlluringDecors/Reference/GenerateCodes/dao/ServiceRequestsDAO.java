package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ServiceRequestsDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of ServiceRequests table from database
@Stateless
@LocalBean
public class ServiceRequestsDAO {
	public ArrayList<ServiceRequestsDTO> selectAll() {
		ArrayList<ServiceRequestsDTO> list = new ArrayList<ServiceRequestsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServiceRequestsDTO servicerequests = new ServiceRequestsDTO();
				servicerequests.setID(rs.getInt("ID"));
				servicerequests.setIDUser(rs.getInt("IDUser"));
				servicerequests.setIDRequestStatus(rs.getInt("IDRequestStatus"));
				servicerequests.setRequestDate(rs.getDate("RequestDate"));
				list.add(servicerequests);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ServiceRequestsDTO selectById(int id) {
		ServiceRequestsDTO servicerequests = new ServiceRequestsDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				servicerequests.setID(rs.getInt("ID"));
				servicerequests.setIDUser(rs.getInt("IDUser"));
				servicerequests.setIDRequestStatus(rs.getInt("IDRequestStatus"));
				servicerequests.setRequestDate(rs.getDate("RequestDate"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return servicerequests;
	}

	public boolean insert(ServiceRequestsDTO servicerequests) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_Insert(?, ?, ?)}");
			cs.setInt(1, servicerequests.getIDUser());
			cs.setInt(2, servicerequests.getIDRequestStatus());
			cs.setDate(3, servicerequests.getRequestDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(ServiceRequestsDTO servicerequests) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_Update(?, ?, ?, ?)}");
			cs.setInt(1, servicerequests.getID());
			cs.setInt(2, servicerequests.getIDUser());
			cs.setInt(3, servicerequests.getIDRequestStatus());
			cs.setDate(4, servicerequests.getRequestDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<ServiceRequestsDTO> selectByIDUser(int iduser) {
		ArrayList<ServiceRequestsDTO> list = new ArrayList<ServiceRequestsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_SelectByIDUser(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServiceRequestsDTO servicerequests = new ServiceRequestsDTO();
				servicerequests.setID(rs.getInt("ID"));
				servicerequests.setIDUser(rs.getInt("IDUser"));
				servicerequests.setIDRequestStatus(rs.getInt("IDRequestStatus"));
				servicerequests.setRequestDate(rs.getDate("RequestDate"));
				list.add(servicerequests);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ArrayList<ServiceRequestsDTO> selectByIDRequestStatus(int idrequeststatus) {
		ArrayList<ServiceRequestsDTO> list = new ArrayList<ServiceRequestsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_SelectByIDRequestStatus(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServiceRequestsDTO servicerequests = new ServiceRequestsDTO();
				servicerequests.setID(rs.getInt("ID"));
				servicerequests.setIDUser(rs.getInt("IDUser"));
				servicerequests.setIDRequestStatus(rs.getInt("IDRequestStatus"));
				servicerequests.setRequestDate(rs.getDate("RequestDate"));
				list.add(servicerequests);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
