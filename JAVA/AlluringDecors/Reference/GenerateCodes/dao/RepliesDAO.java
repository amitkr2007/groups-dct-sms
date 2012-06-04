package com.alluringdecors.ejb.dao;

import com.alluringdecors.ejb.dto.RepliesDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.util.logging.Level;
import java.util.logging.Logger;

// Data access object, which get data of Replies table from database
@Stateless
@LocalBean
public class RepliesDAO {
	public ArrayList<RepliesDTO> selectAll() {
		ArrayList<RepliesDTO> list = new ArrayList<RepliesDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Replies_SelectAll()}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				RepliesDTO replies = new RepliesDTO();
				replies.setID(rs.getInt("ID"));
				replies.setIDFeedBack(rs.getInt("IDFeedBack"));
				replies.setReplyContent(rs.getString("ReplyContent"));
				replies.setReplyName(rs.getString("ReplyName"));
				replies.setReplyDate(rs.getDate("ReplyDate"));
				list.add(replies);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

	public RepliesDTO selectById(int id) {
		RepliesDTO replies = new RepliesDTO();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Replies_SelectByID(?)}");
			cs.setInt(1, id);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				replies.setID(rs.getInt("ID"));
				replies.setIDFeedBack(rs.getInt("IDFeedBack"));
				replies.setReplyContent(rs.getString("ReplyContent"));
				replies.setReplyName(rs.getString("ReplyName"));
				replies.setReplyDate(rs.getDate("ReplyDate"));
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return replies;
	}

	public boolean insert(RepliesDTO replies) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Replies_Insert(?, ?, ?, ?)}");
			cs.setInt(1, replies.getIDFeedBack());
			cs.setString(2, replies.getReplyContent());
			cs.setString(3, replies.getReplyName());
			cs.setDate(4, replies.getReplyDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean update(RepliesDTO replies) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Replies_Update(?, ?, ?, ?, ?)}");
			cs.setInt(1, replies.getID());
			cs.setInt(2, replies.getIDFeedBack());
			cs.setString(3, replies.getReplyContent());
			cs.setString(4, replies.getReplyName());
			cs.setDate(5, replies.getReplyDate());
			int n = cs.executeUpdate();
			if (n == 0) {
				result =false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public boolean delete(int id) {
		boolean result = true;
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Replies_Delete(?)}");
			cs.setInt(1, id);
			int n = cs.executeUpdate();
			if (n == 0) {
				result = false;
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return result;
	}

	public ArrayList<RepliesDTO> selectByIDFeedBack(int idfeedback) {
		ArrayList<RepliesDTO> list = new ArrayList<RepliesDTO>();
		Connection connect = null;
		try {
			connect = DataAccessHelper.getConnection();
			CallableStatement cs = connect.prepareCall("{call usp_Replies_SelectByIDFeedBack(?)}");
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				RepliesDTO replies = new RepliesDTO();
				replies.setID(rs.getInt("ID"));
				replies.setIDFeedBack(rs.getInt("IDFeedBack"));
				replies.setReplyContent(rs.getString("ReplyContent"));
				replies.setReplyName(rs.getString("ReplyName"));
				replies.setReplyDate(rs.getDate("ReplyDate"));
				list.add(replies);
			}
			connect.close();
		} catch (SQLException ex) {
			Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			try {
				connect.close();
			} catch (SQLException ex) {
				Logger.getLogger(RepliesDAO.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
		return list;
	}

}
