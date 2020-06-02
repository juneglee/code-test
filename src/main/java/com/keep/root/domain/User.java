package com.keep.root.domain;

public class User {

  int no;
  String email;
  String password;
  String name;
  String birth;
  int gender;
  String tel;
  String zipCode;
  String basicAddr;
  String detailAddr;
  String photo;
  String nickName;
  int account;
  String bank;
  int point; // setter 아직 정의 안함.
  String authKey;
  int authStatus;

  public User() {}

  public User(String email, //
      String password, //
      String name, //
      String birth, //
      int gender, //
      String tel, //
      String zipCode, //
      String basicAddr, //
      String detailAddr, //
      String nickName) {
    this.email = email;
    this.password = password;
    this.name = name;
    this.birth = birth;
    this.gender = gender;
    this.tel = tel;
    this.zipCode = zipCode;
    this.basicAddr = basicAddr;
    this.detailAddr = detailAddr;
    this.nickName = nickName;
  }

  @Override
  public String toString() {
    return "User [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name
        + ", birth=" + birth + ", gender=" + gender + ", tel=" + tel + ", zipCode=" + zipCode
        + ", basicAddr=" + basicAddr + ", detailAddr=" + detailAddr + ", photo=" + photo
        + ", nickName=" + nickName + ", account=" + account + ", bank=" + bank + ", point=" + point
        + ", authKey=" + authKey + ", authStatus=" + authStatus + "]";
  }

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

  public String getBirth() {
    return birth;
  }

  public void setBirth(String birth) {
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

  public String getZipCode() {
    return zipCode;
  }

  public String setZipCode(String zipCode) {
    return this.zipCode = zipCode;
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

  public int getPoint() {
    return point;
  }

  public String getAuthKey() {
    return authKey;
  }

  public void setAuthKey(String authKey) {
    this.authKey = authKey;
  }

  public int getAuthStatus() {
    return authStatus;
  }

  public void setAuthStatus(int authStatus) {
    this.authStatus = authStatus;
  }

  public void setPoint(int point) {}
}
