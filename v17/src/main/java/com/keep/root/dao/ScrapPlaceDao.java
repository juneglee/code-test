package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.ScrapPlace;

public interface ScrapPlaceDao {

  int insert(ScrapPlace scrapPlace) throws Exception;

  List<ScrapPlace> findAll(int userNo) throws Exception;

  ScrapPlace findPlaceNo(int reviewPlaceNo) throws Exception;

  int delete(int reviewPlaceNo) throws Exception;

  List<ScrapPlace> findByKeyword(String keyword) throws Exception;
}
