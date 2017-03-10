package edu.zju.cst.util;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 属性工具类
 *
 * @author Herbert
 */
public class PropertyUtils extends PropertyPlaceholderConfigurer {
    public static final Logger LOGGER = Logger.getLogger(PropertyUtils.class);

    private static Map<String, String> propertyMap = new HashMap<String, String>();

    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props)
            throws BeansException {
        super.processProperties(beanFactoryToProcess, props);

        for (Object key : props.keySet()) {
            String keyStr = key.toString();
            String value = props.getProperty(keyStr);
            propertyMap.put(keyStr, value);
        }
    }

    public static String getValue(String name) {
        String value = propertyMap.get(name);
        if (StringUtils.isBlank(value)) {
            return "";
        } else {
            return value;
        }
    }


}
