package cn.com.service;

import cn.com.po.User;

public interface UserService {
    int add(User user);

    User login(User user);

    String rename(String name);
}