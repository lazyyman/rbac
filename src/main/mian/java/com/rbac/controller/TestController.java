package com.rbac.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by luo on 2018/1/17.
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {

    private Logger logger = LoggerFactory.getLogger(TestController.class);

    @RequestMapping(value = "/hello")
    @ResponseBody
    public String hello(){
        logger.info("hello");
        return "hello, premission";
    }

}
