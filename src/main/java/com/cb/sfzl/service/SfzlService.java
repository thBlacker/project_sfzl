package com.cb.sfzl.service;

import com.cb.sfzl.dao.SfzlDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Map;

/**
 * Created by ASUS on 2019/4/1.
 */
@Service
@Transactional
public class SfzlService {

    @Autowired
    SfzlDao sfzlDao;

    /**
     * 将数据库中访问量最高的一部分数据 拿出来展示
     * @return
     */
    public ArrayList<Map> showWorksHot() {
        return sfzlDao.showWorksHot();
    }

    /**
     * 将数据库中最新上传的一部分数据 拿出来展示
     * @return
     */
    public ArrayList<Map> showWorksNew() {
        return sfzlDao.showWorksNew();
    }
}
