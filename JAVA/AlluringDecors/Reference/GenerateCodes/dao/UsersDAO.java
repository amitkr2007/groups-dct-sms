package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.UsersDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of Users table from database
@Stateless
@LocalBean
public class UsersDAO {
	public ArrayList<UsersDTO> selectAll() {
		ArrayList<UsersDTO> list = new ArrayList<UsersDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Users_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				UsersDTO users = new UsersDTO();
				users.setID(rs.getInt("ID"));
				users.setIDRole(rs.getInt("IDRole"));
				users.setUserName(rs.getString("UserName"));
				users.setPassword(rs.getString("Password"));
				users.setName(rs.getString("Name"));
				users.setAddress(rs.getString("Address"));
				users.setPhone(rs.getString("Phone"));
				users.setEmail(rs.getString("Email"));
				users.setBirthday(rs.getDate("Birthday"));
				users.setSex(rs.getBoolean("Sex"));
				users.setStartDate(rs.getDate("StartDate"));
				list.add(users);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public UsersDTO selectById(int id) {
		UsersDTO users = new UsersDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Users_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				users.setID(rs.getInt("ID"));
				users.setIDRole(rs.getInt("IDRole"));
				users.setUserName(rs.getString("UserName"));
				users.setPassword(rs.getString("Password"));
				users.setName(rs.getString("Name"));
				users.setAddress(rs.getString("Address"));
				users.setPhone(rs.getString("Phone"));
				users.setEmail(rs.getString("Email"));
				users.setBirthday(rs.getDate("Birthday"));
				users.setSex(rs.getBoolean("Sex"));
				users.setStartDate(rs.getDate("StartDate"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return users;
	}

	public boolean insert(UsersDTO users) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Users_Insert(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.setInt(1, users.getIDRole());
			cs.setString(2, users.getUserName());
			cs.setString(3, users.getPassword());
			cs.setString(4, users.getName());
			cs.setString(5, users.getAddress());
			cs.setString(6, users.getPhone());
			cs.setString(7, users.getEmail());
			cs.setDate(8, users.getBirthday());
			cs.setBoolean(9, users.getSex());
			cs.setDate(10, users.getStartDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(UsersDTO users) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Users_Update(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
			cs.setInt(1, users.getID());
			cs.setInt(2, users.getIDRole());
			cs.setString(3, users.getUserName());
			cs.setString(4, users.getPassword());
			cs.setString(5, users.getName());
			cs.setString(6, users.getAddress());
			cs.setString(7, users.getPhone());
			cs.setString(8, users.getEmail());
			cs.setDate(9, users.getBirthday());
			cs.setBoolean(10, users.getSex());
			cs.setDate(11, users.getStartDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Users_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<UsersDTO> selectByIDRole(int idrole) {
		ArrayList<UsersDTO> list = new ArrayList<UsersDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Users_SelectByIDRole(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				UsersDTO users = new UsersDTO();
				users.setID(rs.getInt("ID"));
				users.setIDRole(rs.getInt("IDRole"));
				users.setUserName(rs.getString("UserName"));
				users.setPassword(rs.getString("Password"));
				users.setName(rs.getString("Name"));
				users.setAddress(rs.getString("Address"));
				users.setPhone(rs.getString("Phone"));
				users.setEmail(rs.getString("Email"));
				users.setBirthday(rs.getDate("Birthday"));
				users.setSex(rs.getBoolean("Sex"));
				users.setStartDate(rs.getDate("StartDate"));
				list.add(users);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
