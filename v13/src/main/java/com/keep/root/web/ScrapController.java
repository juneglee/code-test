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
import com.keep.root.domain.ScrapDay;
import com.keep.root.domain.ScrapPlace;
import com.keep.root.domain.User;
import com.keep.root.service.PointService;
import com.keep.root.service.ScrapDayService;
import com.keep.root.service.ScrapPlaceService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/scrap")
public class ScrapController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  ScrapDayService scrapDayService;

  @Autowired
  ScrapPlaceService scrapPlaceService;

  @Autowired
  UserService userService;
  
  @Autowired
  PointService pointService; 
  
  @PostMapping("addScrap")
  public String addScrap(//
      int userNo, //
      int tarderNo, //
      int pointType, //
      int content, //
      int price,
      HttpSession session,
	Model model) throws Exception {
	   User user = (User) session.getAttribute("loginUser");
	    if (user == null) {
	      throw new Exception("로그인이 필요합니다.");
	    }
    ScrapDay scrapDay = (ScrapDay) scrapDayService.list(user.getNo());
    ScrapPlace scrapPlace = (ScrapPlace) scrapPlaceService.list(user.getNo());

    Point pointDay = new Point();
    pointDay.setTraderNo(scrapDay.getReviewDay().getNo());
    pointDay.setContent(content);
    pointDay.setPointType(pointType);
    pointDay.setPrice(price);
  
    Point pointPlace = new Point();
    pointPlace.setTraderNo(scrapPlace.getReviewPlace().getNo());
    pointPlace.setContent(content);
    pointPlace.setPointType(pointType);
    pointPlace.setPrice(price);

	model.addAttribute("pointDay",pointDay);
	model.addAttribute("pointPlace",pointPlace);
    
	return "redirect:list";
  }

  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("user", userService.get(user.getNo()));
    model.addAttribute("point", pointService.get(user.getNo()));
    model.addAttribute("day", scrapDayService.list(user.getNo()));
    model.addAttribute("place", scrapPlaceService.list(user.getNo()));
  }

  @GetMapping("delete")
  public String delete(int no, HttpSession session, Model model) throws Exception {
    model.addAttribute("day", scrapDayService.delete(no));
    model.addAttribute("place", scrapPlaceService.delete(no));
    return "redirect:list?sessionNo=" + session.getId();
  }
}
