package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.ShoppingCartsDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of ShoppingCarts table from database
@Stateless
@LocalBean
public class ShoppingCartsDAO {
	public ArrayList<ShoppingCartsDTO> selectAll() {
		ArrayList<ShoppingCartsDTO> list = new ArrayList<ShoppingCartsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ShoppingCarts_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ShoppingCartsDTO shoppingcarts = new ShoppingCartsDTO();
				shoppingcarts.setID(rs.getInt("ID"));
				shoppingcarts.setIDServiceOffered(rs.getInt("IDServiceOffered"));
				shoppingcarts.setCartID(rs.getString("CartID"));
				shoppingcarts.setCreateDate(rs.getDate("CreateDate"));
				list.add(shoppingcarts);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public ShoppingCartsDTO selectById(int id) {
		ShoppingCartsDTO shoppingcarts = new ShoppingCartsDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ShoppingCarts_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				shoppingcarts.setID(rs.getInt("ID"));
				shoppingcarts.setIDServiceOffered(rs.getInt("IDServiceOffered"));
				shoppingcarts.setCartID(rs.getString("CartID"));
				shoppingcarts.setCreateDate(rs.getDate("CreateDate"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return shoppingcarts;
	}

	public boolean insert(ShoppingCartsDTO shoppingcarts) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ShoppingCarts_Insert(?, ?, ?)}");
			cs.setInt(1, shoppingcarts.getIDServiceOffered());
			cs.setString(2, shoppingcarts.getCartID());
			cs.setDate(3, shoppingcarts.getCreateDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(ShoppingCartsDTO shoppingcarts) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ShoppingCarts_Update(?, ?, ?, ?)}");
			cs.setInt(1, shoppingcarts.getID());
			cs.setInt(2, shoppingcarts.getIDServiceOffered());
			cs.setString(3, shoppingcarts.getCartID());
			cs.setDate(4, shoppingcarts.getCreateDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ShoppingCarts_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<ShoppingCartsDTO> selectByIDServiceOffered(int idserviceoffered) {
		ArrayList<ShoppingCartsDTO> list = new ArrayList<ShoppingCartsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_ShoppingCarts_SelectByIDServiceOffered(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				ShoppingCartsDTO shoppingcarts = new ShoppingCartsDTO();
				shoppingcarts.setID(rs.getInt("ID"));
				shoppingcarts.setIDServiceOffered(rs.getInt("IDServiceOffered"));
				shoppingcarts.setCartID(rs.getString("CartID"));
				shoppingcarts.setCreateDate(rs.getDate("CreateDate"));
				list.add(shoppingcarts);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(ShoppingCartsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
