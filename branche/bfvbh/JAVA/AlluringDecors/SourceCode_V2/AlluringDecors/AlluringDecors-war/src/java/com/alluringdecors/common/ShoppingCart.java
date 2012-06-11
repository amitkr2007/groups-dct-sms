/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.alluringdecors.common;

import java.util.ArrayList;

public class ShoppingCart {
    private ArrayList<ShoppingCartItem> _Cart = new ArrayList<ShoppingCartItem>();

    /**
     * @return the _Cart
     */
    public ArrayList<ShoppingCartItem> getCart() {
        return _Cart;
    }

    /**
     * @param Cart the _Cart to set
     */
    public void setCart(ArrayList<ShoppingCartItem> Cart) {
        this._Cart = Cart;
    }
}
