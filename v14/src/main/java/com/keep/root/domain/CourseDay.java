package com.keep.root.domain;

import java.sql.Date;
import java.util.List;

public class CourseDay {

  int no;
  String title;
  Date dayDate;
  Course course;
  List<CoursePlace> coursePlace;

  public CourseDay() {
  }

  public CourseDay( //
      String title, //
      Date dayDate, //
      List<CoursePlace> coursePlace //
  ) {
    this.title = title;
    this.dayDate = dayDate;
    this.coursePlace = coursePlace;
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Date getDayDate() {
    return dayDate;
  }

  public void setDayDate(Date dayDate) {
    this.dayDate = dayDate;
  }

  public Course getCourse() {
    return course;
  }

  public void setCourse(Course course) {
    this.course = course;
  }

  public List<CoursePlace> getCoursePlace() {
    return coursePlace;
  }

  public void setCoursePlace(List<CoursePlace> coursePlace) {
    this.coursePlace = coursePlace;
  }

}
