package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.Course;

public interface CourseService {

  int add(Course course) throws Exception;

  List<Course> list(int userNo) throws Exception;

  Course get(int no) throws Exception;

  int update(Course course) throws Exception;

  int delete(int no) throws Exception;
}
