package com.spring_boot_momentor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String main() {
		return "index";
	}
	
	@RequestMapping("/calculator")
	public String calculator() {
		return "calculator";
	}
}
