/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.common;

import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public enum ProjectStatus {
    ON_GOING("On-Going"),
    UP_COMING("Up-Coming"),
    ACCOMPLISHED("Accomplished")
    ;
    /**
     * @param text
     */
    private ProjectStatus(final String text) {
        this.text = text;
    }

    private final String text;

    /* (non-Javadoc)
     * @see java.lang.Enum#toString()
     */
    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return text;
    }

    public static ArrayList<ProjectStatus> getAllProjectStatus()
    {
	ArrayList<ProjectStatus> lst = new ArrayList<ProjectStatus>();
	lst.add(ON_GOING);
	lst.add(UP_COMING);
	lst.add(ACCOMPLISHED);
	return lst;
    }
}
