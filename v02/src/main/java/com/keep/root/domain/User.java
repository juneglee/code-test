package com.keep.root.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import org.apache.ibatis.type.Alias;

@Alias("User")
public class User implements Serializable {
  private static final long serialVersionUID = 1L;

  // users
  int no; // user_no
  String name; // user_name
  Date birth; // birthday
  int gender; // gender
  String email; // email
  String password; // password
  String tel; // phone_number
  int zipCode; // zip_code
  String basicAddr; // basic_address
  String detailAddr; // detail_address
  String photo; // photo
  String nickName; // nickname
  int account; // account
  String bank; // bank
  // int point; // setter 아직 정의 안함.
  List<Point> point;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Date getBirth() {
    return birth;
  }

  public void setBirth(Date birth) {
    this.birth = birth;
  }

  public int getGender() {
    return gender;
  }

  public void setGender(int gender) {
    this.gender = gender;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public int getZipCode() {
    return zipCode;
  }

  public void setZipCode(int zipCode) {
    this.zipCode = zipCode;
  }

  public String getBasicAddr() {
    return basicAddr;
  }

  public void setBasicAddr(String basicAddr) {
    this.basicAddr = basicAddr;
  }

  public String getDetailAddr() {
    return detailAddr;
  }

  public void setDetailAddr(String detailAddr) {
    this.detailAddr = detailAddr;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public String getNickName() {
    return nickName;
  }

  public void setNickName(String nickName) {
    this.nickName = nickName;
  }

  public int getAccount() {
    return account;
  }

  public void setAccount(int account) {
    this.account = account;
  }

  public String getBank() {
    return bank;
  }

  public void setBank(String bank) {
    this.bank = bank;
  }

  public List<Point> getPoint() {
    return point;
  }

  public void setPoint(List<Point> point) {
    this.point = point;
  }

}
