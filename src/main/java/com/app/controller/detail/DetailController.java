package com.app.controller.detail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class DetailController {
	
    @GetMapping("/main/bulguksa")
    public String bulguksa() {
        return "detail/detail";
    }
}