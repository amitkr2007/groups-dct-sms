package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.BillsDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
                bills.setTotalPaidAmount(rs.getDouble("TotalPaidAmount"));
                bills.setBalanceAmount(rs.getDouble("BalanceAmount"));
                bills.setDueAmount(rs.getDouble("DueAmount"));
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
                bills.setTotalPaidAmount(rs.getDouble("TotalPaidAmount"));
                bills.setBalanceAmount(rs.getDouble("BalanceAmount"));
                bills.setDueAmount(rs.getDouble("DueAmount"));
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
            cs.setDate(2, new java.sql.Date(bills.getDatePaid().getTime()));
            cs.setDouble(3, bills.getTotalPaidAmount());
            cs.setDouble(4, bills.getBalanceAmount());
            cs.setDouble(5, bills.getDueAmount());
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

    public boolean update(BillsDTO bills) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_Bills_Update(?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, bills.getID());
            cs.setInt(2, bills.getIDServiceRequest());
            cs.setDate(3, new java.sql.Date(bills.getDatePaid().getTime()));
            cs.setDouble(4, bills.getTotalPaidAmount());
            cs.setDouble(5, bills.getBalanceAmount());
            cs.setDouble(6, bills.getDueAmount());
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
            cs.setInt(1, idservicerequest);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                BillsDTO bills = new BillsDTO();
                bills.setID(rs.getInt("ID"));
                bills.setIDServiceRequest(rs.getInt("IDServiceRequest"));
                bills.setDatePaid(rs.getDate("DatePaid"));
                bills.setTotalPaidAmount(rs.getDouble("TotalPaidAmount"));
                bills.setBalanceAmount(rs.getDouble("BalanceAmount"));
                bills.setDueAmount(rs.getDouble("DueAmount"));
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
