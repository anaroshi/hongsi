package com.hongsi.ingrestock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("ingrestock")
@Log4j
public class IngrestockController {

	private final String MODULE = "ingrestock";
	
	@GetMapping("list.do")
	public String list() {
		log.info(".............................IngrestockController..");
		return MODULE + "/list";
	}


}
