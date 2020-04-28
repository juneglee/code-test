package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.Point;

public interface PointDao {
  int insert(Point point) throws Exception;

  List<Point> findAll() throws Exception;

  List<Point> findOutputByUserNo() throws Exception;

  Point find(int no) throws Exception;

  Point findByUserNo(String userNo) throws Exception;

  Point findBytraderNo(String traderNo) throws Exception;

  int update(Point point) throws Exception;

  int delete(int no) throws Exception;

}
