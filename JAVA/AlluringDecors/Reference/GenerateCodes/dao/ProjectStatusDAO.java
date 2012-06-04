package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ProjectStatusDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of ProjectStatus table from database
@Stateless
@LocalBean
public class ProjectStatusDAO {
	public ArrayList<ProjectStatusDTO> selectAll() {
		ArrayList<ProjectStatusDTO> list = new ArrayList<ProjectStatusDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ProjectStatus_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ProjectStatusDTO projectstatus = new ProjectStatusDTO();
				projectstatus.setID(rs.getInt("ID"));
				projectstatus.setName(rs.getString("Name"));
				list.add(projectstatus);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ProjectStatusDTO selectById(int id) {
		ProjectStatusDTO projectstatus = new ProjectStatusDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ProjectStatus_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				projectstatus.setID(rs.getInt("ID"));
				projectstatus.setName(rs.getString("Name"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return projectstatus;
	}

	public boolean insert(ProjectStatusDTO projectstatus) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ProjectStatus_Insert(?)}");
			cs.setString(1, projectstatus.getName());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(ProjectStatusDTO projectstatus) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ProjectStatus_Update(?, ?)}");
			cs.setInt(1, projectstatus.getID());
			cs.setString(2, projectstatus.getName());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ProjectStatus_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectStatusDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

}
