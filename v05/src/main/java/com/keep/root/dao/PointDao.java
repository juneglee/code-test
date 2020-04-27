package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.Point;

public interface PointDao {
  int insert(Point point) throws Exception;
  
  List<Point> findAll() throws Exception;

  List<Point> findOutputByUserNo(int userNo) throws Exception;

  Point findByUserNo(int userNo) throws Exception;

  Point findBytraderNo(int traderNo) throws Exception;

  int update(Point point) throws Exception;

  int delete(int no) throws Exception;



}
