package com.cos.board.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice	// 프로젝트 전역 관리
@RestController		// data return
public class ExceptionController {
	
	@ExceptionHandler(value=Exception.class)
	public String 모든오류(Exception e) {
		
		return e.getMessage();
	}
}
