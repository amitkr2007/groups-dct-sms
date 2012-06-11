package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ServiceRequestDetailDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of ServiceRequestDetail table from database
@Stateless
@LocalBean
public class ServiceRequestDetailDAO {
	public ArrayList<ServiceRequestDetailDTO> selectAll() {
		ArrayList<ServiceRequestDetailDTO> list = new ArrayList<ServiceRequestDetailDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequestDetail_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServiceRequestDetailDTO servicerequestdetail = new ServiceRequestDetailDTO();
				servicerequestdetail.setID(rs.getInt("ID"));
				servicerequestdetail.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				servicerequestdetail.setIDServiceOffered(rs.getInt("IDServiceOffered"));
				servicerequestdetail.setPrice(rs.getDouble("Price"));
				servicerequestdetail.setLocationRequest(rs.getString("LocationRequest"));
				list.add(servicerequestdetail);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ServiceRequestDetailDTO selectById(int id) {
		ServiceRequestDetailDTO servicerequestdetail = new ServiceRequestDetailDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequestDetail_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				servicerequestdetail.setID(rs.getInt("ID"));
				servicerequestdetail.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				servicerequestdetail.setIDServiceOffered(rs.getInt("IDServiceOffered"));
				servicerequestdetail.setPrice(rs.getDouble("Price"));
				servicerequestdetail.setLocationRequest(rs.getString("LocationRequest"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return servicerequestdetail;
	}

	public boolean insert(ServiceRequestDetailDTO servicerequestdetail) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequestDetail_Insert(?, ?, ?, ?)}");
			cs.setInt(1, servicerequestdetail.getIDServiceRequest());
			cs.setInt(2, servicerequestdetail.getIDServiceOffered());
			cs.setDouble(3, servicerequestdetail.getPrice());
			cs.setString(4, servicerequestdetail.getLocationRequest());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(ServiceRequestDetailDTO servicerequestdetail) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequestDetail_Update(?, ?, ?, ?, ?)}");
			cs.setInt(1, servicerequestdetail.getID());
			cs.setInt(2, servicerequestdetail.getIDServiceRequest());
			cs.setInt(3, servicerequestdetail.getIDServiceOffered());
			cs.setDouble(4, servicerequestdetail.getPrice());
			cs.setString(5, servicerequestdetail.getLocationRequest());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequestDetail_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<ServiceRequestDetailDTO> selectByIDServiceRequest(int idservicerequest) {
		ArrayList<ServiceRequestDetailDTO> list = new ArrayList<ServiceRequestDetailDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequestDetail_SelectByIDServiceRequest(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServiceRequestDetailDTO servicerequestdetail = new ServiceRequestDetailDTO();
				servicerequestdetail.setID(rs.getInt("ID"));
				servicerequestdetail.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				servicerequestdetail.setIDServiceOffered(rs.getInt("IDServiceOffered"));
				servicerequestdetail.setPrice(rs.getDouble("Price"));
				servicerequestdetail.setLocationRequest(rs.getString("LocationRequest"));
				list.add(servicerequestdetail);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ArrayList<ServiceRequestDetailDTO> selectByIDServiceOffered(int idserviceoffered) {
		ArrayList<ServiceRequestDetailDTO> list = new ArrayList<ServiceRequestDetailDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ServiceRequestDetail_SelectByIDServiceOffered(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ServiceRequestDetailDTO servicerequestdetail = new ServiceRequestDetailDTO();
				servicerequestdetail.setID(rs.getInt("ID"));
				servicerequestdetail.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				servicerequestdetail.setIDServiceOffered(rs.getInt("IDServiceOffered"));
				servicerequestdetail.setPrice(rs.getDouble("Price"));
				servicerequestdetail.setLocationRequest(rs.getString("LocationRequest"));
				list.add(servicerequestdetail);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ServiceRequestDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
