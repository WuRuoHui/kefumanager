/**
 * @program: kefu
 * @description: 部门service实现类
 * @author: Wu
 * @create: 2019-11-17 08:35
 **/
package com.ios.kefu.service.impl;

import com.ios.kefu.common.jedis.JedisClient;
import com.ios.kefu.common.utils.JsonUtils;
import com.ios.kefu.common.utils.LayUIResult;
import com.ios.kefu.mapper.KfDeptMapper;
import com.ios.kefu.pojo.KfDept;
import com.ios.kefu.pojo.KfDeptExample;
import com.ios.kefu.service.DeptService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private KfDeptMapper deptMapper;
    @Autowired
    private JedisClient jedisClient;
    @Value("${DEPTINFO_CATEGORY}")
    private String DEPTINFO_CATEGORY;    //部门分类信息在redis中的键

    @Override
    public LayUIResult findAllDeptInfo(KfDept kfDept) {
        KfDeptExample example = new KfDeptExample();
        KfDeptExample.Criteria criteria = example.createCriteria();
        if (kfDept.getId() != null) {
            criteria.andIdEqualTo(kfDept.getId());
        }
        if (StringUtils.isNoneBlank(kfDept.getName())) {
            criteria.andNameLike("%" + kfDept.getName().trim() + "%");
        }
        List<KfDept> deptList = deptMapper.selectByExample(example);
        System.out.println(deptList);
        return LayUIResult.build(0, deptList.size(), "", deptList);
    }

    @Override
    public LayUIResult addDeptInfo(KfDept kfDept) {
        if (kfDept.getId() != null) {
            return updateDeptInfoById(kfDept);
        }
        KfDeptExample example = new KfDeptExample();
        KfDeptExample.Criteria criteria = example.createCriteria().andNameEqualTo(kfDept.getName().trim());
        List<KfDept> deptList = deptMapper.selectByExample(example);
        if (deptList.size() > 0 && deptList != null) {
            return LayUIResult.build(1, null, null, null);
        }
        deptMapper.insert(kfDept);
        jedisClient.del(DEPTINFO_CATEGORY);
        return LayUIResult.ok();
    }

    @Override
    public LayUIResult updateDeptInfoById(KfDept kfDept) {
        KfDeptExample example = new KfDeptExample();
        int i = deptMapper.updateByPrimaryKey(kfDept);
        if (i > 0) {
            return LayUIResult.ok();
        }
        return null;
    }

    @Override
    public LayUIResult deleteDeptInfo(Long id) {
        if (id != null) {
            int i = deptMapper.deleteByPrimaryKey(id);
            if (i > 0) {
                jedisClient.del(DEPTINFO_CATEGORY);
                return LayUIResult.ok();
            }
        }
        return LayUIResult.build(1, "删除失败");
    }

    @Override
    public List<KfDept> findDeptInfoCategory() {
        String deptinfo_category = jedisClient.get(DEPTINFO_CATEGORY);
        if (StringUtils.isNoneBlank(deptinfo_category)) {
            return JsonUtils.jsonToList(deptinfo_category, KfDept.class);
        }
        List<KfDept> deptList = (List<KfDept>) findAllDeptInfo(new KfDept()).getData();
        jedisClient.set(DEPTINFO_CATEGORY, JsonUtils.objectToJson(deptList));
        return deptList;
    }

}
