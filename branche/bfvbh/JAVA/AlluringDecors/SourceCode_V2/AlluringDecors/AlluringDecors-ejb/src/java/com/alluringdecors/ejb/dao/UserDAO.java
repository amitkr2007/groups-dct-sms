/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.UserDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

/**
 *
 * @author Administrator
 */
@Stateless
@LocalBean
public class UserDAO {

    public ArrayList<UserDTO> selectAll() {
        ArrayList<UserDTO> list = new ArrayList<UserDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Users_SelectAll");
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                UserDTO users = new UserDTO();
                users.setID(rs.getInt("ID"));
                users.setRole(rs.getString("Role"));
                users.setUserName(rs.getString("UserName"));
                users.setPassword(rs.getString("Password"));
                users.setName(rs.getString("Name"));
                users.setAddress(rs.getString("Address"));
                users.setPhone(rs.getString("Phone"));
                users.setEmail(rs.getString("Email"));
                java.sql.Date adate = rs.getDate("Birthday");
                users.setBirthday(adate == null ? new Date() : new Date(adate.getTime()));
                users.setSex(rs.getBoolean("Sex"));
                java.sql.Date adate1 = rs.getDate("StartDate");
                users.setStartDate(adate1 == null ? new Date() : new Date(adate1.getTime()));
		users.setAlreadyPurchase(this.userIsAlreadyPurchaseServices(rs.getInt("ID")));
                list.add(users);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public UserDTO selectById(int id) {
        UserDTO users = new UserDTO();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Users_SelectByID ?");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                users.setID(rs.getInt("ID"));
                users.setRole(rs.getString("Role"));
                users.setUserName(rs.getString("UserName"));
                users.setPassword(rs.getString("Password"));
                users.setName(rs.getString("Name"));
                users.setAddress(rs.getString("Address"));
                users.setPhone(rs.getString("Phone"));
                users.setEmail(rs.getString("Email"));
                java.sql.Date adate = rs.getDate("Birthday");
                users.setBirthday(adate == null ? new Date() : new Date(adate.getTime()));
                users.setSex(rs.getBoolean("Sex"));
                java.sql.Date adate1 = rs.getDate("StartDate");
                users.setStartDate(adate1 == null ? new Date() : new Date(adate1.getTime()));
		users.setAlreadyPurchase(this.userIsAlreadyPurchaseServices(rs.getInt("ID")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return users;
    }

    public boolean insert(UserDTO user) {
        boolean result = false;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Users_Insert ?, ?, ?, ?, ?, ?, ?, ?, ?, ?");

            cs.setString(1, user.getRole());
            cs.setString(2, user.getUserName().trim());
            cs.setString(3, user.getPassword().trim());
            cs.setString(4, user.getName().trim());
            cs.setString(5, user.getAddress());
            cs.setString(6, user.getPhone());
            cs.setString(7, user.getEmail());
            cs.setDate(8, new java.sql.Date(user.getBirthday().getTime()));
            cs.setBoolean(9, user.getSex());
            cs.setDate(10, new java.sql.Date(user.getStartDate().getTime()));

            int n = cs.executeUpdate();
            if (n != 0) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean update(UserDTO user) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Users_Update ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?");

            cs.setInt(1, user.getID());
            cs.setString(2, user.getRole());
            cs.setString(3, user.getUserName());
            cs.setString(4, user.getPassword());
            cs.setString(5, user.getName());
            cs.setString(6, user.getAddress());
            cs.setString(7, user.getPhone());
            cs.setString(8, user.getEmail());
            cs.setDate(9, new java.sql.Date(user.getBirthday().getTime()));
            cs.setBoolean(10, user.getSex());
            cs.setDate(11, new java.sql.Date(user.getStartDate().getTime()));

            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean delete(int id) {
        boolean result = false;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Users_Delete ?");
            cs.setInt(1, id);
            int n = cs.executeUpdate();
            if (n != 0) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            result = false;
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

//    public ArrayList<UserDTO> selectByIDRole(int idrole) {
//        ArrayList<UserDTO> list = new ArrayList<UserDTO>();
//        Connection connect = null;
//        try {
//            connect = DataAccessHelper.getConnection();
//            CallableStatement cs = connect.prepareCall("exec usp_Users_SelectByIDRole ?");
//            ResultSet rs = cs.executeQuery();
//            while (rs.next()) {
//                UserDTO users = new UserDTO();
//                users.setID(rs.getInt("ID"));
//                users.setRole(rs.getString("Role"));
//                users.setUserName(rs.getString("UserName"));
//                users.setPassword(rs.getString("Password"));
//                users.setName(rs.getString("Name"));
//                users.setAddress(rs.getString("Address"));
//                users.setPhone(rs.getString("Phone"));
//                users.setEmail(rs.getString("Email"));
//               java.sql.Date adate = rs.getDate("Birthday");
//                users.setBirthday(adate == null ? new Date() : new Date(adate.getTime()));
//                users.setSex(rs.getBoolean("Sex"));
//		java.sql.Date adate1 = rs.getDate("StartDate");
//                users.setBirthday(adate1 == null ? new Date() : new Date(adate1.getTime()));
//                list.add(users);
//            }
//            rs.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                connect.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return list;
//    }
    public UserDTO checkForLogin(String username, String password) {
        UserDTO users = new UserDTO();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("exec usp_Users_CheckForLogin ?, ?");
            cs.setString(1, username);
            cs.setString(2, password);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                users.setID(rs.getInt("ID"));
                users.setRole(rs.getString("Role"));
                users.setUserName(rs.getString("UserName"));
                users.setPassword(rs.getString("Password"));
                users.setName(rs.getString("Name"));
                users.setAddress(rs.getString("Address"));
                users.setPhone(rs.getString("Phone"));
                users.setEmail(rs.getString("Email"));
                java.sql.Date adate = rs.getDate("Birthday");
                users.setBirthday(adate == null ? new Date() : new Date(adate.getTime()));
                users.setSex(rs.getBoolean("Sex"));
                java.sql.Date adate1 = rs.getDate("StartDate");
                users.setStartDate(adate1 == null ? new Date() : new Date(adate1.getTime()));
		users.setAlreadyPurchase(this.userIsAlreadyPurchaseServices(rs.getInt("ID")));
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return users;
    }

    public boolean checAlreadyExistUser(String username) {
        ArrayList<UserDTO> lstUser = this.selectAll();
        for (UserDTO user : lstUser) {
            if (username.equals(user.getUserName())) {
                return true;
            }
        }
        return false;
    }

    public boolean userIsAlreadyPurchaseServices(int userID)
    {
	boolean alreadyPurchase = false;

	Connection connect = null;
	try {
            connect = DataAccessHelper.getConnection();
            Statement cs = connect.createStatement();
            String query = "select * from ServiceRequests where idUser='" + userID + "'";
            ResultSet rs = cs.executeQuery(query);
//            while (rs.next()) {
//		return true;
//            }
	    if (rs.next())
	    {
		alreadyPurchase = true;
	    }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
	return alreadyPurchase;
    }
}
