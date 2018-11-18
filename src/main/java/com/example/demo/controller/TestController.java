package com.example.demo.controller;
import com.alibaba.fastjson.JSONObject;
import com.model.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class TestController {

    @RequestMapping(value="/get_data.json")
    public JSONObject getData(Integer limit, Integer page, String name, String tel){
        List<User> list = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            User user = new User();
            user.setId(String.valueOf(i));
            user.setName("aa"+i);
            user.setTel("139"+i);
            if(i%2==0){
                user.setSex(1);
            }else {
                user.setSex(2);
            }
            list.add(user);
        }
        JSONObject object = new JSONObject();
        object.put("total",list.size());
        object.put("rows",list.subList((page-1)*limit,limit*page));
        return object;
    }

}
