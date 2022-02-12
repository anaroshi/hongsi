package com.hongsi.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("report")
public class ReportController {	
	
	private final String MODULE = "report"; 
	
	@GetMapping("report.do")
	public String report() {
		log.info("-------------------report--");
		return MODULE+"/report";		
	}
	
	@PostMapping("excelDownload")
	public String excelDownload() {
		log.info("-------------------excelDownload--");
		return MODULE+"/report";		
	}

	@PostMapping("uploadExcel")
	public String uploadExcel() {
		log.info("-------------------uploadExcel--");
		return MODULE+"/report";		
	}

}
