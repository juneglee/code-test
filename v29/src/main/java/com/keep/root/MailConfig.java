package com.keep.root;

import java.util.Properties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
  @Bean
  public JavaMailSender mailSender() {
    Properties properties = new Properties();
    properties.put("mail.smtp.auth", true);
    properties.put("mail.transport.protocol", "smtp");
    properties.put("mail.smtp.starttls.enable", true);
    properties.put("mail.smtp.starttls.required", true);
    properties.put("mail.debug", true);

    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
    mailSender.setHost("smtp.gmail.com");
    mailSender.setPort(587);
    mailSender.setUsername("2t.root.project@gmail.com");
    mailSender.setPassword("root1111");
    mailSender.setDefaultEncoding("utf-8");
    mailSender.setJavaMailProperties(properties);

    return mailSender;
  }
}
