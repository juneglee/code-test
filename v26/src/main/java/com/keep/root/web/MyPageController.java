package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.keep.root.domain.User;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
  @Autowired
  ServletContext servletContext;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form(int no, Model model, HttpSession session) throws Exception {
	User loginUser = (User) session.getAttribute("loginUser");
	 if (loginUser == null) {
	  throw new Exception("로그인이 필요합니다.");
	 }

    model.addAttribute("user", userService.get(no));
    model.addAttribute("list", userService.list(no));
  }
}