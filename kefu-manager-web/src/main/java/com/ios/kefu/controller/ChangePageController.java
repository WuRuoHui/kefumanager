/**
 * @program: kefu
 * @description: 监听侧边栏点击页面变化
 * @author: Wu
 * @create: 2019-11-15 10:39
 **/
package com.ios.kefu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChangePageController {

    @RequestMapping("/")
    public String showIndex() {
        return "adminIndex";
    }
    @RequestMapping("/admin/{pageName}")
    public String changePage(@PathVariable String pageName) {
        return pageName;
    }
}
