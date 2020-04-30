package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
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
  public void getUser(int userNo, int traderNo, Model model) throws Exception {
    model.addAttribute("getUserNo", pointService.getUser(userNo));
    model.addAttribute("getTraderNo", pointService.getUser(traderNo));
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("detail", pointService.get(no));
  }

  @GetMapping("output")
  public ModelAndView listOutput(String userNo, Model model, HttpSession session) throws Exception {
    ModelAndView view = new ModelAndView();

    User user = (User) session.getAttribute("user");
    if (user != null) {
      Point point = pointService.getTrader(userNo);
      view.setViewName("output");
      view.addObject("point", point);
    } else {
      view.setViewName("point/list");
    }
    return view;
  }

  @GetMapping("trader")
  public void getTrader(Model model, String traderNo) throws Exception {
    model.addAttribute("tarder", pointService.getTrader(traderNo));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", pointService.list());
  }

  @GetMapping("listbyuser")
  public void findOutputByUserNo(Model model, int userNo) throws Exception {
    User user = userService.get(userNo);
    if (user == null) {
      throw new Exception("유효하지 않습니다.");
    }
    model.addAttribute("user", user);
    model.addAttribute("list", pointService.findOutputByUserNo(userNo));
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
    if (pointService.update(point) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 수 없습니다.");
    }
  }
}
