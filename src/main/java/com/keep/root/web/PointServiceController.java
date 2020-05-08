package com.keep.root.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
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


  @PostMapping("add")
  public String add(//
      String name, //
      String tel, //
      String account, //
      String bank, //
      int price, //
      int no, HttpServletResponse response, //
      HttpSession session, //
      Model model) throws Exception {
    // Point nolist = pointService.get(no);
    // model.addAttribute("nolist", nolist);

    Point point = (Point) session.getAttribute("point");
    point.setPrice(price);

    User user = (User) session.getAttribute("user");
    user.setTel(tel);
    user.setAccount(Integer.valueOf(account));
    user.setName(name);
    user.setBank(bank);


    return "/WEB-INF/jsp/form.jsp";
  }

  @GetMapping("outputdetail")
  public void getUser(int userNo, Model model) throws Exception {
    User user = userService.get(userNo);
    if (user == null) {
      throw new Exception("해당 번호의 정보가 없습니다.");
    }
    model.addAttribute("user", user);
    model.addAttribute("outputdetail", pointService.getUser(userNo));
  }


  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", pointService.list());
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    Point point = pointService.get(no);
    model.addAttribute("point", point);
  }


  @GetMapping("output")
  public void listOutput(Model model) throws Exception {
    model.addAttribute("output", pointService.findOutputByUserNo());
  }

  // @GetMapping
  // public ModelAndView listOutput(//
  // HttpServletRequest request, //
  // @RequestParam("user") User user) throws Exception {
  // ModelAndView mv = new ModelAndView();
  // mv.addObject("out", pointService.findOutputByUserNo());
  // mv.addObject("user", user);
  // mv.setViewName("output");
  // return mv;
  // }
  // model

  @GetMapping("trader")
  public void getTrader(Model model, int traderNo) throws Exception {
    model.addAttribute("tarder", pointService.getTrader(traderNo));
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
