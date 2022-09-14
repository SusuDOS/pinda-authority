package com.itheima.pinda.authority.biz.service.common.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.pinda.authority.biz.dao.common.OptLogMapper;
import com.itheima.pinda.authority.biz.service.common.OptLogService;
import com.itheima.pinda.authority.entity.common.OptLog;
import com.itheima.pinda.dozer.DozerUtils;
import com.itheima.pinda.log.entity.OptLogDTO;

import lombok.extern.slf4j.Slf4j;

/**
 * 业务实现类
 * 操作日志
 */

/*
 * mybatisplus继承逻辑结果为:
 * 
 * 第一
 * 
 * @Repository
 * public interface OptLogMapper extends BaseMapper<OptLog> {
 * }
 * 
 * 第二
 * public interface OptLogService extends IService<OptLog> {
 * boolean save(OptLogDTO entity);
 * }
 * 
 * 第三
 * BaseMapper<OptLog>加了Component注解,IService没加注解，先记住，也许不是特例而是规律.
 * 
 * @Service
 * public class OptLogServiceImpl extends ServiceImpl<OptLogMapper, OptLog>
 * implements OptLogService {}
 * 
 * 
 */
@Slf4j
@Service
public class OptLogServiceImpl extends ServiceImpl<OptLogMapper, OptLog> implements OptLogService {
    @Autowired
    DozerUtils dozer;

    @Override
    public boolean save(OptLogDTO entity) {
        return super.save(dozer.map(entity, OptLog.class));
    }
}