package com.hh.webapp.action;

import com.hh.system.util.base.BaseAction;

@SuppressWarnings("serial")
public class Actiondesktop extends BaseAction {
	private String params;
	public String desktop() {
		return SUCCESS;
	}
	public String mobiledesktop() {
		return SUCCESS;
	}
	public String webdesktop() {
		return SUCCESS;
	}
	public String page() {
		return SUCCESS;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
}
