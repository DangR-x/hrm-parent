package cn.itsouece.hrm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 * @Description TODO
 * @Author dangran
 * @Date 2019/12/27 18:51
 * @Version v1.0
 */
@SpringBootApplication
@EnableEurekaClient
public class RedisServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(RedisServiceApplication.class,args);
    }
}
