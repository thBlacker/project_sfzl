package com.cb.sfzl.controller;

import com.alibaba.fastjson.JSONObject;
import com.cb.sfzl.service.SfzlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ASUS on 2019/4/1.
 */
@Controller
@RequestMapping("/sfzl")
public class SfzlController {

    @Autowired
    SfzlService sfzlService;


    /**
     * 将数据库中访问量最高的一部分数据 拿出来展示
     *
     * @return
     */
    @RequestMapping("/showWorks")
    public String showWorks(HttpServletRequest request) {
        ArrayList<Map> hotList = null;
        ArrayList<Map> newList = null;
        request.setAttribute("returnCode", "-1");
        try {
            hotList = sfzlService.showWorksHot();
            if (hotList != null && hotList.size() > 0) {
                request.setAttribute("returnCode", "00");
                request.setAttribute("hotList", hotList);
            }
            System.out.println(hotList.size());
            newList = sfzlService.showWorksNew();
            if (newList != null && newList.size() > 0) {
                request.setAttribute("returnCode", "00");
                request.setAttribute("newList", newList);
            }
            System.out.println(newList.size());
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("returnMessage", e.getMessage());
        }
        return "sfzl/sfzls";
    }


}
