package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ProjectsDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

// Data access object, which get data of Projects table from database
@Stateless
@LocalBean
public class ProjectsDAO {

    public ArrayList<ProjectsDTO> selectAll() {
        ArrayList<ProjectsDTO> list = new ArrayList<ProjectsDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Projects_SelectAll");
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                ProjectsDTO projects = new ProjectsDTO();
                projects.setID(rs.getInt("ID"));
                projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
                projects.setProjectStatus(rs.getString("ProjectStatus"));
                projects.setName(rs.getString("Name"));
                projects.setImage(rs.getString("Image"));
                projects.setDescription(rs.getString("Description"));
                projects.setBriefDescription(rs.getString("BriefDescription"));
                java.sql.Date adate1 = rs.getDate("StartDate");
                projects.setStartDate(adate1 == null ? new Date() : new Date(adate1.getTime()));
                list.add(projects);
            }
            rs.close();
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
            CallableStatement cs = connect.prepareCall("exec usp_Projects_SelectByID ?");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                projects.setID(rs.getInt("ID"));
                projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
                projects.setProjectStatus(rs.getString("ProjectStatus"));
                projects.setName(rs.getString("Name"));
                projects.setImage(rs.getString("Image"));
                projects.setDescription(rs.getString("Description"));
                projects.setBriefDescription(rs.getString("BriefDescription"));
                java.sql.Date adate1 = rs.getDate("StartDate");
                projects.setStartDate(adate1 == null ? new Date() : new Date(adate1.getTime()));
            }
            rs.close();
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
            CallableStatement cs = connect.prepareCall("exec usp_Projects_Insert ?, ?, ?, ?, ?, ?, ?");
            cs.setInt(1, projects.getIDServiceRequest());
            cs.setString(2, projects.getProjectStatus());
            cs.setString(3, projects.getName());
            cs.setString(4, projects.getImage());
            cs.setString(5, projects.getDescription());
            cs.setString(6, projects.getBriefDescription());
            cs.setDate(7, new java.sql.Date(projects.getStartDate().getTime()));
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
        } catch (SQLException ex) {
            result = false;
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
            CallableStatement cs = connect.prepareCall("exec usp_Projects_Update ?, ?, ?, ?, ?, ?, ?, ?");
            cs.setInt(1, projects.getID());
            cs.setInt(2, projects.getIDServiceRequest());
            cs.setString(3, projects.getProjectStatus());
            cs.setString(4, projects.getName());
            cs.setString(5, projects.getImage());
            cs.setString(6, projects.getDescription());
            cs.setString(7, projects.getBriefDescription());
            cs.setDate(8, new java.sql.Date(projects.getStartDate().getTime()));
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
        } catch (SQLException ex) {
            result = false;
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
            CallableStatement cs = connect.prepareCall("exec usp_Projects_Delete ?");
            cs.setInt(1, id);
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
        } catch (SQLException ex) {
            result = false;
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
            CallableStatement cs = connect.prepareCall("exec usp_Projects_SelectByIDServiceRequest ?");
            cs.setInt(1, idservicerequest);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                ProjectsDTO projects = new ProjectsDTO();
                projects.setID(rs.getInt("ID"));
                projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
                projects.setProjectStatus(rs.getString("ProjectStatus"));
                projects.setName(rs.getString("Name"));
                projects.setImage(rs.getString("Image"));
                projects.setDescription(rs.getString("Description"));
                projects.setBriefDescription(rs.getString("BriefDescription"));
                java.sql.Date adate1 = rs.getDate("StartDate");
                projects.setStartDate(adate1 == null ? new Date() : new Date(adate1.getTime()));
                list.add(projects);
            }
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

    public ArrayList<ProjectsDTO> selectByIDProjectStatus(String idprojectstatus) {
        ArrayList<ProjectsDTO> list = new ArrayList<ProjectsDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Projects_SelectByIDProjectStatus ?");
            cs.setString(1, idprojectstatus);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                ProjectsDTO projects = new ProjectsDTO();
                projects.setID(rs.getInt("ID"));
                projects.setIDServiceRequest(rs.getInt("IDServiceRequest"));
                projects.setProjectStatus(rs.getString("ProjectStatus"));
                projects.setName(rs.getString("Name"));
                projects.setImage(rs.getString("Image"));
                projects.setDescription(rs.getString("Description"));
                projects.setBriefDescription(rs.getString("BriefDescription"));
                java.sql.Date adate1 = rs.getDate("StartDate");
                projects.setStartDate(adate1 == null ? new Date() : new Date(adate1.getTime()));
                list.add(projects);
            }
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
