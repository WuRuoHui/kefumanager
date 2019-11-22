package com.ios.kefu.service;

import com.ios.kefu.common.utils.LayUIResult;
import com.ios.kefu.pojo.KfDept;

import java.util.List;

public interface DeptService {
    LayUIResult findAllDeptInfo(KfDept kfDept);
    LayUIResult addDeptInfo(KfDept kfDept);
    LayUIResult deleteDeptInfo(Long id);
    List<KfDept> findDeptInfoCategory();
    LayUIResult updateDeptInfoById(KfDept kfDept);
}
