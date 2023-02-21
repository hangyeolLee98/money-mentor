package com.spring_boot_momentor.model;

public class RentHouseLoanOptionVO {
	private String rentHouseLoanID;
	private String dclsMonth;
	private String comNum;
	private String prdNum;
	private String rpayTypeName;
	private String lendRateTypeName;
	private double lendRateMin;
	private double lendRateMax;
	private double lendRateAvg;
	
	public String getRentHouseLoanID() {
		return rentHouseLoanID;
	}
	public void setRentHouseLoanID(String rentHouseLoanID) {
		this.rentHouseLoanID = rentHouseLoanID;
	}
	public String getDclsMonth() {
		return dclsMonth;
	}
	public void setDclsMonth(String dclsMonth) {
		this.dclsMonth = dclsMonth;
	}
	public String getComNum() {
		return comNum;
	}
	public void setComNum(String comNum) {
		this.comNum = comNum;
	}
	public String getPrdNum() {
		return prdNum;
	}
	public void setPrdNum(String prdNum) {
		this.prdNum = prdNum;
	}
	public String getRpayTypeName() {
		return rpayTypeName;
	}
	public void setRpayTypeName(String rpayTypeName) {
		this.rpayTypeName = rpayTypeName;
	}
	public String getLendRateTypeName() {
		return lendRateTypeName;
	}
	public void setLendRateTypeName(String lendRateTypeName) {
		this.lendRateTypeName = lendRateTypeName;
	}
	public double getLendRateMin() {
		return lendRateMin;
	}
	public void setLendRateMin(double lendRateMin) {
		this.lendRateMin = lendRateMin;
	}
	public double getLendRateMax() {
		return lendRateMax;
	}
	public void setLendRateMax(double lendRateMax) {
		this.lendRateMax = lendRateMax;
	}
	public double getLendRateAvg() {
		return lendRateAvg;
	}
	public void setLendRateAvg(double lendRateAvg) {
		this.lendRateAvg = lendRateAvg;
	}
	
}

