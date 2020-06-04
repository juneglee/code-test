package com.keep.root.web;

import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.keep.root.domain.User;
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

  // 검색 결과를 데이, 장소 구분하여 실행
  // userNo, reviewNo를 받기 위해서 map 객체를 사용하여 두개의 파라미터를 받는다
  // 스크랩을 눌렀을 때
  // http://localhost:9999/Root_Project/app/scrap/addReviewDay?reviewDayNo=53 으로 바로 리턴할 수 있도록 만들어야 한다.
  @RequestMapping("addReviewDay")
  public String addReviewDay(int reviewDayNo, HttpSession session, Model model) throws Exception {
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    if (scrapDayService.addReviewDay(loginUser.getNo(), reviewDayNo) > 0) {
      return "redirect:list?userNo" + loginUser.getNo();
    } else {
      throw new Exception("스크랩을 실패했습니다.");
    }
  }

  @RequestMapping("addReviewPlace")
  public String addReviewPlace(int reviewPlaceNo, HttpSession session, Model model) throws Exception {
    User loginUser = (User) session.getAttribute("loginUser");
    if (loginUser == null) {
      throw new Exception("로그인이 필요합니다.");
    }

    if (scrapPlaceService.addReviewPlace(loginUser.getNo(), reviewPlaceNo) > 0) {
      return "redirect:list?userNo" + loginUser.getNo();
    } else {
      throw new Exception("스크랩을 실패했습니다.");
    }
  }


  @GetMapping("list")
  public void list(HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("day", scrapDayService.list(user.getNo()));
    model.addAttribute("place", scrapPlaceService.list(user.getNo()));
  }

  @GetMapping(value="list2", produces = "application/json;charset=UTF-8")
  @ResponseBody
  public String list2(HttpSession session) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    HashMap<String,Object> data = new HashMap<>();
    data.put("day", scrapDayService.list(user.getNo()));
    data.put("place", scrapPlaceService.list(user.getNo()));
    return new Gson().toJson(data);
  }

  @GetMapping("delete")
  public String delete(int no, HttpSession session, Model model) throws Exception {
    model.addAttribute("day", scrapDayService.delete(no));
    model.addAttribute("place", scrapPlaceService.delete(no));
    return "redirect:list?sessionNo=" + session.getId();
  }
}
