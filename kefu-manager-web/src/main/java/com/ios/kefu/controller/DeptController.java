/**
 * @program: kefu
 * @description: 信息管理controller
 * @author: Wu
 * @create: 2019-11-16 09:53
 **/
package com.ios.kefu.controller;

import com.ios.kefu.common.utils.LayUIResult;
import com.ios.kefu.pojo.KfDept;
import com.ios.kefu.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping(value = "/search/dept")
    @ResponseBody
    public LayUIResult findDeptInfo(KfDept kfDept) throws IOException {
        System.out.println(kfDept.getId()+":" +kfDept.getName());
        LayUIResult layUIResult = deptService.findAllDeptInfo(kfDept);
        return layUIResult;
    }

    @RequestMapping(value = "/dept/deptInfoAdd",method = RequestMethod.POST)
    @ResponseBody
    public LayUIResult addDeptInfo(KfDept kfDept) {
        System.out.println(kfDept.getId()+" "+kfDept.getName()+""+kfDept.getNikename());
        LayUIResult layUIResult = deptService.addDeptInfo(kfDept);
        return layUIResult;
    }

    @RequestMapping(value = "/dept/deptInfoDelete")
    @ResponseBody
    public LayUIResult deleteDeptInfo(Long id) {
        LayUIResult layUIResult = deptService.deleteDeptInfo(id);
        return layUIResult;
    }

    @RequestMapping(value = "/dept/deptInfoCategory")
    @ResponseBody
    public List<KfDept> deptInfoEditTest(KfDept kfDept) {
        List<KfDept> deptInfoCategory = deptService.findDeptInfoCategory();
        System.out.println(deptInfoCategory.toString());
        return deptInfoCategory;
    }
}
