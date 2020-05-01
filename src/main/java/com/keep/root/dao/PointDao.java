package com.keep.root.dao;

import java.util.List;
import com.keep.root.domain.Point;

public interface PointDao {
  // output add form : session
  int insert(Point point) throws Exception;

  // List : 입력 받은 후에 저장된 리스트
  List<Point> findAll() throws Exception;

  // 입력 번호와 상대 번호를 비교하기 위함
  List<Point> findOutputByUserNo(int userNo) throws Exception;

  // detail(point) : pointType, content, price
  // detail(output): outputList check

  // detail - 포인트 내부설정
  Point find(int no) throws Exception;

  // userNo
  Point findByUserNo(int userNo) throws Exception;

  // 카운딩된 상대 번호 확인하기 위함
  Point findBytraderNo(int traderNo) throws Exception;

  int update(Point point) throws Exception;

  int delete(int no) throws Exception;

}
