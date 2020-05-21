package com.keep.root.filter;



import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.keep.root.domain.User;

// @WebFilter("/*")
public class AuthFilter implements Filter {

  @Override
  public void doFilter(//
      ServletRequest request, //
      ServletResponse response, //
      FilterChain chain) throws IOException, ServletException {

    HttpServletRequest httpRequest = (HttpServletRequest) request;
    HttpServletResponse httpResponse = (HttpServletResponse) response;

    String servletPath = httpRequest.getServletPath();
    System.out.println(servletPath);

    if (servletPath.endsWith("add") || //
        servletPath.endsWith("delete") || //
        servletPath.endsWith("update")) {
      User loginUser = (User) httpRequest.getSession().getAttribute("loginUser");
      if (loginUser == null) {
        httpResponse.sendRedirect("../auth/login");
        return;
      }
    }

    chain.doFilter(request, response);

  }

}