/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.alluringdecors.common;

import com.alluringdecors.ejb.dto.ServicesOfferedDTO;

/**
 *
 * @author Administrator
 */
public class ShoppingCartItem {
    private int _idCustomer;
    private int _idServiceOffered;
    private int _quantity;
    private ServicesOfferedDTO _servicesOffered;
    
    /**
     * @return the _idCustomer
     */
    public int getIdCustomer() {
        return _idCustomer;
    }

    /**
     * @param idCustomer the _idCustomer to set
     */
    public void setIdCustomer(int idCustomer) {
        this._idCustomer = idCustomer;
    }

    /**
     * @return the _idServiceOffered
     */
    public int getIdServiceOffered() {
        return _idServiceOffered;
    }

    /**
     * @param idServiceOffered the _idServiceOffered to set
     */
    public void setIdServiceOffered(int idServiceOffered) {
        this._idServiceOffered = idServiceOffered;
    }

    /**
     * @return the _quantity
     */
    public int getQuantity() {
        return _quantity;
    }

    /**
     * @param quantity the _quantity to set
     */
    public void setQuantity(int quantity) {
        this._quantity = quantity;
    }

    /**
     * @return the _servicesOffered
     */
    public ServicesOfferedDTO getServicesOffered() {
        return _servicesOffered;
    }

    /**
     * @param servicesOffered the _servicesOffered to set
     */
    public void setServicesOffered(ServicesOfferedDTO servicesOffered) {
        this._servicesOffered = servicesOffered;
    }
}
