package com.cb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.cb.sfzl.dao")
public class ProjectSfzlApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectSfzlApplication.class, args);
	}

}
