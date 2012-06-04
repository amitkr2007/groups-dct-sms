package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.BillsDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of Bills table from database
@Stateless
@LocalBean
public class BillsDAO {
	public ArrayList<BillsDTO> selectAll() {
		ArrayList<BillsDTO> list = new ArrayList<BillsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Bills_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				BillsDTO bills = new BillsDTO();
				bills.setID(rs.getInt("ID"));
				bills.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				bills.setDatePaid(rs.getDate("DatePaid"));
				bills.setBalanceAmount(rs.getDouble("BalanceAmount"));
				bills.setDueAmount(rs.getDouble("DueAmount"));
				bills.setTotalPaidAmont(rs.getDouble("TotalPaidAmont"));
				list.add(bills);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public BillsDTO selectById(int id) {
		BillsDTO bills = new BillsDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Bills_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				bills.setID(rs.getInt("ID"));
				bills.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				bills.setDatePaid(rs.getDate("DatePaid"));
				bills.setBalanceAmount(rs.getDouble("BalanceAmount"));
				bills.setDueAmount(rs.getDouble("DueAmount"));
				bills.setTotalPaidAmont(rs.getDouble("TotalPaidAmont"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return bills;
	}

	public boolean insert(BillsDTO bills) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Bills_Insert(?, ?, ?, ?, ?)}");
			cs.setInt(1, bills.getIDServiceRequest());
			cs.setDate(2, bills.getDatePaid());
			cs.setDouble(3, bills.getBalanceAmount());
			cs.setDouble(4, bills.getDueAmount());
			cs.setDouble(5, bills.getTotalPaidAmont());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(BillsDTO bills) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Bills_Update(?, ?, ?, ?, ?, ?)}");
			cs.setInt(1, bills.getID());
			cs.setInt(2, bills.getIDServiceRequest());
			cs.setDate(3, bills.getDatePaid());
			cs.setDouble(4, bills.getBalanceAmount());
			cs.setDouble(5, bills.getDueAmount());
			cs.setDouble(6, bills.getTotalPaidAmont());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Bills_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<BillsDTO> selectByIDServiceRequest(int idservicerequest) {
		ArrayList<BillsDTO> list = new ArrayList<BillsDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Bills_SelectByIDServiceRequest(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				BillsDTO bills = new BillsDTO();
				bills.setID(rs.getInt("ID"));
				bills.setIDServiceRequest(rs.getInt("IDServiceRequest"));
				bills.setDatePaid(rs.getDate("DatePaid"));
				bills.setBalanceAmount(rs.getDouble("BalanceAmount"));
				bills.setDueAmount(rs.getDouble("DueAmount"));
				bills.setTotalPaidAmont(rs.getDouble("TotalPaidAmont"));
				list.add(bills);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(BillsDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
