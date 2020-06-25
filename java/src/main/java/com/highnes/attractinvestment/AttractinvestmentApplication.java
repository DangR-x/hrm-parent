package com.highnes.attractinvestment;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author Administrator
 */
@SpringBootApplication
@EnableSwagger2
//@NacosPropertySource(dataId = "attractinvenstment-dev", autoRefreshed = true)
@MapperScan("com.highnes.attractinvestment.mapper")
public class AttractinvestmentApplication {

    public static void main(String[] args) {
        SpringApplication.run(AttractinvestmentApplication.class, args);
        System.out.println("启动成功...");
    }

}
