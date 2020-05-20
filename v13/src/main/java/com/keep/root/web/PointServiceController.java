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
@RequestMapping("/point")
// @RequestMapping("/point/*")
public class PointServiceController {

  @Autowired
  ServletContext servletContext;

  @Autowired
  PointService pointService;

  @Autowired
  ScrapDayService scrapDayService;

  @Autowired
  ScrapPlaceService scrapPlaceService;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form(int userNo, HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }

    model.addAttribute("user", userService.get(userNo));
    model.addAttribute("point", pointService.get(userNo));
    model.addAttribute("scrapDay", scrapDayService.list(userNo));
    model.addAttribute("scrapPlace", scrapPlaceService.list(userNo));

    // return "redirect:form?userNo=" + userNo;
  }

  @GetMapping("payment")
  public String payment() throws Exception {
    return "/point/payment";
  }

  //
  // 스크랩 카운팅 되었을때 상대방의 번호도 같이 입력
  // 스크랩으로 증가된 경우가 아닐 경우에는 기본값을 0으로 만들어 입력하도록 만든다
  // 스크랩을 했을 때 insert
  // map에 담아서 list 전달

  //
  // 0일 때 입금
  // 1일 때 출금
  //
  // 1. 스크랩 포인트 - 스크랩에서 카운팅이 올라갔을 때
  // 2. 충전 결제 - 충전이 완료되었을때
  // 3. 출금 (계좌출금) - 출금이 정상적으로 처리 되었을 때 (마이너스값)
  // 4. 출금 (포인트 사용)
  //
  // pointType, content, price, trader로 확인하여 변경
  // pointType의 값이 0 일 때 - 입금된값 (plus function) (content 1,2 일 때)
  // pointType의 값이 1 일 때 - 출금된값 (minus function) (content 1,2 일 때)
  @PostMapping("addScarp")
  public String addScarp(//
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
    ScrapDay scrapDay = (ScrapDay) scrapDayService.list(userNo);
    ScrapPlace scrapPlace = (ScrapPlace) scrapPlaceService.list(userNo);

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
    return "redirect:form?userNo=" + userNo;
  }
  
  @PostMapping("addWithdraw")
  public String addWithdraw(//
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

    return "redirect:form?userNo=" + userNo;
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

  @GetMapping("userlist")
  public void list(int userNo, Model model) throws Exception {
    model.addAttribute("user", userService.get(userNo));
    model.addAttribute("userlist", pointService.list(userNo));
  }

  @GetMapping("scraplist")
  public void list(HttpSession session, Model model) throws Exception {
    User user = (User) session.getAttribute("loginUser");
    if (user == null) {
      throw new Exception("로그인이 필요합니다.");
    }
    model.addAttribute("day", scrapDayService.list(user.getNo()));
    model.addAttribute("place", scrapPlaceService.list(user.getNo()));
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

  @GetMapping("trader")
  public void getTrader(Model model, int traderNo) throws Exception {
    model.addAttribute("tarder", pointService.getTrader(traderNo));
  }

  @PostMapping("update")
  public String update(Point point) throws Exception {
    if (pointService.update(point) > 0) {
      return "redirect:list";
    } else {
      throw new Exception("변경할 수 없습니다.");
    }
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    if (pointService.delete(no) > 0) {
      return "redirect:userlist";
    } else {
      throw new Exception("삭제할 게시물 번호가 유효하지 않습니다.");
    }
  }
}
