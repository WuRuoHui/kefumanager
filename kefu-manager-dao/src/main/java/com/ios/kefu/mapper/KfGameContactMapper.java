package com.ios.kefu.mapper;

import com.ios.kefu.pojo.KfGameContact;
import com.ios.kefu.pojo.KfGameContactExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KfGameContactMapper {
    int countByExample(KfGameContactExample example);

    int deleteByExample(KfGameContactExample example);

    int deleteByPrimaryKey(Long id);

    int insert(KfGameContact record);

    int insertSelective(KfGameContact record);

    List<KfGameContact> selectByExample(KfGameContactExample example);

    KfGameContact selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") KfGameContact record, @Param("example") KfGameContactExample example);

    int updateByExample(@Param("record") KfGameContact record, @Param("example") KfGameContactExample example);

    int updateByPrimaryKeySelective(KfGameContact record);

    int updateByPrimaryKey(KfGameContact record);
}