package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keep.root.domain.Point;
import com.keep.root.domain.User;
import com.keep.root.service.PointService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/point")
// @RequestMapping("/point/*")
public class PointServiceController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  PointService pointService;

  @Autowired
  UserService userService;


  
  @GetMapping("form")
  public void form() {}

  @GetMapping("add")
  public String add(Point point) throws Exception {
    if (pointService.add(point) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("추가할 수 없습니다.");
    }
  }

  @GetMapping("user")
  public void getUser(int userNo, Model model) throws Exception {
    model.addAttribute("point", pointService.getUser(userNo));
  }

  @GetMapping("detail")
  public void detail(int userNo, Model model) throws Exception {
    model.addAttribute("detail", pointService.getUser(userNo));
  }

  @GetMapping("output")
  public void listOutput(User user, Model model, int no) throws Exception {
	if(user != null) { 
		model.addAttribute("user", user);
	} else {
		throw new Exception("객체가 유효하지 않습니다.");
	}
    model.addAttribute("output", pointService.findOutputByUserNo(user.getNo()));
  }

  @GetMapping("trader")
  public void getTrader(Model model, int traderNo) throws Exception {
    model.addAttribute("tarderlist", pointService.getTrader(traderNo));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", pointService.list());
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    if (pointService.delete(no) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("삭제할 게시물 번호가 유효하지 않습니다.");
    }
  }

  @PostMapping("update")
  public String update(Point point) throws Exception {
	 // Point point = pointService.get(no);
    return null;
  }

}
