package cn.com.service.impl;

import cn.com.mapper.UserMapper;
import cn.com.po.User;
import cn.com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserMapper userMapper;

    @Override
    public int add(User user) {
        return this.userMapper.add(user);
    }

    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public String rename(String name) {
        return userMapper.rename(name);
    }
}