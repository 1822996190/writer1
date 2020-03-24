package com.writer1.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.writer1.entity.Reflective;
import com.writer1.entity.User;
import com.writer1.mapper.UserMapper;
import com.writer1.service.UserService;
import com.writer1.utils.ToJson;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    private User user;
    @Autowired
    private UserMapper userMapper;

    @Override
    public int queryByUsername(String username) {
        user = new User();
        user.setUsername(username);
        if (userMapper.queryByU(username) != null) {return 1;}
        return 0;
    }

    @Override
    public int queryByUsernameAndPassword(String username, String password) {
        user = new User(username, password);
        if (userMapper.queryByUAndP(user) != null) {
            return 1;
        }
        return 0;
    }

    @Override
    public String getPassword(String username) {
        return userMapper.queryByU(username).getPassword();
    }

    @Override
    public int addUser(String username, String password) {
        user = new User(username, password,"student","1");
        Map<String, String> t1 = new HashMap<String, String>();
        t1.put("tableName", username + "_reflective");
        Map<String, String> t2 = new HashMap<String, String>();
        t2.put("tableName", username + "_messages");
        if (userMapper.add(user) > 0) {
            userMapper.createTableR(t1);
            userMapper.createTableM(t2);
            return 1;
        }
        return 0;
    }

    @Override
    public String queryIs_valid(String username) {
        return userMapper.queryIs_valid(username);
    }

    @Override
    public String queryRole_permissions(String username) {
        return userMapper.queryRole_permissions(username);
    }

    @Override
    public String queryTitle( int offset, int rows) throws JsonProcessingException {
        PageHelper.offsetPage(offset, rows);
        List<User> list = userMapper.queryTitle();
        int total = (int) new PageInfo<>(list).getTotal();
        String json = ToJson.toJson(list);
        String rst = "{\"code\":0,\"msg\":\"\",\"count\":" + total + ",\"data\":" + json + "}";
        return rst;


    }


}
