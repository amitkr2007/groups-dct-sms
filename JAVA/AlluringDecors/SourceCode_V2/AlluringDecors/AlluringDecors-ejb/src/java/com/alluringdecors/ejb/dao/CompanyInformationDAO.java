package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.CompanyInformationDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of CompanyInformation table from database
@Stateless
@LocalBean
public class CompanyInformationDAO {

    public ArrayList<CompanyInformationDTO> selectAll() {
        ArrayList<CompanyInformationDTO> list = new ArrayList<CompanyInformationDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_CompanyInformation_SelectAll()}");
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                CompanyInformationDTO companyinformation = new CompanyInformationDTO();
                companyinformation.setID(rs.getInt("ID"));
                companyinformation.setAddress(rs.getString("Address"));
                companyinformation.setPhone(rs.getString("Phone"));
                companyinformation.setCompanyDescription(rs.getString("CompanyDescription"));
                companyinformation.setServiceDescription(rs.getString("ServiceDescription"));
                companyinformation.setBriefCompanyDescription(rs.getString("BriefCompanyDescription"));
                companyinformation.setBriefServiceDescription(rs.getString("BriefServiceDescription"));
                companyinformation.setPreferExplanation(rs.getString("PreferExplanation"));
                list.add(companyinformation);
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public CompanyInformationDTO selectById(int id) {
        CompanyInformationDTO companyinformation = new CompanyInformationDTO();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_CompanyInformation_SelectByID(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                companyinformation.setID(rs.getInt("ID"));
                companyinformation.setAddress(rs.getString("Address"));
                companyinformation.setPhone(rs.getString("Phone"));
                companyinformation.setCompanyDescription(rs.getString("CompanyDescription"));
                companyinformation.setServiceDescription(rs.getString("ServiceDescription"));
                companyinformation.setBriefCompanyDescription(rs.getString("BriefCompanyDescription"));
                companyinformation.setBriefServiceDescription(rs.getString("BriefServiceDescription"));
                companyinformation.setPreferExplanation(rs.getString("PreferExplanation"));
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return companyinformation;
    }

    public boolean insert(CompanyInformationDTO companyinformation) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_CompanyInformation_Insert(?, ?, ?, ?, ?, ?, ?)}");
            cs.setString(1, companyinformation.getAddress());
            cs.setString(2, companyinformation.getPhone());
            cs.setString(3, companyinformation.getCompanyDescription());
            cs.setString(4, companyinformation.getServiceDescription());
            cs.setString(5, companyinformation.getBriefCompanyDescription());
            cs.setString(6, companyinformation.getBriefServiceDescription());
            cs.setString(7, companyinformation.getPreferExplanation());
            
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean update(CompanyInformationDTO companyinformation) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_CompanyInformation_Update(?, ?, ?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, companyinformation.getID());
            cs.setString(2, companyinformation.getAddress());
            cs.setString(3, companyinformation.getPhone());
            cs.setString(4, companyinformation.getCompanyDescription());
            cs.setString(5, companyinformation.getServiceDescription());
            cs.setString(6, companyinformation.getBriefCompanyDescription());
            cs.setString(7, companyinformation.getBriefServiceDescription());
            cs.setString(8, companyinformation.getPreferExplanation());
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean delete(int id) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_CompanyInformation_Delete(?)}");
            cs.setInt(1, id);
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(CompanyInformationDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }
}
