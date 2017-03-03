
package edu.zju.cst.util;

import edu.zju.cst.exception.AuthException;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * 授权相关的工具类
 * Created by SX2601 on 2017/2/22.
 */

public class AuthUtils {

    /**
     * @param password
     * @return
     * @throws AuthException
     */
    public static String getPassword(String password) {
        return DigestUtils.md5Hex(password).toLowerCase();
    }



}
