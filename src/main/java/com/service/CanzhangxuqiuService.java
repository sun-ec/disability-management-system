package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.CanzhangxuqiuEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.CanzhangxuqiuVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.CanzhangxuqiuView;


/**
 * 残障需求
 *
 * @author 
 * @email 
 * @date 2022-02-23 10:34:27
 */
public interface CanzhangxuqiuService extends IService<CanzhangxuqiuEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<CanzhangxuqiuVO> selectListVO(Wrapper<CanzhangxuqiuEntity> wrapper);
   	
   	CanzhangxuqiuVO selectVO(@Param("ew") Wrapper<CanzhangxuqiuEntity> wrapper);
   	
   	List<CanzhangxuqiuView> selectListView(Wrapper<CanzhangxuqiuEntity> wrapper);
   	
   	CanzhangxuqiuView selectView(@Param("ew") Wrapper<CanzhangxuqiuEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<CanzhangxuqiuEntity> wrapper);
   	

}

