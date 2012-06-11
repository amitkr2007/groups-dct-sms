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
public enum Role {
    ADMINISTRATOR("Administrator"),
    CLIENT("Client")
    ;
    /**
     * @param text
     */
    private Role(final String text) {
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

    public static ArrayList<Role> getAllRole()
    {
	ArrayList<Role> lst = new ArrayList<Role>();
	lst.add(ADMINISTRATOR);
	lst.add(CLIENT);
	return lst;
    }
}
