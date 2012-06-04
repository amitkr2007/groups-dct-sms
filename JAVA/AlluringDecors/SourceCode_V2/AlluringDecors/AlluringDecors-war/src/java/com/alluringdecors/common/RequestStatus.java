/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.alluringdecors.common;

/**
 *
 * @author Administrator
 */
public enum RequestStatus {
    REQUEST_RECEIVED("Request Received"),
    REJECTED("Rejected"),
    ACCEPTED("Accepted"),
    PAYMENT_RECEIVED("Payment Received"),
    SERVICE_BEGAN("Service began"),
    SERVICE_COMPLETED("Service Completed")
    ;
    /**
     * @param text
     */
    private RequestStatus(final String text) {
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

}
