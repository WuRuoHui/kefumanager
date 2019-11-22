package com.ios.kefu.mapper;

import com.ios.kefu.pojo.KfDept;
import com.ios.kefu.pojo.KfDeptExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KfDeptMapper {
    int countByExample(KfDeptExample example);

    int deleteByExample(KfDeptExample example);

    int deleteByPrimaryKey(Long id);

    int insert(KfDept record);

    int insertSelective(KfDept record);

    List<KfDept> selectByExample(KfDeptExample example);

    KfDept selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") KfDept record, @Param("example") KfDeptExample example);

    int updateByExample(@Param("record") KfDept record, @Param("example") KfDeptExample example);

    int updateByPrimaryKeySelective(KfDept record);

    int updateByPrimaryKey(KfDept record);
}