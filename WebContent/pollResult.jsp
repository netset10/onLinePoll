<%@page import="java.text.DecimalFormat"%>
<%@page import="com.koreait.onlinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh"  content="2;url='?'">
<title>결과보기</title>
</head>
<body>
<%
	String filepath=application.getRealPath("/")+"poll.txt";
	ArrayList<String> poll=PollRead.pollRead(filepath);
	int itemCount=(poll.size()-1)/2;
	
	// 전체 투표수 계산
	int sum=0;
	for(int i=itemCount+1; i<poll.size(); i++)
		sum+=Integer.parseInt(poll.get(i));
	//out.println(sum);
	
	DecimalFormat df1=new DecimalFormat("#,##0표");
	DecimalFormat df2=new DecimalFormat("0.0%");
	
%>

<table width="500" border="1" align="center" cellpadding="5" cellspacing='0'> 
	<tr height="50">
		<th colspan="2"><%=poll.get(0) %></th>
	</tr>
	<tr height="50">
		<td colspan="2" align="right">전체 투표수 : <%=df1.format(sum) %></td>
	</tr>
	
	<%for(int i=1; i<=itemCount; i++) {
		int pyo=Integer.parseInt(poll.get(i+itemCount));
		double per=pyo/(double)sum;%>
		
		<tr height="50">
			<!-- <td><%=poll.get(i) %>(<%=df1.format(pyo) %>)</td> -->
			<td width="120"><%=poll.get(i) %>(<%=df2.format(per) %>)</td>
			
			<td><hr color="tomato" size="20" width="<%=380*per%>" align="left"> </td>
		</tr>
	<%} %>
	
	<tr height="50">
		<td colspan="2" align="center">
			<input type="button" value="투표하러 가기" onclick="location.href='pollRead.jsp'">
		</td>
	</tr>


</table>





</body>
</html>