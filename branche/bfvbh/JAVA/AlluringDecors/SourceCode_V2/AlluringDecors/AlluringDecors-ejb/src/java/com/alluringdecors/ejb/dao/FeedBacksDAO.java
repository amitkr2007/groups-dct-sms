package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.FeedBacksDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of FeedBacks table from database
@Stateless
@LocalBean
public class FeedBacksDAO {

    public ArrayList<FeedBacksDTO> selectAll() {
        ArrayList<FeedBacksDTO> list = new ArrayList<FeedBacksDTO>();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FeedBacks_SelectAll()}");
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                FeedBacksDTO feedbacks = new FeedBacksDTO();
                feedbacks.setID(rs.getInt("ID"));
                feedbacks.setTiitle(rs.getString("Tiitle"));
                feedbacks.setContent(rs.getString("Content"));
                feedbacks.setFullName(rs.getString("FullName"));
                feedbacks.setEmail(rs.getString("Email"));
                feedbacks.setPostDate(rs.getDate("PostDate"));
                feedbacks.setIsReplied(rs.getBoolean("IsReplied"));
                list.add(feedbacks);
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return list;
    }

    public FeedBacksDTO selectById(int id) {
        FeedBacksDTO feedbacks = new FeedBacksDTO();
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FeedBacks_SelectByID(?)}");
            cs.setInt(1, id);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                feedbacks.setID(rs.getInt("ID"));
                feedbacks.setTiitle(rs.getString("Tiitle"));
                feedbacks.setContent(rs.getString("Content"));
                feedbacks.setFullName(rs.getString("FullName"));
                feedbacks.setEmail(rs.getString("Email"));
                feedbacks.setPostDate(rs.getDate("PostDate"));
                feedbacks.setIsReplied(rs.getBoolean("IsReplied"));
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return feedbacks;
    }

    public boolean insert(FeedBacksDTO feedbacks) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FeedBacks_Insert(?, ?, ?, ?, ?, ?)}");
            cs.setString(1, feedbacks.getTiitle());
            cs.setString(2, feedbacks.getContent());
            cs.setString(3, feedbacks.getFullName());
            cs.setString(4, feedbacks.getEmail());
            cs.setDate(5, new java.sql.Date(feedbacks.getPostDate().getTime()));
            cs.setBoolean(6, feedbacks.getIsReplied());
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean update(FeedBacksDTO feedbacks) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FeedBacks_Update(?, ?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, feedbacks.getID());
            cs.setString(2, feedbacks.getTiitle());
            cs.setString(3, feedbacks.getContent());
            cs.setString(4, feedbacks.getFullName());
            cs.setString(5, feedbacks.getEmail());
            cs.setDate(6, new java.sql.Date(feedbacks.getPostDate().getTime()));
            cs.setBoolean(7, feedbacks.getIsReplied());
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean delete(int id) {
        boolean result = true;
        Connection connect = null;
        try {
            connect = DataAccessHelper.getConnection();
            CallableStatement cs = connect.prepareCall("{call usp_FeedBacks_Delete(?)}");
            cs.setInt(1, id);
            int n = cs.executeUpdate();
            if (n == 0) {
                result = false;
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
            result = false;
        } finally {
            try {
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(FeedBacksDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }
}
