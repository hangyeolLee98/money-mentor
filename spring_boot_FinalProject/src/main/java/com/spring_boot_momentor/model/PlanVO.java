package com.spring_boot_momentor.model;

import org.springframework.format.annotation.DateTimeFormat;

public class PlanVO {
	private int dataID;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String calSubDate;
	private int calTransfer;
	private int calMaturity;
	private String userID;
	private String cardName;
	private String insuName;
	private int calPayment;
	private String prdName;
	private String prdID;
	private String prdType;
	private String calDeposit;

	public String getCalDeposit() {
		return calDeposit;
	}
	public void setCalDeposit(String calDeposit) {
		this.calDeposit = calDeposit;
	}
	public int getDataID() {
		return dataID;
	}
	public void setDataID(int dataID) {
		this.dataID = dataID;
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
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public int getCalPayment() {
		return calPayment;
	}
	public void setCalPayment(int calPayment) {
		this.calPayment = calPayment;
	}
	public String getInsuName() {
		return insuName;
	}
	public void setInsuName(String insuName) {
		this.insuName = insuName;
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
	public String getcardName() {
		return cardName;
	}
	public void setcardName(String cardName) {
		this.cardName = cardName;
	}
	
	

}
