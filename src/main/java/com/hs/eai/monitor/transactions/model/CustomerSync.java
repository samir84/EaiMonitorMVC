package com.hs.eai.monitor.transactions.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;



public class CustomerSync implements java.io.Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5204916092936772401L;

	private Integer id;
	private MessageType messageType;
	private TransactionStatus transactionStatus;
	private String messageContent;
	private Integer systemSourceId;
	private Integer systemDestinationId;
	private Integer salesOrganizationId;
	private Integer countryId;
	private String orderNumber;
	private String billTo;
	private String shipTo;
	private String addressGuid;
	private String name;
	private Date dateCreated;
	private Date dateSent;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public MessageType getMessageType() {
		return messageType;
	}
	public void setMessageType(MessageType messageType) {
		this.messageType = messageType;
	}
	public TransactionStatus getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(TransactionStatus transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Integer getSystemSourceId() {
		return systemSourceId;
	}
	public void setSystemSourceId(Integer systemSourceId) {
		this.systemSourceId = systemSourceId;
	}
	public Integer getSystemDestinationId() {
		return systemDestinationId;
	}
	public void setSystemDestinationId(Integer systemDestinationId) {
		this.systemDestinationId = systemDestinationId;
	}
	public Integer getSalesOrganizationId() {
		return salesOrganizationId;
	}
	public void setSalesOrganizationId(Integer salesOrganizationId) {
		this.salesOrganizationId = salesOrganizationId;
	}
	public Integer getCountryId() {
		return countryId;
	}
	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getBillTo() {
		return billTo;
	}
	public void setBillTo(String billTo) {
		this.billTo = billTo;
	}
	public String getShipTo() {
		return shipTo;
	}
	public void setShipTo(String shipTo) {
		this.shipTo = shipTo;
	}
	public String getAddressGuid() {
		return addressGuid;
	}
	public void setAddressGuid(String addressGuid) {
		this.addressGuid = addressGuid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Date getDateSent() {
		return dateSent;
	}
	public void setDateSent(Date dateSent) {
		this.dateSent = dateSent;
	}


	
}

