package com.homethy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.annotation.PostConstruct;
import java.util.TimeZone;

/**
 * Hello world!
 */
@SpringBootApplication
@EnableScheduling
//@MapperScan(value = "com.homethy.dao.sys")
public class Application {

  @Value("${env}")
  private String ENV;

  @PostConstruct
  void started() {
    if("stage".equals(ENV)){
      TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
    }
  }

  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }
}
