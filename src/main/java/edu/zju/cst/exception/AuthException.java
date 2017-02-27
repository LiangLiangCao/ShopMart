
package edu.zju.cst.exception;

/**
 * 
 * 系统配置Key获得的Value为空
 * 
 * @author Liang
 * 
 */
public class AuthException extends Exception {

	private static final long serialVersionUID = 1L;

	public AuthException(String msg) {
		super(msg);
	}
}
