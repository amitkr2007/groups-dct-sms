/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.common;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

/**
 *
 * @author Administrator
 */
public class WebConfig {

    /** The Constant JDBC_DRIVER. */
    public static final int EMAIL = 0x0000;
    public static final int USERNAME = 0x0001;
    public static final int PASSWORD = 0x0002;
    public static final int WEBSITE = 0x0003;
    public static final int SLOGUN = 0x0004;
    /** The data access layer configuration map. */
    private static Map<Integer, String> dalConfigMap = new HashMap<Integer, String>();
    /** The bundle configuration. */
    private static ResourceBundle bundleConfig = ResourceBundle.getBundle("com.alluringdecors.common.emailconfig");

    static {
        // Configuration data connection
        WebConfig.dalConfigMap.put(WebConfig.EMAIL,
                WebConfig.bundleConfig.getString("EMAIL"));

        WebConfig.dalConfigMap.put(WebConfig.USERNAME,
                WebConfig.bundleConfig.getString("USERNAME"));

        WebConfig.dalConfigMap.put(WebConfig.PASSWORD,
                WebConfig.bundleConfig.getString("PASSWORD"));
        
        WebConfig.dalConfigMap.put(WebConfig.WEBSITE,
                WebConfig.bundleConfig.getString("WEBSITE"));
        
        WebConfig.dalConfigMap.put(WebConfig.SLOGUN,
                WebConfig.bundleConfig.getString("SLOGUN"));
    }

    /**
     * Gets the resource text.
     *
     * @param resCode the resource code
     * @return the resource text
     */
    public static String getValue(final int resCode) {
        final int intResCode = Integer.valueOf(resCode);
        String resText = "";
        if (WebConfig.dalConfigMap.containsKey(intResCode)) {
            resText = WebConfig.dalConfigMap.get(intResCode);
        }
        return resText;
    }
}
