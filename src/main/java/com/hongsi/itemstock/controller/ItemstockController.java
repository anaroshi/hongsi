package com.hongsi.itemstock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongsi.itemstock.controller.ItemstockController;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("itemstock")
@Log4j
public class ItemstockController {

	private final String MODULE = "itemstock";
	
	@GetMapping("list.do")
	public String list() {
		log.info(".............................ItemstockController..");
		return MODULE + "/list";
	}
}	