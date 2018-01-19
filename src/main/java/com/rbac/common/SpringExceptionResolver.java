package com.rbac.common;

import com.rbac.exception.PermissionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lxw on 2018/1/19.
 */
public class SpringExceptionResolver implements HandlerExceptionResolver {

    private static final Logger logger = LoggerFactory.getLogger(SpringExceptionResolver.class);

    private static final String json_request = ".json";
    private static final String page_request = ".page";

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) {

        String url = request.getRequestURL().toString();
        ModelAndView mv;
        String defaultMsg = "System Error";

        // .json  .page
        // 这里我们要求项目中所有请求json数据, 都使用.json结尾
        if (url.endsWith(json_request)) {
            if (e instanceof PermissionException) {
                JsonData result = JsonData.fail(e.getMessage());
                mv = new ModelAndView("jsonView", result.toMap());
            } else {
                logger.error("unknow exception, url: " + url, e);
                JsonData result = JsonData.fail(defaultMsg);
                mv = new ModelAndView("jsonView", result.toMap());
            }
        } else if (url.endsWith(page_request)) {
            // 这里我们要求项目中所有请求page页面, 都使用.page结尾
            logger.error("unknow exception, url: " + url, e);
            JsonData result = JsonData.fail(defaultMsg);
            mv = new ModelAndView("exception", result.toMap());
        } else {
            logger.error("unknow exception, url: " + url, e);
            JsonData result = JsonData.fail(defaultMsg);
            mv = new ModelAndView("jsonView", result.toMap());
        }

        return mv;
    }

}
