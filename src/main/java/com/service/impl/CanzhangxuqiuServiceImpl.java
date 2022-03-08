package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.CanzhangxuqiuDao;
import com.entity.CanzhangxuqiuEntity;
import com.service.CanzhangxuqiuService;
import com.entity.vo.CanzhangxuqiuVO;
import com.entity.view.CanzhangxuqiuView;

@Service("canzhangxuqiuService")
public class CanzhangxuqiuServiceImpl extends ServiceImpl<CanzhangxuqiuDao, CanzhangxuqiuEntity> implements CanzhangxuqiuService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CanzhangxuqiuEntity> page = this.selectPage(
                new Query<CanzhangxuqiuEntity>(params).getPage(),
                new EntityWrapper<CanzhangxuqiuEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<CanzhangxuqiuEntity> wrapper) {
		  Page<CanzhangxuqiuView> page =new Query<CanzhangxuqiuView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<CanzhangxuqiuVO> selectListVO(Wrapper<CanzhangxuqiuEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public CanzhangxuqiuVO selectVO(Wrapper<CanzhangxuqiuEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<CanzhangxuqiuView> selectListView(Wrapper<CanzhangxuqiuEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public CanzhangxuqiuView selectView(Wrapper<CanzhangxuqiuEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
