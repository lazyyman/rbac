package com.rbac.controller;

import com.rbac.common.JsonData;
import com.rbac.exception.PermissionException;
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

    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

    @RequestMapping(value = "/hello.json")
    @ResponseBody
    public JsonData hello() {
        logger.info("hello");
        throw new RuntimeException("test permission");
//        return JsonData.success("hello, permission");
    }

}
