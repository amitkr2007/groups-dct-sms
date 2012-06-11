package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ServiceRequestsDTO;
import com.alluringdecors.ejb.dto.UserDTO;
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
                servicerequests.setRequestStatus(rs.getString("RequestStatus"));
                servicerequests.setRequestDate(rs.getDate("RequestDate"));
                servicerequests.setLocation(rs.getString("Location"));
                servicerequests.setPhoneLocation(rs.getString("PhoneLocation"));
                servicerequests.setMailLocation(rs.getString("MailLocation"));
                servicerequests.setNote(rs.getString("Note"));

                UserDTO user = new UserDTO();
                user.setID(servicerequests.getIDUser());
                user.setRole(rs.getString("Role"));
                user.setUserName(rs.getString("UserName"));
                user.setName(rs.getString("Name"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setBirthday(rs.getDate("Birthday"));
                user.setSex(rs.getBoolean("Sex"));
                user.setStartDate(rs.getDate("StartDate"));

                servicerequests.setUser(user);

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
                servicerequests.setRequestStatus(rs.getString("RequestStatus"));
                servicerequests.setRequestDate(rs.getDate("RequestDate"));
                servicerequests.setLocation(rs.getString("Location"));
                servicerequests.setPhoneLocation(rs.getString("PhoneLocation"));
                servicerequests.setMailLocation(rs.getString("MailLocation"));
                servicerequests.setNote(rs.getString("Note"));

                UserDTO user = new UserDTO();
                user.setID(servicerequests.getIDUser());
                user.setRole(rs.getString("Role"));
                user.setUserName(rs.getString("UserName"));
                user.setName(rs.getString("Name"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setBirthday(rs.getDate("Birthday"));
                user.setSex(rs.getBoolean("Sex"));
                user.setStartDate(rs.getDate("StartDate"));

                servicerequests.setUser(user);
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
            CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_Insert(?, ?, ?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, servicerequests.getIDUser());
            cs.setString(2, servicerequests.getRequestStatus());
            cs.setDate(3, new java.sql.Date(servicerequests.getRequestDate().getTime()));
            cs.setString(4, servicerequests.getLocation());
            cs.setString(5, servicerequests.getPhoneLocation());
            cs.setString(6, servicerequests.getMailLocation());
            cs.setString(7, servicerequests.getNote());
            cs.registerOutParameter(8, java.sql.Types.INTEGER);
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            servicerequests.setID(cs.getInt(8));
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
            CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_Update(?, ?, ?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, servicerequests.getID());
            cs.setInt(2, servicerequests.getIDUser());
            cs.setString(3, servicerequests.getRequestStatus());
            cs.setDate(4, new java.sql.Date(servicerequests.getRequestDate().getTime()));
            cs.setString(5, servicerequests.getLocation());
            cs.setString(6, servicerequests.getPhoneLocation());
            cs.setString(7, servicerequests.getMailLocation());
            cs.setString(8, servicerequests.getNote());
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
            result = false;
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
            cs.setInt(1, iduser);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                ServiceRequestsDTO servicerequests = new ServiceRequestsDTO();
                servicerequests.setID(rs.getInt("ID"));
                servicerequests.setIDUser(rs.getInt("IDUser"));
                servicerequests.setRequestStatus(rs.getString("RequestStatus"));
                servicerequests.setRequestDate(rs.getDate("RequestDate"));
                servicerequests.setLocation(rs.getString("Location"));
                servicerequests.setPhoneLocation(rs.getString("PhoneLocation"));
                servicerequests.setMailLocation(rs.getString("MailLocation"));
                servicerequests.setNote(rs.getString("Note"));

                UserDTO user = new UserDTO();
                user.setID(servicerequests.getIDUser());
                user.setRole(rs.getString("Role"));
                user.setUserName(rs.getString("UserName"));
                user.setName(rs.getString("Name"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setBirthday(rs.getDate("Birthday"));
                user.setSex(rs.getBoolean("Sex"));
                user.setStartDate(rs.getDate("StartDate"));

                servicerequests.setUser(user);

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

    public ArrayList<ServiceRequestsDTO> selectByRequestStatus(String requeststatus) {
        ArrayList<ServiceRequestsDTO> list = new ArrayList<ServiceRequestsDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_ServiceRequests_SelectByRequestStatus(?)}");
            cs.setString(1, requeststatus);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                ServiceRequestsDTO servicerequests = new ServiceRequestsDTO();
                servicerequests.setID(rs.getInt("ID"));
                servicerequests.setIDUser(rs.getInt("IDUser"));
                servicerequests.setRequestStatus(rs.getString("RequestStatus"));
                servicerequests.setRequestDate(rs.getDate("RequestDate"));
                servicerequests.setLocation(rs.getString("Location"));
                servicerequests.setPhoneLocation(rs.getString("PhoneLocation"));
                servicerequests.setMailLocation(rs.getString("MailLocation"));
                servicerequests.setNote(rs.getString("Note"));

                UserDTO user = new UserDTO();
                user.setID(servicerequests.getIDUser());
                user.setRole(rs.getString("Role"));
                user.setUserName(rs.getString("UserName"));
                user.setName(rs.getString("Name"));
                user.setAddress(rs.getString("Address"));
                user.setPhone(rs.getString("Phone"));
                user.setEmail(rs.getString("Email"));
                user.setBirthday(rs.getDate("Birthday"));
                user.setSex(rs.getBoolean("Sex"));
                user.setStartDate(rs.getDate("StartDate"));

                servicerequests.setUser(user);

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
