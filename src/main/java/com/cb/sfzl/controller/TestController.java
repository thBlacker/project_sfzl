package com.cb.sfzl.controller;

import com.alibaba.fastjson.JSONObject;
import com.cb.sfzl.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ASUS on 2019/3/29.
 */
@RestController
public class TestController {

    @Autowired
    TestService testService;

    @RequestMapping("/test")
    public String getUser(){
        Map map = new HashMap();
        try {
            ArrayList<Map<String, String>> list = testService.getUser();
            if(list != null && list.size()>0){
                map.put("returnCode","00");
                map.put("content",list.get(0));
            }
        }catch (Exception e){
            e.printStackTrace();
            map.put("returnCode","-1");
            map.put("returnMessage","出现异常:"+e.getMessage());
        }
        String mapStr = JSONObject.toJSONString(map);
        System.out.println(mapStr);
        return mapStr;
    }


}
