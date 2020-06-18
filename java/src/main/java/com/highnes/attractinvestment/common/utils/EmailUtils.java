package com.highnes.attractinvestment.common.utils;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.util.Properties;

/**
 * @author Rain
 * @date 2020/3/27
 * @description
 */
public class EmailUtils {

    /**
     * 发件人邮箱
     */
    private static String from = "fuliangyun@highnes.com";
    /**
     * 发件人姓名
     */
    private static String user = "fuliangyun@highnes.com";
    /**
     * 发件人密码
     */
    private static String password = "";
    /**
     * 发件人邮件服务器
     */
    private static String host = "smtp.exmail.qq.com";

    /**
     * 发邮件
     * @param to
     * @param text
     * @param title
     * @param file
     * @return
     */
    public static boolean sendEmail(String to, String text, String title, File file){
        Properties properties = new Properties();
        // 设置邮件服务器
        properties.put("mail.smtp.host", host);
        // 需要验证授权
        properties.put("mail.smtp.auth", true);

        // 构建一个session
        Session session = Session.getDefaultInstance(properties);
        MimeMessage message = new MimeMessage(session);
        try {
            // 设置发件人地址
            message.setFrom(from);
            // 设置收件人地址
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // 设置标题
            message.setSubject(title);
            MimeMultipart multipart = new MimeMultipart();
            // 设置邮件的文本内容
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setContent(text, "text/html;charset=utf-8");
            multipart.addBodyPart(contentPart);

            if (file != null){
                // 设置邮件附件
                BodyPart filePart = new MimeBodyPart();
                // 读取文件
                DataHandler dataHandler = new DataHandler(new FileDataSource(file));
                filePart.setDataHandler(dataHandler);
                // 设置附件名称
                filePart.setFileName(file.getName());
                System.out.println(file.getName());
                multipart.addBodyPart(filePart);
                multipart.setSubType("mixed");
            }

            message.setContent(multipart);
            // 保存变化
            message.saveChanges();
            // 链接邮件服务器
            Transport transport = session.getTransport("smtp");
            transport.connect(host, user, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println("邮件发送成功");
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 发邮件
     * @param to
     * @param text
     * @param title
     * @return
     */
    public static boolean sendEmail(String to, String text, String title){
        return sendEmail(to, text, title, null);
    }

    public static void main(String[] args) {
        sendEmail("fliangyun@qq.com", "你好请接收附件", "附件", new File("D:\\常用文件\\易普力\\项目进度\\易普力进度计划-傅良云-2020年3月16日-2020年3月26日.xlsx"));
    }

}
