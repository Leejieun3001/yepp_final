<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="login.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 사진 바꾸기</title>
</head>
<body>
   <%
      if (request.getParameter("complete").equals("false")) {
   %>
   <form method=post action="../doEdit">
      <input type="file" name="change_img"><br> <input
         type="hidden" name="type" value="image"> <input type="hidden"
         name="user_id" value="<%=session.getAttribute("user_id")%>">
      <input type="submit" value="사진 바꾸기">
   </form>

   <%
      } else if (request.getParameter("complete").equals("true")) {
         //서블릿 컨텍스트 생성
         ServletContext sc = getServletContext();
         byte[] my_img = DButil.getImg(sc, (String)session.getAttribute("user_id"));
         session.setAttribute("img", my_img);
   %>
   <script>
      window.close();
   </script>
   <%
      }
   %>
</body>
</html>