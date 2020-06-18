package com.highnes.attractinvestment.common.word;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.util.Base64;
import java.util.Map;


/**
 * @author Rain
 * @date 2020/4/8
 * @description
 */
public class DocumentHandler {

    private Configuration configuration = null;
    /**
     * 模板名称： "铁矿.xml"
     */
    private String templateFile = "";

    public DocumentHandler() {
        configuration = new Configuration();
        configuration.setDefaultEncoding("utf-8");
    }

    public DocumentHandler(String templateFile) {
        configuration = new Configuration();
        configuration.setDefaultEncoding("utf-8");
        this.templateFile = templateFile;
    }

    /**
     * @param dataMap
     * @param fileName
     * @throws UnsupportedEncodingException
     */
    public void createDoc(Map<String, Object> dataMap, String fileName)
            throws UnsupportedEncodingException {
        //dataMap 要填入模本的数据文件
        //设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
        //这里我们的模板是放在template包下面
        configuration.setClassForTemplateLoading(this.getClass(), "/template");
        Template t = null;
        try {
            //test.ftl为要装载的模板
            t = configuration.getTemplate(templateFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //输出文档路径及名称
        File outFile = new File(fileName);
        Writer out = null;
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(outFile);
            OutputStreamWriter oWriter = new OutputStreamWriter(fos, "UTF-8");
            //这个地方对流的编码不可或缺，使用main（）单独调用时，应该可以，但是如果是web请求导出时导出后word文档就会打不开，并且包XML文件错误。主要是编码格式不正确，无法解析。
            //out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
            out = new BufferedWriter(oWriter);
        } catch (FileNotFoundException e1) {
            e1.printStackTrace();
        }

        try {
            t.process(dataMap, out);
            out.close();
            fos.close();
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @param dataMap
     * @param fileName
     * @param response
     * @throws UnsupportedEncodingException
     */
//    public void createDoc(Map<String,Object> dataMap, String fileName, HttpServletResponse response) {
//        //dataMap 要填入模本的数据文件
//        //设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
//        //这里我们的模板是放在template包下面
//        configuration.setClassForTemplateLoading(this.getClass(), "/template");
//        Template t=null;
//        try {
//            //test.ftl为要装载的模板
//            t = configuration.getTemplate("铁矿.xml");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        response.reset();
//        response.setContentType("application/octet-stream; charset=utf-8");
//        response.setHeader("Content-Disposition", "attachment; filename="+ Encodes.urlEncode(fileName));
//
//        //输出文档路径及名称
//        try {
//            OutputStream outputStream = response.getOutputStream();
//            Writer writer = outputStream.write();
//            t.process(dataMap, writer);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    /**
     * 图片转码
     *
     * @return 返回图片base64字符串
     * @throws Exception
     */
    public String getImageStr(String imgFile) {
        InputStream in = null;
        byte[] data = null;
        try {
            in = new FileInputStream(imgFile);
        } catch (FileNotFoundException e) {
            System.out.println("文件没找到！");
            e.printStackTrace();
        }
        try {
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Base64.getEncoder().encodeToString(data);
    }

}
