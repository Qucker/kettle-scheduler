package com.zhaxd.test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class testlog {
    private final static Logger log = LoggerFactory.getLogger(testlog.class);


    public static void main(String[] args) {

        log.info("logback + slf4j starting up ...");
        log.error("测试error");

    }
}
