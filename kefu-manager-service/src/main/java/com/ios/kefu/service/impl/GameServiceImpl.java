/**
 * @program: kefumanager
 * @description: 游戏信息接口实现类
 * @author: Wu
 * @create: 2019-11-22 00:05
 **/
package com.ios.kefu.service.impl;

import com.ios.kefu.common.jedis.JedisClient;
import com.ios.kefu.common.utils.JsonUtils;
import com.ios.kefu.common.utils.LayUIResult;
import com.ios.kefu.mapper.KfGameCategoryMapper;
import com.ios.kefu.pojo.KfGameCategory;
import com.ios.kefu.pojo.KfGameCategoryExample;
import com.ios.kefu.service.GameService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class GameServiceImpl implements GameService {

    @Autowired
    private KfGameCategoryMapper gameCategoryMapper;
    @Autowired
    private JedisClient jedisClient;
    @Value("${GAMEINFO_CATEGORY}")
    private String GAMEINFO_CATEGORY;

    @Override
    public LayUIResult addGameCategoryInfo(KfGameCategory gameCategory) {
        //判断游戏名称是否已经存在
        KfGameCategoryExample example = new KfGameCategoryExample();
        example.createCriteria().andNameEqualTo(gameCategory.getName().trim());
        List<KfGameCategory> isExit = gameCategoryMapper.selectByExample(example);
        if (isExit.size() > 0 && isExit != null) {
            //如果存在则返回code：1
            return LayUIResult.build(1, null, null, null);
        }
        //封装isParent属性
        if (gameCategory.getIsParent() != true) {
            gameCategory.setIsParent(false);
        }
        gameCategory.setCreated(new Date());
        gameCategory.setUpdated(new Date());
        gameCategory.setStatus(1);
        int i = gameCategoryMapper.insert(gameCategory);
        if (i > 0) {
            jedisClient.del(GAMEINFO_CATEGORY);
            return LayUIResult.ok();
        }
        return LayUIResult.build(2, null, null, null);
    }

    @Override
    public LayUIResult findGame(KfGameCategory gameCategory) {
        KfGameCategoryExample example = new KfGameCategoryExample();
        List<KfGameCategory> kfGameCategoryList = gameCategoryMapper.selectByExample(example);
        return LayUIResult.build(0, kfGameCategoryList.size(), "", kfGameCategoryList);
    }

    @Override
    public List<KfGameCategory> findGameCategory() {
        String gameinfo_category = jedisClient.get(GAMEINFO_CATEGORY);
        if (StringUtils.isNoneBlank(gameinfo_category)) {
            return JsonUtils.jsonToList(gameinfo_category, KfGameCategory.class);
        }
        List<KfGameCategory> gameCategoryList = (List<KfGameCategory>) findGame(new KfGameCategory()).getData();
        jedisClient.set(GAMEINFO_CATEGORY, JsonUtils.objectToJson(gameCategoryList));
        return gameCategoryList;
    }
}
