package com.keep.root.domain;

import java.io.Serializable;
import java.sql.Date;
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

  public User(int no, String name, String tel, int account, String bank ) {
	  this.no = no;
	  this.name = name;
	  this.tel = tel;
	  this.account = account;
	  this.bank = bank;
  }
 

  @Override
  public int hashCode() {
    final int prime = 31;
    int result = 1;
    result = prime * result + account;
    result = prime * result + ((bank == null) ? 0 : bank.hashCode());
    result = prime * result + ((basicAddr == null) ? 0 : basicAddr.hashCode());
    result = prime * result + ((birth == null) ? 0 : birth.hashCode());
    result = prime * result + ((detailAddr == null) ? 0 : detailAddr.hashCode());
    result = prime * result + ((email == null) ? 0 : email.hashCode());
    result = prime * result + gender;
    result = prime * result + ((name == null) ? 0 : name.hashCode());
    result = prime * result + ((nickName == null) ? 0 : nickName.hashCode());
    result = prime * result + no;
    result = prime * result + ((password == null) ? 0 : password.hashCode());
    result = prime * result + ((photo == null) ? 0 : photo.hashCode());
    result = prime * result + ((tel == null) ? 0 : tel.hashCode());
    result = prime * result + zipCode;
    return result;
  }

  @Override
  public String toString() {
    return "User [no=" + no + ", name=" + name + ", birth=" + birth + ", gender=" + gender
        + ", email=" + email + ", password=" + password + ", tel=" + tel + ", zipCode=" + zipCode
        + ", basicAddr=" + basicAddr + ", detailAddr=" + detailAddr + ", photo=" + photo
        + ", nickName=" + nickName + ", account=" + account + ", bank=" + bank + "]";
  }

  @Override
  public boolean equals(Object obj) {
    if (this == obj)
      return true;
    if (obj == null)
      return false;
    if (getClass() != obj.getClass())
      return false;
    User other = (User) obj;
    if (account != other.account)
      return false;
    if (bank == null) {
      if (other.bank != null)
        return false;
    } else if (!bank.equals(other.bank))
      return false;
    if (basicAddr == null) {
      if (other.basicAddr != null)
        return false;
    } else if (!basicAddr.equals(other.basicAddr))
      return false;
    if (birth == null) {
      if (other.birth != null)
        return false;
    } else if (!birth.equals(other.birth))
      return false;
    if (detailAddr == null) {
      if (other.detailAddr != null)
        return false;
    } else if (!detailAddr.equals(other.detailAddr))
      return false;
    if (email == null) {
      if (other.email != null)
        return false;
    } else if (!email.equals(other.email))
      return false;
    if (gender != other.gender)
      return false;
    if (name == null) {
      if (other.name != null)
        return false;
    } else if (!name.equals(other.name))
      return false;
    if (nickName == null) {
      if (other.nickName != null)
        return false;
    } else if (!nickName.equals(other.nickName))
      return false;
    if (no != other.no)
      return false;
    if (password == null) {
      if (other.password != null)
        return false;
    } else if (!password.equals(other.password))
      return false;
    if (photo == null) {
      if (other.photo != null)
        return false;
    } else if (!photo.equals(other.photo))
      return false;
    if (tel == null) {
      if (other.tel != null)
        return false;
    } else if (!tel.equals(other.tel))
      return false;
    if (zipCode != other.zipCode)
      return false;
    return true;
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
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

}
