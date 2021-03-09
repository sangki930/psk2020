package com.psk.hr.demo.logs;

import org.slf4j.Logger;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public abstract class CustomLogger {
	
	protected Logger logger;
	public CustomLogger() {
		this.logger=logger;
	}
	
	public void trace(String msg) {
		logger.trace(msg);
		writeTrace(msg);
	}
	
	public void debug(String msg) {
		logger.debug(msg);
		writeTrace(msg);
	}
	public void info(String msg) {
		logger.info(msg);
		writeTrace(msg);
	}
	public void warn(String msg) {
		logger.warn(msg);
		writeTrace(msg);
	}
	public void error(String msg) {
		logger.error(msg);
		writeTrace(msg);
	}
	
	protected abstract void writeTrace(String msg);
	protected abstract void writeDebug(String msg);
	protected abstract void writeInfo(String msg);
	protected abstract void writeWarn(String msg);
	protected abstract void writeError(String msg);
	
}
