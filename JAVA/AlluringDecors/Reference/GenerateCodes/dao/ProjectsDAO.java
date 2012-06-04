package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ProjectsDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of Projects table from database
@Stateless
@LocalBean
public class ProjectsDAO {
	public ArrayList<ProjectsDTO> selectAll() {
		ArrayList<ProjectsDTO> list = new ArrayList<ProjectsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Projects_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ProjectsDTO projects = new ProjectsDTO();
				projects.setID(rs.getInt("ID"));
				projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				projects.setIDProjectStatus(rs.getInt("IDProjectStatus"));
				projects.setName(rs.getString("Name"));
				projects.setImage(rs.getString("Image"));
				projects.setDescription(rs.getString("Description"));
				projects.setBriefDescription(rs.getString("BriefDescription"));
				projects.setStartDate(rs.getDate("StartDate"));
				list.add(projects);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ProjectsDTO selectById(int id) {
		ProjectsDTO projects = new ProjectsDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Projects_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				projects.setID(rs.getInt("ID"));
				projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				projects.setIDProjectStatus(rs.getInt("IDProjectStatus"));
				projects.setName(rs.getString("Name"));
				projects.setImage(rs.getString("Image"));
				projects.setDescription(rs.getString("Description"));
				projects.setBriefDescription(rs.getString("BriefDescription"));
				projects.setStartDate(rs.getDate("StartDate"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return projects;
	}

	public boolean insert(ProjectsDTO projects) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Projects_Insert(?, ?, ?, ?, ?, ?, ?)}");
			cs.setInt(1, projects.getIDServiceRequest());
			cs.setInt(2, projects.getIDProjectStatus());
			cs.setString(3, projects.getName());
			cs.setString(4, projects.getImage());
			cs.setString(5, projects.getDescription());
			cs.setString(6, projects.getBriefDescription());
			cs.setDate(7, projects.getStartDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(ProjectsDTO projects) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Projects_Update(?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.setInt(1, projects.getID());
			cs.setInt(2, projects.getIDServiceRequest());
			cs.setInt(3, projects.getIDProjectStatus());
			cs.setString(4, projects.getName());
			cs.setString(5, projects.getImage());
			cs.setString(6, projects.getDescription());
			cs.setString(7, projects.getBriefDescription());
			cs.setDate(8, projects.getStartDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Projects_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<ProjectsDTO> selectByIDServiceRequest(int idservicerequest) {
		ArrayList<ProjectsDTO> list = new ArrayList<ProjectsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Projects_SelectByIDServiceRequest(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ProjectsDTO projects = new ProjectsDTO();
				projects.setID(rs.getInt("ID"));
				projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				projects.setIDProjectStatus(rs.getInt("IDProjectStatus"));
				projects.setName(rs.getString("Name"));
				projects.setImage(rs.getString("Image"));
				projects.setDescription(rs.getString("Description"));
				projects.setBriefDescription(rs.getString("BriefDescription"));
				projects.setStartDate(rs.getDate("StartDate"));
				list.add(projects);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ArrayList<ProjectsDTO> selectByIDProjectStatus(int idprojectstatus) {
		ArrayList<ProjectsDTO> list = new ArrayList<ProjectsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Projects_SelectByIDProjectStatus(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ProjectsDTO projects = new ProjectsDTO();
				projects.setID(rs.getInt("ID"));
				projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				projects.setIDProjectStatus(rs.getInt("IDProjectStatus"));
				projects.setName(rs.getString("Name"));
				projects.setImage(rs.getString("Image"));
				projects.setDescription(rs.getString("Description"));
				projects.setBriefDescription(rs.getString("BriefDescription"));
				projects.setStartDate(rs.getDate("StartDate"));
				list.add(projects);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ProjectsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
