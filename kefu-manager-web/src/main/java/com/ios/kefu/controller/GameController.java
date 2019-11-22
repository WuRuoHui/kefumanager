/**
 * @program: kefumanager
 * @description: 游戏信息controller
 * @author: Wu
 * @create: 2019-11-21 23:55
 **/
package com.ios.kefu.controller;

import com.ios.kefu.common.utils.LayUIResult;
import com.ios.kefu.pojo.KfGameCategory;
import com.ios.kefu.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class GameController {

    @Autowired
    private GameService gameService;

    @RequestMapping("/game/gameInfoAdd")
    @ResponseBody
    public LayUIResult addGameInfo(KfGameCategory gameCategory) {
        LayUIResult layUIResult = gameService.addGameCategoryInfo(gameCategory);
        return layUIResult;
    }

    @RequestMapping("/search/game")
    @ResponseBody
    public LayUIResult findGameCategory(KfGameCategory gameCategory) {
        System.out.println(gameCategory.getName()+":"+gameCategory.getParentId()+":"+gameCategory.getDeptId());
        LayUIResult layUIResult = gameService.findGame(gameCategory);
        return layUIResult;
    }

    @RequestMapping("/search/gameCategory")
    @ResponseBody
    public List<KfGameCategory> findGameCategory() {
        return gameService.findGameCategory();
    }
}
