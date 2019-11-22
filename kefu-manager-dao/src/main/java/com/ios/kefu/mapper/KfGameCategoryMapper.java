package com.ios.kefu.mapper;

import com.ios.kefu.pojo.KfGameCategory;
import com.ios.kefu.pojo.KfGameCategoryExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KfGameCategoryMapper {
    int countByExample(KfGameCategoryExample example);

    int deleteByExample(KfGameCategoryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(KfGameCategory record);

    int insertSelective(KfGameCategory record);

    List<KfGameCategory> selectByExample(KfGameCategoryExample example);

    KfGameCategory selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") KfGameCategory record, @Param("example") KfGameCategoryExample example);

    int updateByExample(@Param("record") KfGameCategory record, @Param("example") KfGameCategoryExample example);

    int updateByPrimaryKeySelective(KfGameCategory record);

    int updateByPrimaryKey(KfGameCategory record);
}