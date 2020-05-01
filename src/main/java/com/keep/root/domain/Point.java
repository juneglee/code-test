package com.keep.root.domain;

import java.io.Serializable;
import org.apache.ibatis.type.Alias;

@Alias("Point")
public class Point implements Serializable {
  private static final long serialVersionUID = 1L;
  // points

  int no; // point_no
  int userNo; // user_no
  int traderNo; // trader_no
  // 상대 번호도 받아야함 (user_no)로 받아야함.
  int pointType; // point_type / 입출금 분류
  int content; // content / 입출금 내용
  int price; // price /금액 // 입금 금액인지 출금금액인지
  User user;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public int getUserNo() {
    return userNo;
  }

  public void setUserNo(int userNo) {
    this.userNo = userNo;
  }

  public int getTraderNo() {
    return traderNo;
  }

  public void setTraderNo(int traderNo) {
    this.traderNo = traderNo;
  }

  public int getPointType() {
    return pointType;
  }

  public void setPointType(int pointType) {
    this.pointType = pointType;
  }

  public int getContent() {
    return content;
  }

  public void setContent(int content) {
    this.content = content;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }


  // 포인에서 출력
  // 포유포인트, 출금 금액 ,

  // 유저에서 출력
  // 예금주, 전화번호, 은행명, 계좌번호 , 유저번호
  // 얼마 출금할지??

  // 출금 domain 필요



}
