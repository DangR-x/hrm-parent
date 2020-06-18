package com.highnes.attractinvestment.common.utils;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Rain
 * @Date
 * @Description
 */
public class PinYinUtils {

    // 日志
    private static Logger logger = LoggerFactory.getLogger(PinYinUtils.class);

    /**
     * 汉字转换成拼音首字母大写
     * @param chinese
     * @return
     */
    public static String toAcronym(String chinese){
        try {
            char [] acronyms = chinese.toCharArray();
            StringBuffer acronym = new StringBuffer();
            HanyuPinyinOutputFormat hanyuPinyinOutputFormat = new HanyuPinyinOutputFormat();
            // 大小写格式
            hanyuPinyinOutputFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
            // 声调格式
            hanyuPinyinOutputFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
            for (int i = 0; i < acronyms.length; i++) {
                // 匹配中文,非中文转换会转换成null
                if (Character.toString(acronyms[i]).matches("[\\u4E00-\\u9FA5]+")) {
                    String[] hanyuPinyinStringArray = PinyinHelper.toHanyuPinyinStringArray(acronyms[i], hanyuPinyinOutputFormat);
                    if (hanyuPinyinStringArray != null) {
                        acronym.append(hanyuPinyinStringArray[0].charAt(0));
                    }
                }
            }
            return acronym.toString();
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return chinese;
        }
    }

    /**
     * 汉字转换成拼音大写
     * @param chinese
     * @return
     */
    public static String toPinyin(String chinese){
        try {
            char [] acronyms = chinese.toCharArray();
            StringBuffer acronym = new StringBuffer();
            HanyuPinyinOutputFormat hanyuPinyinOutputFormat = new HanyuPinyinOutputFormat();
            // 大小写格式
            hanyuPinyinOutputFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
            // 声调格式
            hanyuPinyinOutputFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
            for (int i = 0; i < acronyms.length; i++) {
                // 匹配中文,非中文转换会转换成null
                if (Character.toString(acronyms[i]).matches("[\\u4E00-\\u9FA5]+")) {
                    String[] hanyuPinyinStringArray = PinyinHelper.toHanyuPinyinStringArray(acronyms[i], hanyuPinyinOutputFormat);
                    String string = hanyuPinyinStringArray[0];
                    acronym.append(string);
//                    acronym.append(" ");
                } else {
                    acronym.append(acronyms[i]);
                }
            }
            return acronym.toString();
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return chinese;
        }
    }

    /**
     * 利用中文拼音首字母大写和当前年月日生成编码code
     * @param chines
     * @return
     */
    public static String toCreateDataCode(String chines){
        try {
            chines = toAcronym(chines);
            DateFormat df = new SimpleDateFormat("yyyyMMdd");
            chines = chines+df.format(new Date())+"001";
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return chines;
    }

    public static String toCreateDateCodeOfTwoWord(String chines){
        if (!"".equals(chines) && chines.indexOf("易普力") == 0){
            chines = chines.substring(0,3);
        }else {
            chines = chines.substring(0,2);
        }
        try {
            chines = toAcronym(chines);
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return chines;
    }

    public static String toCreateTimeCode(){
        String str = null;
        try {
            DateFormat df = new SimpleDateFormat("yyyyMMdd");
            str =df.format(new Date());
        }catch (Exception e){
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return str;
    }



//
//    public static void main(String[] args) {
//        System.out.println(toCreateDateCodeOfTwoWord("我是有限公司"));
//    }
}
