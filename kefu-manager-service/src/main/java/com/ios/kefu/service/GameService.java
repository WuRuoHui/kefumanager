/**
 * @program: kefumanager
 * @description: 游戏分类信息接口
 * @author: Wu
 * @create: 2019-11-22 00:05
 **/
package com.ios.kefu.service;

import com.ios.kefu.common.utils.LayUIResult;
import com.ios.kefu.pojo.KfGameCategory;

import java.util.List;

public interface GameService {

    LayUIResult addGameCategoryInfo(KfGameCategory gameCategory);
    LayUIResult findGame(KfGameCategory gameCategory);
    List<KfGameCategory> findGameCategory();
}
