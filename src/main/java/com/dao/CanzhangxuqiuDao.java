package com.dao;

import com.entity.CanzhangxuqiuEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.CanzhangxuqiuVO;
import com.entity.view.CanzhangxuqiuView;


/**
 * 残障需求
 * 
 * @author 
 * @email 
 * @date 2022-02-23 10:34:27
 */
public interface CanzhangxuqiuDao extends BaseMapper<CanzhangxuqiuEntity> {
	
	List<CanzhangxuqiuVO> selectListVO(@Param("ew") Wrapper<CanzhangxuqiuEntity> wrapper);
	
	CanzhangxuqiuVO selectVO(@Param("ew") Wrapper<CanzhangxuqiuEntity> wrapper);
	
	List<CanzhangxuqiuView> selectListView(@Param("ew") Wrapper<CanzhangxuqiuEntity> wrapper);

	List<CanzhangxuqiuView> selectListView(Pagination page,@Param("ew") Wrapper<CanzhangxuqiuEntity> wrapper);
	
	CanzhangxuqiuView selectView(@Param("ew") Wrapper<CanzhangxuqiuEntity> wrapper);
	

}
