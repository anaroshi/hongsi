package com.hongsi.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionActive {
	
	// Exception 500 전체
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		log.info("Exception....."+ex.getMessage());
		model.addAttribute("exception", ex);
		return "error_page";
	}
	
	// Exception 외의 예외
	// web.xml에 예외처리 추가해준다.
	@ExceptionHandler(NoHandlerFoundException.class)
	// 404 오류
	public String handle404(NoHandlerFoundException ex) {
		log.info("---------------NoHandlerFoundException-------"+ex.getMessage());
		// ex.getStackTrace()
		return "custom404";
	}

}
