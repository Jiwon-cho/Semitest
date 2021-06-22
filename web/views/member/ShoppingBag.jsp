<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.member.model.vo.CarBoard"%>
<%
	List<CarBoard> list = (List<CarBoard>) request.getAttribute("list");
	String pageBar = (String) request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp" %>
<style>
.list-table {
	        margin-top: 20px;
	        margin-bottom: 60px;
	    }
        .list-table th{
            height:40px;
            border-top:2px solid skyblue;
            border-bottom:1px solid #CCC;
            font-weight: bold;
            font-size: 17px;
        }
        .list-table td{
            text-align:center;
            padding:10px 0;
            border-bottom:1px solid	 #CCC; height:20px;
            font-size: 14px 
        }
        .btn{
            margin: 10px;
            height: 30px;
            width: 50px;
        }
/*페이지바*/
div#pageBar {
	margin-top: 10px;
	text-align: center;
	background-color: rgba(0, 188, 212, 0.3);
}

div#pageBar span.cPage {
	color: #0066ff;
}
</style>
<center>
<div id="main_in">
			<div id="content">
	<h2>장바구니</h2>
	<table class="list-table">
		<tr>
			<th width="120">장바구니 번호</th>
			<th width="350">차량이미지</th>
            <th width="120">차량정보</th>
			<th width="150">가격</th>
			<th width="150">대여기간</th>
			<th width="150">존재여부</th>
			<th width="100">선택</th>
		</tr>
		<%if(list.isEmpty()) {%>
			<tr>
            	<td colspan="6">조회된 데이터가 없습니다</td>
            </tr>
        <%}else{
        	
        	 for(CarBoard c : list){ 
        
        %>
		<tr>
			<td><%=c.getRnum() %></td>
			<td><img src="<%=request.getContextPath() %>/images/car/<%=c.getCarName()%>.png" alt="" height="150" width="250"/></td>
			<td>
			<%if(c.getGear()==null){ %>
				<%=c.getCarName() %>
			<%}else if(c.getGear()!=null){ %>
			<%=c.getCarName() %>(+<%=c.getGear() %>)
			<%} %>	
			</td>
			<td><%=c.getPrice() %></td>
			<td><%=c.getStartDate()%>~<%=c.getEndDate() %></td>
			<td>(<%=c.getCarPsb() %>/<%=c.getCarTotal() %>)</td>
			<td>
				<%if(c.getIsdel().equals("N")) {%>
					<form action="<%=request.getContextPath()%>/car/carPurchaseView" method="post">
					<input type="hidden" name="carNB" value="<%=c.getCarNB()%>">
					<input type="hidden" name="start" value="<%=c.getStartDate()%>">
					<input type="hidden" name="end" value="<%=c.getEndDate()%>"> 
					<input type="hidden" name="gear" value="<%=c.getGear() %>">
					
					<button type="submit" name="" class="btn" >구매</button>
					</form>
					<form action="<%=request.getContextPath() %>/ShoppingBagDelet" method="post">
					<input type="hidden" name="IDX" value="<%=c.getCarIdx()%>">
					<input type="hidden" name="userId" value="<%=loginMember.getUserId()%>">
					<button type="submit" name="" class="btn">삭제</button>
					</form>
                    
				<%} else{%>
					<form action="<%=request.getContextPath() %>/ShoppingBagDelet" method="post">
					<input type="hidden" name="IDX" value="<%=c.getCarIdx()%>">
					<input type="hidden" name="userId" value="<%=loginMember.getUserId()%>">
					<button type="submit" name="" class="btn" onclick="">삭제</button>
					</form>
				<%} %>
			</td>
		</tr>
		<%} 
		}%>
	</table>
</div>
</center>
		</div>
	<div id="pageBar">
		<%=pageBar %>
	</div>
<%@ include file="/views/common/footer.jsp" %>