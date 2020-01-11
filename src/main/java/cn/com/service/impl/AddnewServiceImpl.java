package cn.com.service.impl;

import cn.com.mapper.AddnewMapper;
import cn.com.po.AddNews;
import cn.com.service.AddnewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AddnewServiceImpl implements AddnewService {

    @Autowired(required = false)
    private AddnewMapper addnewMapper;

    @Override
    public int addnew(AddNews addNews) {
        return this.addnewMapper.addnew(addNews);
    }
}