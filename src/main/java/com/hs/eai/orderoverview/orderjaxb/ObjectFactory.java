//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vhudson-jaxb-ri-2.1-792 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2012.08.28 at 10:52:28 AM CEST 
//


package com.hs.eai.orderoverview.orderjaxb;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.hs.digis.customersyncorder.orderjaxb package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.hs.digis.customersyncorder.orderjaxb
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Order.OrderHeader.Address }
     * 
     */
    public Order.OrderHeader.Address createOrderOrderHeaderAddress() {
        return new Order.OrderHeader.Address();
    }

    /**
     * Create an instance of {@link Order.OrderHeader }
     * 
     */
    public Order.OrderHeader createOrderOrderHeader() {
        return new Order.OrderHeader();
    }

    /**
     * Create an instance of {@link Order }
     * 
     */
    public Order createOrder() {
        return new Order();
    }

    /**
     * Create an instance of {@link Order.OrderHeader.User }
     * 
     */
    public Order.OrderHeader.User createOrderOrderHeaderUser() {
        return new Order.OrderHeader.User();
    }

    /**
     * Create an instance of {@link Order.OrderDetail }
     * 
     */
    public Order.OrderDetail createOrderOrderDetail() {
        return new Order.OrderDetail();
    }

}