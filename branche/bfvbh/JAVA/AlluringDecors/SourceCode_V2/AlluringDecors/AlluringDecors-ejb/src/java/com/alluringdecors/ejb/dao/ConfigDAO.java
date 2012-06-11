/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.ejb.dao;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

/**
 *
 * @author Administrator
 */
public final class ConfigDAO
{
    /** The Constant JDBC_DRIVER. */
    public static final int JDBC_DRIVER = 0x0000;

    public static final int CONNECTION_STRING = 0x0001;

    /** The Constant DATA_USER. */
    public static final int DATA_USER = 0x0002;

    /** The Constant DATA_PASSWORD. */
    public static final int DATA_PASSWORD = 0x0003;

    /** The data access layer configuration map. */
    private static Map<Integer, String> dalConfigMap = new HashMap<Integer, String>();

    /** The bundle configuration. */
    private static ResourceBundle bundleConfig = ResourceBundle
	    .getBundle("com.alluringdecors.ejb.dao.dataconnectionconfig");
    static
    {
	    // Configuration data connection
	    ConfigDAO.dalConfigMap.put(ConfigDAO.JDBC_DRIVER,
		    ConfigDAO.bundleConfig.getString("JDBC_DRIVER"));

	    ConfigDAO.dalConfigMap.put(ConfigDAO.CONNECTION_STRING,
		    ConfigDAO.bundleConfig.getString("CONNECTION_STRING"));

	    ConfigDAO.dalConfigMap.put(ConfigDAO.DATA_USER,
		    ConfigDAO.bundleConfig.getString("DATA_USER"));

	    ConfigDAO.dalConfigMap.put(ConfigDAO.DATA_PASSWORD,
		    ConfigDAO.bundleConfig.getString("DATA_PASSWORD"));
    }

    /**
	* Gets the resource text.
	*
	* @param resCode the resource code
	* @return the resource text
	*/
    public static String getValue(final int resCode)
    {
	    final int intResCode = Integer.valueOf(resCode);
	    String resText = "";
	    if (ConfigDAO.dalConfigMap.containsKey(intResCode))
	    {
		    resText = ConfigDAO.dalConfigMap.get(intResCode);
	    }
	    return resText;
    }
}
