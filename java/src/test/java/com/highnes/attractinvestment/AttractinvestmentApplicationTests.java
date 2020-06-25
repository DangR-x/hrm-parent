package com.highnes.attractinvestment;


import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
class AttractinvestmentApplicationTests {


    @Test
    void testAddress() {
        String msg = "市内";
        String cq = "重庆";
        String gt = "香港";
        String add = "来自台湾有什么";
        if (add.indexOf(cq) != -1) {
            msg = "市内";
        } else if (add.indexOf(gt) != -1 || add.indexOf("台湾") != -1 || add.indexOf("澳门") != -1) {
            msg = "港澳台";
        } else {
            msg = "境外";
        }
        System.out.println(msg);
    }

}

