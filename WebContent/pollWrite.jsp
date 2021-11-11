<%@page import="com.koreait.onlinePoll.PollWrite"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.koreait.onlinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- 투표항목을 받아 득표수를 증가시켜 txt파일에 저장 -->

<%
	request.setCharacterEncoding("UTF-8");// 습관화 해라
	String s=request.getParameter("poll");
	
	if(s==null || s.trim().length()==0){
		out.println("<script>");
		out.println("alert('항목을 선택해주세요')");
		out.println("location.href='pollRead.jsp'");// js 코드
		out.println("</script>");
		
		//response.sendRedirect("pollRead.jsp"); // 투표 페이지로 보내버리기
		// jsp가 먼저 다 실행되고 js가 실행됨. 
		// 여기서는 jsp가 제어를 넘겨버려서 js가 실행이 안됨.
		
	}else{
		boolean flag=false;
		try{
			// 숫자로 변환
			int n=Integer.parseInt(s.trim());
			// 투표 범위 파악
			String filepath=application.getRealPath("/")+"poll.txt";
			ArrayList<String> poll=PollRead.pollRead(filepath);
			int itemCount=(poll.size()-1)/2;
			// 검사
			if(n<=0 || n>itemCount)
				flag=true;
			else{
				// 투표 반영
				int idx=itemCount+n;
			 	poll.set(idx, Integer.parseInt(poll.get(idx))+1+"");
				PollWrite.pollWrite(filepath, poll);
				response.sendRedirect("pollResult.jsp"); 
			}
			
			
		}catch(NumberFormatException e){
			flag=true;
		}
		if(flag){
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.')");
			out.println("location.href='pollRead.jsp'");// js 코드
			out.println("</script>");
		}
		
		
	}
%>
	

</body>
</html>