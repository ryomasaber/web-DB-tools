package com.homethy.util;


import com.homethy.util.jackson.JacksonUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


public class RequestAccessUtil {

  private static final Log LOG = LogFactory.getLog(RequestAccessUtil.class);

  public static boolean isResponseBody(Object handler) {
    if (handler instanceof HandlerMethod) {
      HandlerMethod hm = (HandlerMethod) handler;
      return hm.getMethodAnnotation(ResponseBody.class) != null || hm.getBeanType().getAnnotation
          (ResponseBody.class) != null;
    }
    return false;
  }

  public static void markResponseBody(HttpServletRequest request, Object handler) {
    if (isResponseBody(handler)) {
      request.setAttribute("IS_RESPONSE_BODY", Boolean.TRUE);
    }
  }

  public static boolean isResponseBody(HttpServletRequest request) {
    return Boolean.TRUE.equals(request.getAttribute("IS_RESPONSE_BODY"));
  }

  public static boolean isOptions(HttpServletRequest request) {
    return "OPTIONS".equalsIgnoreCase(request.getMethod());
  }

  public static Map<String, String> getParameterPairs(HttpServletRequest request) {
    @SuppressWarnings("unchecked") Map<String, String[]> requestMap = request.getParameterMap();
    Map<String, String> result = new HashMap<>();
    requestMap.forEach((k, v) -> result.put(k, v[0]));
    handleMapPath4AlertUrl(result);
    LOG.info("search parameter pairs are " + JacksonUtils.toJson(result));
    return result;
  }

  private static void handleMapPath4AlertUrl(Map<String, String> result) {
    if (result.containsKey("mapPath") && !result.containsKey("layoutType")) {
      result.put("layoutType", "map");
    }
  }

  public static boolean isError(HttpServletRequest request) {
    return request.getRequestURI().startsWith("/error/");
  }


}
