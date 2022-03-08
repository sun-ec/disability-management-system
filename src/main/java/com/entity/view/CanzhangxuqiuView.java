package com.entity.view;

import com.entity.CanzhangxuqiuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 残障需求
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2022-02-23 10:34:27
 */
@TableName("canzhangxuqiu")
public class CanzhangxuqiuView  extends CanzhangxuqiuEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public CanzhangxuqiuView(){
	}
 
 	public CanzhangxuqiuView(CanzhangxuqiuEntity canzhangxuqiuEntity){
 	try {
			BeanUtils.copyProperties(this, canzhangxuqiuEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
