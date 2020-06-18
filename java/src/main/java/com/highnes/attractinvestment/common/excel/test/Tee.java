package com.highnes.attractinvestment.common.excel.test;

import com.alibaba.fastjson.JSON;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Rain
 * @date 2020/5/12
 * @description
 */
public class Tee {
    public static void main(String[] args) {
        System.out.println(JSON.toJSONString(toLocation("a2")));
    }

    private static String letterToNum(String input) {
        StringBuffer bs = new StringBuffer();
        for (byte b : input.getBytes()) {
            bs.append(b - 96);
        }
        return bs.toString();
    }

    /**
     * 正则表达式
     */
    static Pattern pattern = Pattern.compile("[0-9]+");
    /**
     * 解析坐标
     * @param location
     * @return
     */
    private static String[] toLocation(String location){
        String[] arr = new String[2];
        int index = 0;
        try {
//			Pattern pattern = Pattern.compile("[0-9]+");
            char[] chars = location.toCharArray();
            for (char c: chars){
                Matcher isNum = pattern.matcher(String.valueOf(c));
                if (!isNum.matches()){
                    arr[0] = letterToNum(String.valueOf(c).toLowerCase());
                    index = location.indexOf(String.valueOf(c));
                    break;
                }else {
                    arr[0] = location;
                }
            }
            arr[1] = location.substring(index+1);
        }catch (Exception e){
            e.printStackTrace();
        }
        return arr;
    }
}
