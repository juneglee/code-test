package com.keep.root.service;

import java.util.List;

import com.keep.root.domain.ReviewDay;
import com.keep.root.domain.ReviewPlace;
import com.keep.root.domain.ReviewPlacePhoto;

public interface ReviewPlacePhotoService {

  int add(ReviewPlacePhoto reviewPlacePhoto) throws Exception;

  List<ReviewPlacePhoto> list(int reviewPlaceNo) throws Exception;

  ReviewPlacePhoto get(int no) throws Exception;

  int update(ReviewPlacePhoto reviewPlacePhoto) throws Exception;

  int delete(int no) throws Exception;

  //search
  List<ReviewPlacePhoto> listGet(int no) throws Exception;
  
  ReviewPlacePhoto searchPhotoGet(int no) throws Exception;
  
}
