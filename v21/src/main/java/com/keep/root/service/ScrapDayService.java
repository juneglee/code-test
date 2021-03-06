package com.keep.root.service;

import java.util.List;
import com.keep.root.domain.ScrapDay;

public interface ScrapDayService {

  int add(int userNo, int reviewDayNo) throws Exception;

  List<ScrapDay> list(int userNo) throws Exception;

  ScrapDay get(int reviewDayNo) throws Exception;

  int delete(int reviewDayNo) throws Exception;
}
