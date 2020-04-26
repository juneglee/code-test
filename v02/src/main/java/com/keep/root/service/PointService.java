package com.keep.root.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.keep.root.domain.Point;

@Service
public interface PointService {

  int add(Point point) throws Exception;

  List<Point> list() throws Exception;

  Point get(int userNo) throws Exception;

  // getUserNo() - list 연결

  Point getTraderNo(int traderNo) throws Exception;

  int update(Point point) throws Exception;

  int delete(int no) throws Exception;

}