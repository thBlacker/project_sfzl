package com.cb.sfzl.service;

import com.cb.sfzl.dao.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by ASUS on 2019/3/29.
 */
@Service
public class TestService {

    @Autowired
    TestDao testDao;

    public ArrayList<Map<String,String>> getUser() {
        return testDao.getUser();
    }
}
