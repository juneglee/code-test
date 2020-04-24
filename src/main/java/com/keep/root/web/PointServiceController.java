package com.keep.root.web;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.keep.root.domain.Point;
import com.keep.root.service.PointService;

@Controller
@RequestMapping("/point")
// @RequestMapping("/point/*")
public class PointServiceController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  PointService pointService;

  // @Autowired
  // UserService userservice;

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

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("member", pointService.get(no));
  }



  @GetMapping("list")
  public void list(Model model) throws Exception {
    model.addAttribute("list", pointService.list());
  }

  @GetMapping("trader")
  public void getTrad(Model model, int traderNo) throws Exception {
    model.addAttribute("list", pointService.getTraderNo(traderNo));
  }


  @GetMapping("delete")
  public String delete(int no) throws Exception {
    return null;
  }

  @PostMapping("update")
  public String update(Point point) throws Exception {
    return null;
  }

}
