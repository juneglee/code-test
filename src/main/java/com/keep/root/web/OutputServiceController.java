package com.keep.root.web;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.domain.User;
import com.keep.root.service.OutputService;

@Controller
@RequestMapping("/output")
public class OutputServiceController {
	
	  @Autowired
	  ServletContext servletContext;

	  @Autowired
	  OutputService outputService;

	  @GetMapping("form")
	  public void form() {
	  }
	  
	  @PostMapping("add")
	  public String add(User user) throws Exception {
	    if (outputService.add(user) > 0) {
	      return "redirect:list";
	    } else {
	      throw new Exception("회원을 추가할 수 없습니다.");
	    }
	  }
	  
	  @GetMapping("list")
	  public void list(Model model) throws Exception {
	    model.addAttribute("list", outputService.findAllByUser());
	  }

	  @GetMapping("detail")
	  public void detail(int no, Model model) throws Exception {
	    model.addAttribute("detail", outputService.get(no));
	  }
}
