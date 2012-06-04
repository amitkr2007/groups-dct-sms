package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.FAQDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of FAQ table from database
@Stateless
@LocalBean
public class FAQDAO {

    public ArrayList<FAQDTO> selectAll() {
        ArrayList<FAQDTO> list = new ArrayList<FAQDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FAQ_SelectAll()}");
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                FAQDTO faq = new FAQDTO();
                faq.setID(rs.getInt("ID"));
                faq.setQuestion(rs.getString("Question"));
                faq.setAnswer(rs.getString("Answer"));
                list.add(faq);
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public FAQDTO selectById(int id) {
        FAQDTO faq = new FAQDTO();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FAQ_SelectByID(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                faq.setID(rs.getInt("ID"));
                faq.setQuestion(rs.getString("Question"));
                faq.setAnswer(rs.getString("Answer"));
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return faq;
    }

    public boolean insert(FAQDTO faq) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FAQ_Insert(?, ?)}");
            cs.setString(1, faq.getQuestion());
            cs.setString(2, faq.getAnswer());
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean update(FAQDTO faq) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FAQ_Update(?, ?, ?)}");
            cs.setInt(1, faq.getID());
            cs.setString(2, faq.getQuestion());
            cs.setString(3, faq.getAnswer());
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean delete(int id) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FAQ_Delete(?)}");
            cs.setInt(1, id);
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FAQDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }
}
