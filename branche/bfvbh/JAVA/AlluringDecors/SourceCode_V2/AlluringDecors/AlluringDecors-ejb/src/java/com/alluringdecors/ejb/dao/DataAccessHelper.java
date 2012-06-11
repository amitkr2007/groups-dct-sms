/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.ejb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class DataAccessHelper {

    public static Connection getConnection() {
        Connection connect = null;
        try {
            Class.forName(ConfigDAO.getValue(ConfigDAO.JDBC_DRIVER));
            connect = DriverManager.getConnection(ConfigDAO.getValue(ConfigDAO.CONNECTION_STRING), ConfigDAO.getValue(ConfigDAO.DATA_USER), ConfigDAO.getValue(ConfigDAO.DATA_PASSWORD));
            if (connect != null) {
                System.out.print("Successful");
            }
        } catch (Exception ex) {
            //FIXME hadle exception
        }
        return connect;
    }
}
