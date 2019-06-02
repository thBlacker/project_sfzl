package com.cb.sfzl.dao;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by ASUS on 2019/4/1.
 */
public interface SfzlDao {

    /**
     * 将数据库中访问量最高的一部分数据 拿出来展示
     * @return
     */
    ArrayList<Map> showWorksHot();

    /**
     * 将数据库中最新上传的一部分数据 拿出来展示
     * @return
     */
    ArrayList<Map> showWorksNew();

}
