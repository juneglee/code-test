package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.Point;

public interface PointDao {
  void insert(Point point) throws Exception;
	
  List<Point> findAll() throws Exception;

  Point find(int no) throws Exception;
}
