package com.keep.root.web;

import java.io.File;
import java.sql.Date;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.keep.root.domain.User;
import com.keep.root.service.ScrapDayService;
import com.keep.root.service.ScrapPlaceService;
import com.keep.root.service.UserService;

@Controller
@RequestMapping("/search")
public class SearchController {
  static Logger logger = LogManager.getLogger(SearchController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  ScrapDayService scrapDayService;

  @Autowired
  ScrapPlaceService scrapPlaceService;

  @Autowired
  UserService userService;

  @GetMapping("form")
  public void form() {}

  @GetMapping("list")
  public void search(String keyword, HttpSession session, Model model) throws Exception {
      User user = (User) session.getAttribute("loginUser");
      model.addAttribute("day", scrapDayService.list(user.getNo()));
      model.addAttribute("place", scrapPlaceService.list(user.getNo()));
      model.addAttribute("list", scrapDayService.search(keyword));
    }
  }

