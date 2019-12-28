package cn.itsource.hrm.client.impl;

import cn.itsource.hrm.client.RedisClient;

/**
 * @Description TODO
 * @Author dangran
 * @Date 2019/12/27 19:44
 * @Version v1.0
 */
public class RedisClientFallback implements RedisClient {
    @Override
    public void set(String key, String value) {

    }

    @Override
    public String get(String key) {
        return "数据获取失败！";
    }
}
