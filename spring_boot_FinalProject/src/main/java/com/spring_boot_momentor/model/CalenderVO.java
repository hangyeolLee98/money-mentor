package com.spring_boot_momentor.model;

import org.springframework.format.annotation.DateTimeFormat;


public class CalenderVO {
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String calSubDate;
	private int calTransfer;
	private int calMaturity;
	private String userID;
	private String prdID;
	private String prdType;
	private int dataID;
	private int calPayment;
	private String prdName;
	private int calDeposit;
	
	public int getCalDeposit() {
		return calDeposit;
	}
	public void setCalDeposit(int calDeposit) {
		this.calDeposit = calDeposit;
	}
	public String getCalSubDate() {
		return calSubDate;
	}
	public void setCalSubDate(String calSubDate) {
		this.calSubDate = calSubDate;
	}
	public int getCalTransfer() {
		return calTransfer;
	}
	public void setCalTransfer(int calTransfer) {
		this.calTransfer = calTransfer;
	}
	public int getCalMaturity() {
		return calMaturity;
	}
	public void setCalMaturity(int calMaturity) {
		this.calMaturity = calMaturity;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPrdID() {
		return prdID;
	}
	public void setPrdID(String prdID) {
		this.prdID = prdID;
	}
	public String getPrdType() {
		return prdType;
	}
	public void setPrdType(String prdType) {
		this.prdType = prdType;
	}
	public int getDataID() {
		return dataID;
	}
	public void setDataID(int dataID) {
		this.dataID = dataID;
	}
	public int getCalPayment() {
		return calPayment;
	}
	public void setCalPayment(int calPayment) {
		this.calPayment = calPayment;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	
	
	
	
}
