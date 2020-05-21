package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.ScrapDay;

public interface ScrapDayDao {

  int insert(ScrapDay scrapDay) throws Exception;

  List<ScrapDay> findAll(int userNo) throws Exception;

  ScrapDay findDayNo(int reviewDayNo) throws Exception;

  int delete(int reviewDayNo) throws Exception;

  List<ScrapDay> findByKeyword(String keyword) throws Exception;

}
