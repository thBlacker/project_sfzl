package com.cb.sfzl.dao;

import com.cb.commons.annotation.MyBatisDao;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by ASUS on 2019/3/29.
 */
public interface TestDao {

    ArrayList<Map<String,String>> getUser();

}
