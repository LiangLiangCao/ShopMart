package edu.zju.cst.filter;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import edu.zju.cst.util.RedisUtil;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class MethodCacheInterceptor
//        implements MethodInterceptor
{
//    private Logger logger = Logger.getLogger(MethodCacheInterceptor.class);
//    private RedisUtil redisUtil;
//    private List<String> targetNamesList; // 不加入缓存的service名称
//    private List<String> methodNamesList; // 不加入缓存的方法名称
//    private Long defaultCacheExpireTime; // 缓存默认的过期时间
//    private Long xxxRecordManagerTime; //
//    private Long xxxSetRecordManagerTime; //
//
//    /**
//     * 初始化读取不需要加入缓存的类名和方法名称
//     */
//    public MethodCacheInterceptor() {
//        try {
//            File f = new File("D:\\lunaJee-workspace\\msm\\msm_core\\src\\main\\java\\com\\mucfc\\msm\\common\\cacheConf.properties");
//            //配置文件位置直接被写死，有需要自己修改下
//            InputStream in = new FileInputStream(f);
//            //          InputStream in = getClass().getClassLoader().getResourceAsStream(
//            //                  "D:\\lunaJee-workspace\\msm\\msm_core\\src\\main\\java\\com\\mucfc\\msm\\common\\cacheConf.properties");
//            Properties p = new Properties();
//            p.load(in);
//            // 分割字符串
//            String[] targetNames = p.getProperty("targetNames").split(",");
//            String[] methodNames = p.getProperty("methodNames").split(",");
//
//            // 加载过期时间设置
//            defaultCacheExpireTime = Long.valueOf(p.getProperty("defaultCacheExpireTime"));
//            xxxRecordManagerTime = Long.valueOf(p.getProperty("com.service.impl.xxxRecordManager"));
//            xxxSetRecordManagerTime = Long.valueOf(p.getProperty("com.service.impl.xxxSetRecordManager"));
//            // 创建list
//            targetNamesList = new ArrayList<String>(targetNames.length);
//            methodNamesList = new ArrayList<String>(methodNames.length);
//            Integer maxLen = targetNames.length > methodNames.length ? targetNames.length
//                    : methodNames.length;
//            // 将不需要缓存的类名和方法名添加到list中
//            for (int i = 0; i < maxLen; i++) {
//                if (i < targetNames.length) {
//                    targetNamesList.add(targetNames[i]);
//                }
//                if (i < methodNames.length) {
//                    methodNamesList.add(methodNames[i]);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//
//    public Object invoke(MethodInvocation invocation) throws Throwable {
//        Object value = null;
//
//        String targetName = invocation.getThis().getClass().getName();
//        String methodName = invocation.getMethod().getName();
//        // 不需要缓存的内容
//        //if (!isAddCache(StringUtil.subStrForLastDot(targetName), methodName)) {
//        if (!isAddCache(targetName, methodName)) {
//            // 执行方法返回结果
//            return invocation.proceed();
//        }
//        Object[] arguments = invocation.getArguments();
//        String key = getCacheKey(targetName, methodName, arguments);
//        System.out.println(key);
//
//        try {
//            // 判断是否有缓存
//            if (redisUtil.exists(key)) {
//                return redisUtil.get(key);
//            }
//            // 写入缓存
//            value = invocation.proceed();
//            if (value != null) {
//                final String tkey = key;
//                final Object tvalue = value;
//                new Thread(new Runnable() {
//
//                    public void run() {
//                        if (tkey.startsWith("com.service.impl.xxxRecordManager")) {
//                            redisUtil.set(tkey, tvalue, xxxRecordManagerTime);
//                        } else if (tkey.startsWith("com.service.impl.xxxSetRecordManager")) {
//                            redisUtil.set(tkey, tvalue, xxxSetRecordManagerTime);
//                        } else {
//                            redisUtil.set(tkey, tvalue, defaultCacheExpireTime);
//                        }
//                    }
//                }).start();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            if (value == null) {
//                return invocation.proceed();
//            }
//        }
//        return value;
//    }
//
//    /**
//     * 是否加入缓存
//     *
//     * @return
//     */
//    private boolean isAddCache(String targetName, String methodName) {
//        boolean flag = true;
//        if (targetNamesList.contains(targetName)
//                || methodNamesList.contains(methodName)) {
//            flag = false;
//        }
//        return flag;
//    }
//
//    /**
//     * 创建缓存key
//     *
//     * @param targetName
//     * @param methodName
//     * @param arguments
//     */
//    private String getCacheKey(String targetName, String methodName,
//                               Object[] arguments) {
//        StringBuffer sbu = new StringBuffer();
//        sbu.append(targetName).append("_").append(methodName);
//        if ((arguments != null) && (arguments.length != 0)) {
//            for (int i = 0; i < arguments.length; i++) {
//                sbu.append("_").append(arguments[i]);
//            }
//        }
//        return sbu.toString();
//    }
//
//    public void setRedisUtil(RedisUtil redisUtil) {
//        this.redisUtil = redisUtil;
//    }
}