package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.RequestStatusDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of RequestStatus table from database
@Stateless
@LocalBean
public class RequestStatusDAO {
	public ArrayList<RequestStatusDTO> selectAll() {
		ArrayList<RequestStatusDTO> list = new ArrayList<RequestStatusDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_RequestStatus_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				RequestStatusDTO requeststatus = new RequestStatusDTO();
				requeststatus.setID(rs.getInt("ID"));
				requeststatus.setName(rs.getString("Name"));
				list.add(requeststatus);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public RequestStatusDTO selectById(int id) {
		RequestStatusDTO requeststatus = new RequestStatusDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_RequestStatus_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				requeststatus.setID(rs.getInt("ID"));
				requeststatus.setName(rs.getString("Name"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return requeststatus;
	}

	public boolean insert(RequestStatusDTO requeststatus) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_RequestStatus_Insert(?, ?)}");
			cs.setInt(1, requeststatus.getID());
			cs.setString(2, requeststatus.getName());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(RequestStatusDTO requeststatus) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_RequestStatus_Update(?, ?)}");
			cs.setInt(1, requeststatus.getID());
			cs.setString(2, requeststatus.getName());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_RequestStatus_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RequestStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

}
