package com.highnes.attractinvestment.common.utils;


import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class EncryptUtil {

  final static Base64.Decoder decoder = Base64.getDecoder();
  final static Base64.Encoder encoder = Base64.getEncoder();

  /**
   * 加密
   * @param str
   * @return
   */
  public static String encrypt(String str)  {
    byte[] textByte = new byte[0];
    try {
      textByte = str.getBytes("UTF-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    return encoder.encodeToString(textByte);
  }

  /**
   * 解密
   * @param str
   * @return
   */
  public static String decrypt(String str)  {
    try {
      return new String(decoder.decode(str), "UTF-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      return null;
    }
  }

}
