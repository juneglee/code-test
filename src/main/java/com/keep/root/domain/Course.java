package com.keep.root.domain;

import java.sql.Date;
import java.util.List;

public class Course {

  int no;
  User user;
  Date createdDate;
  List<CourseDay> courseDay;

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public Date getCreatedDate() {
    return createdDate;
  }

  public void setCreatedDate(Date createdDate) {
    this.createdDate = createdDate;
  }

  public List<CourseDay> getCourseDay() {
    return courseDay;
  }

  public void setCourseDay(List<CourseDay> courseDay) {
    this.courseDay = courseDay;
  }

  @Override
  public String toString() {
    return "Course [no=" + no + ", user=" + user + ", createdDate=" + createdDate + ", courseDay=" + courseDay + "]";
  }

}
