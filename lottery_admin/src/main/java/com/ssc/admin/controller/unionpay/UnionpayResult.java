package com.ssc.admin.controller.unionpay;

public class UnionpayResult {

	private String retCode;
	private String retMsg;			
	private String withDrawCode;		
	private String withDrawMsg;
	public String getRetCode() {
		return retCode;
	}
	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}
	public String getRetMsg() {
		return retMsg;
	}
	public void setRetMsg(String retMsg) {
		this.retMsg = retMsg;
	}
	public String getWithDrawCode() {
		return withDrawCode;
	}
	public void setWithDrawCode(String withDrawCode) {
		this.withDrawCode = withDrawCode;
	}
	public String getWithDrawMsg() {
		return withDrawMsg;
	}
	public void setWithDrawMsg(String withDrawMsg) {
		this.withDrawMsg = withDrawMsg;
	}	
	
}
