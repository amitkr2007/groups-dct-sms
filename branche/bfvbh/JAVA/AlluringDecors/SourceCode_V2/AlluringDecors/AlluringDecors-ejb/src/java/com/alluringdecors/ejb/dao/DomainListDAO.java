package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.DomainListDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of DomainList table from database
@Stateless
@LocalBean
public class DomainListDAO {

    public ArrayList<DomainListDTO> selectAll() {
        ArrayList<DomainListDTO> list = new ArrayList<DomainListDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_DomainList_SelectAll()}");
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                DomainListDTO domainlist = new DomainListDTO();
                domainlist.setID(rs.getInt("ID"));
                domainlist.setName(rs.getString("Name"));
                list.add(domainlist);
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public DomainListDTO selectById(int id) {
        DomainListDTO domainlist = new DomainListDTO();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_DomainList_SelectByID(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                domainlist.setID(rs.getInt("ID"));
                domainlist.setName(rs.getString("Name"));
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return domainlist;
    }

    public boolean insert(DomainListDTO domainlist) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_DomainList_Insert(?)}");
            cs.setString(1, domainlist.getName());
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean update(DomainListDTO domainlist) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_DomainList_Update(?, ?)}");
            cs.setInt(1, domainlist.getID());
            cs.setString(2, domainlist.getName());
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean delete(int id) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_DomainList_Delete(?)}");
            cs.setInt(1, id);
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
            result = false;
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(DomainListDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }
}
