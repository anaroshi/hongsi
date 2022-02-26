<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PurchShop</title>

<style type="text/css"> 
</style>
  
<script>
  $( function() {

  });
//   function fn_view(cno) {	
		
// 		//alert(cno);
// 		var w = 1000;
// 		var h = 600;
// 		let query = "&page="+${pageObject.page}+"&perPageNum="+${pageObject.perPageNum};
// 		var url = "../view/orderModify.do?cno="+cno+"&locate=2"+query;
		
// 		var xPos = (document.body.offsetWidth/2) - (w/2); // 가운데 정렬
// 		xPos += window.screenLeft; // 듀얼 모니터일 때
// 		var yPos = (document.body.offsetHeight/2) - (h/2) - 200;

// 		window.open(url, "pop_name", "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=no, status=no, titlebar=no, resizable=no");
// 	}; 
</script>
</head>

<body>
<div class="container">
<div class="col-md-12">
  <table class="table table-striped">
    <thead>
    	<tr>
			<td colspan="13" class="text-center"><h5>생산 / 주문 / 판매 LIST</h5></td>    	
			<td colspan="2" class="text-center">
				<form>
					<div class="form-group">
						<input type="hidden" name="page" value="1">
						<input type="hidden" name="perPageNum" value="${pageObject.perPageNum}">				 
						<div class="col-sm-8">
					  		<select id="key" name="key" class="form-control select">
								<option value="pos" ${(pageObject.key == "pos")? "selected":""}>모두</option>
								<option value="p"   ${(pageObject.key == "p")? "selected":""}>생산</option>
								<option value="o"   ${(pageObject.key == "o")? "selected":""}>주문</option>
								<option value="s"   ${(pageObject.key == "s")? "selected":""}>판매</option>
								<option value="po"  ${(pageObject.key == "po")? "selected":""}>생산/주문</option>
								<option value="ps"  ${(pageObject.key == "ps")? "selected":""}>생산/판매</option>
								<option value="os"  ${(pageObject.key == "os")? "selected":""}>주문/판매</option>
							</select>
						</div>
					    <div class="input-group-btn col-sm-4">
					      <button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>				 
				  	</div>
				</form>			
			</td>
		</tr>
       <tr>
        <th style="width: 8%">주문일</th>
        <th style="width: 8%">구분</th>
        <th style="width: 5%">O250</th>
        <th style="width: 5%">O500</th>
        <th style="width: 5%">O1000</th>
        <th style="width: 5%">E250</th>
        <th style="width: 5%">E500</th>
        <th style="width: 5%">E1000</th>
        <th style="width: 5%">S250</th>
        <th style="width: 5%">S500</th>
        <th style="width: 5%">S1000</th>        
        <th style="width: 5%">총주문</th>        
        <th style="width: 9%">주문경로</th>        
        <th style="width: 9%">주문자</th>
		<th style="width: 16%">비고</th>
      </tr>
    </thead>
    <tbody>
	    <c:set var="ori_250_sum" value="0"/>
	   	<c:set var="ori_500_sum" value="0"/>
	   	<c:set var="ori_1000_sum" value="0"/>
		<c:set var="erl_250_sum" value="0"/>
	   	<c:set var="erl_500_sum" value="0"/>
	   	<c:set var="erl_1000_sum" value="0"/>
	    <c:set var="stc_250_sum" value="0"/>
	   	<c:set var="stc_500_sum" value="0"/>
	   	<c:set var="stc_1000_sum" value="0"/>
	   	<c:set var="totalOrder" value="0"/>
		<c:forEach items="${list}" var="vo">
	      
	      <tr class="dataRow" onclick="fn_view(${vo.cno}); return false;">
	      	<!-- p 생산 / po 생산주문 -->
	      	<c:if test="${vo.gubunCode eq 'in'  and (pageObject.key eq 'p' or pageObject.key eq 'po')}">	      		
	      		<c:if test="${vo.gubun eq '생산'}">
			       	<c:set var="ori_250_sum" value="${ori_250_sum + vo.ori_250}"/>
			    	<c:set var="ori_500_sum" value="${ori_500_sum + vo.ori_500}"/>
			    	<c:set var="ori_1000_sum" value="${ori_1000_sum + vo.ori_1000}"/>
			       	<c:set var="erl_250_sum" value="${erl_250_sum + vo.erl_250}"/>
			    	<c:set var="erl_500_sum" value="${erl_500_sum + vo.erl_500}"/>
			    	<c:set var="erl_1000_sum" value="${erl_1000_sum + vo.erl_1000}"/>
			       	<c:set var="stc_250_sum" value="${stc_250_sum + vo.stc_250}"/>
			    	<c:set var="stc_500_sum" value="${stc_500_sum + vo.stc_500}"/>
			    	<c:set var="stc_1000_sum" value="${stc_1000_sum + vo.stc_1000}"/>
			    </c:if>	
		    </c:if>
	 		
	      	<c:if test="${vo.gubunCode eq 'out' and (pageObject.key eq 'p' or pageObject.key eq 'po')}">
	      		<c:if test="${vo.gubun eq '생산'}">
			       	<c:set var="ori_250_sum" value="${ori_250_sum - vo.ori_250}"/>
			    	<c:set var="ori_500_sum" value="${ori_500_sum - vo.ori_500}"/>
			    	<c:set var="ori_1000_sum" value="${ori_1000_sum - vo.ori_1000}"/>
			       	<c:set var="erl_250_sum" value="${erl_250_sum - vo.erl_250}"/>
			    	<c:set var="erl_500_sum" value="${erl_500_sum - vo.erl_500}"/>
			    	<c:set var="erl_1000_sum" value="${erl_1000_sum - vo.erl_1000}"/>
			       	<c:set var="stc_250_sum" value="${stc_250_sum - vo.stc_250}"/>
			    	<c:set var="stc_500_sum" value="${stc_500_sum - vo.stc_500}"/>
			    	<c:set var="stc_1000_sum" value="${stc_1000_sum - vo.stc_1000}"/>
			    </c:if>	
		    </c:if>
		    
			<!-- s 판매 / os 주문판매-->
	 		<c:if test="${vo.gubunCode eq 'in' and (pageObject.key eq 's' or pageObject.key eq 'os')}">
	 			<c:if test="${vo.gubun eq '판매'}">		
			       	<c:set var="ori_250_sum" value="${ori_250_sum - vo.ori_250}"/>
			    	<c:set var="ori_500_sum" value="${ori_500_sum - vo.ori_500}"/>
			    	<c:set var="ori_1000_sum" value="${ori_1000_sum - vo.ori_1000}"/>
			       	<c:set var="erl_250_sum" value="${erl_250_sum - vo.erl_250}"/>
			    	<c:set var="erl_500_sum" value="${erl_500_sum - vo.erl_500}"/>
			    	<c:set var="erl_1000_sum" value="${erl_1000_sum - vo.erl_1000}"/>
			       	<c:set var="stc_250_sum" value="${stc_250_sum - vo.stc_250}"/>
			    	<c:set var="stc_500_sum" value="${stc_500_sum - vo.stc_500}"/>
			    	<c:set var="stc_1000_sum" value="${stc_1000_sum - vo.stc_1000}"/>
			    </c:if>	
	 		</c:if>
	 		
	 		<c:if test="${vo.gubunCode eq 'out' and (pageObject.key eq 's' or pageObject.key eq 'os')}">
	 			<c:if test="${vo.gubun eq '판매'}">
			       	<c:set var="ori_250_sum" value="${ori_250_sum + vo.ori_250}"/>
			    	<c:set var="ori_500_sum" value="${ori_500_sum + vo.ori_500}"/>
			    	<c:set var="ori_1000_sum" value="${ori_1000_sum + vo.ori_1000}"/>
			       	<c:set var="erl_250_sum" value="${erl_250_sum + vo.erl_250}"/>
			    	<c:set var="erl_500_sum" value="${erl_500_sum + vo.erl_500}"/>
			    	<c:set var="erl_1000_sum" value="${erl_1000_sum + vo.erl_1000}"/>
			       	<c:set var="stc_250_sum" value="${stc_250_sum + vo.stc_250}"/>
			    	<c:set var="stc_500_sum" value="${stc_500_sum + vo.stc_500}"/>
			    	<c:set var="stc_1000_sum" value="${stc_1000_sum + vo.stc_1000}"/>
		 		</c:if>
	 		</c:if>
			
			<!-- o 주문 -->
	 		<c:if test="${vo.gubunCode eq 'in' and pageObject.key eq 'o'}">
		       	<c:set var="ori_250_sum" value="${ori_250_sum - vo.ori_250}"/>
		    	<c:set var="ori_500_sum" value="${ori_500_sum - vo.ori_500}"/>
		    	<c:set var="ori_1000_sum" value="${ori_1000_sum - vo.ori_1000}"/>
		       	<c:set var="erl_250_sum" value="${erl_250_sum - vo.erl_250}"/>
		    	<c:set var="erl_500_sum" value="${erl_500_sum - vo.erl_500}"/>
		    	<c:set var="erl_1000_sum" value="${erl_1000_sum - vo.erl_1000}"/>
		       	<c:set var="stc_250_sum" value="${stc_250_sum - vo.stc_250}"/>
		    	<c:set var="stc_500_sum" value="${stc_500_sum - vo.stc_500}"/>
		    	<c:set var="stc_1000_sum" value="${stc_1000_sum - vo.stc_1000}"/>
	 		</c:if>

	 		<c:if test="${vo.gubunCode eq 'out' and pageObject.key eq 'o'}">
		       	<c:set var="ori_250_sum" value="${ori_250_sum + vo.ori_250}"/>
		    	<c:set var="ori_500_sum" value="${ori_500_sum + vo.ori_500}"/>
		    	<c:set var="ori_1000_sum" value="${ori_1000_sum + vo.ori_1000}"/>
		       	<c:set var="erl_250_sum" value="${erl_250_sum + vo.erl_250}"/>
		    	<c:set var="erl_500_sum" value="${erl_500_sum + vo.erl_500}"/>
		    	<c:set var="erl_1000_sum" value="${erl_1000_sum + vo.erl_1000}"/>
		       	<c:set var="stc_250_sum" value="${stc_250_sum + vo.stc_250}"/>
		    	<c:set var="stc_500_sum" value="${stc_500_sum + vo.stc_500}"/>
		    	<c:set var="stc_1000_sum" value="${stc_1000_sum + vo.stc_1000}"/>
	 		</c:if>
	 		
	      	<!-- ps 생산판매 / pos 생산주문판매 -->
	      	<c:if test="${vo.gubunCode eq 'in' and (pageObject.key eq 'ps' or pageObject.key eq 'pos' or pageObject.key eq '')}">
	      		<c:if test="${vo.gubun ne '주문'}">
			       	<c:set var="ori_250_sum" value="${ori_250_sum + vo.ori_250}"/>
			    	<c:set var="ori_500_sum" value="${ori_500_sum + vo.ori_500}"/>
			    	<c:set var="ori_1000_sum" value="${ori_1000_sum + vo.ori_1000}"/>
			       	<c:set var="erl_250_sum" value="${erl_250_sum + vo.erl_250}"/>
			    	<c:set var="erl_500_sum" value="${erl_500_sum + vo.erl_500}"/>
			    	<c:set var="erl_1000_sum" value="${erl_1000_sum + vo.erl_1000}"/>
			       	<c:set var="stc_250_sum" value="${stc_250_sum + vo.stc_250}"/>
			    	<c:set var="stc_500_sum" value="${stc_500_sum + vo.stc_500}"/>
			    	<c:set var="stc_1000_sum" value="${stc_1000_sum + vo.stc_1000}"/>
			    </c:if>
		    </c:if>
	      	<c:if test="${vo.gubunCode eq 'out' and (pageObject.key eq 'ps' or pageObject.key eq 'pos' or pageObject.key eq '')}">
				<c:if test="${vo.gubun ne '주문'}">
			       	<c:set var="ori_250_sum" value="${ori_250_sum - vo.ori_250}"/>
			    	<c:set var="ori_500_sum" value="${ori_500_sum - vo.ori_500}"/>
			    	<c:set var="ori_1000_sum" value="${ori_1000_sum - vo.ori_1000}"/>
			       	<c:set var="erl_250_sum" value="${erl_250_sum - vo.erl_250}"/>
			    	<c:set var="erl_500_sum" value="${erl_500_sum - vo.erl_500}"/>
			    	<c:set var="erl_1000_sum" value="${erl_1000_sum - vo.erl_1000}"/>
			       	<c:set var="stc_250_sum" value="${stc_250_sum - vo.stc_250}"/>
			    	<c:set var="stc_500_sum" value="${stc_500_sum - vo.stc_500}"/>
			    	<c:set var="stc_1000_sum" value="${stc_1000_sum - vo.stc_1000}"/>
			    </c:if>
		    </c:if>
		    
	    	<c:set var="totalOrder" 
	    		value="${vo.ori_250+vo.ori_500+vo.ori_1000+vo.erl_250+vo.erl_500+vo.erl_1000+vo.stc_250+vo.stc_500+vo.stc_1000}"/>
	    	<td>${vo.orderDate}</td>
	        <td>${vo.gubun}</td>
	        <td class="text-right">${vo.ori_250}</td>
	        <td class="text-right">${vo.ori_500}</td>
	        <td class="text-right">${vo.ori_1000}</td>
	        <td class="text-right">${vo.erl_250}</td>
	        <td class="text-right">${vo.erl_500}</td>
	        <td class="text-right">${vo.erl_1000}</td>
	        <td class="text-right">${vo.stc_250}</td>
	        <td class="text-right">${vo.stc_500}</td>
	        <td class="text-right">${vo.stc_1000}</td>
	        <td class="text-right">${totalOrder}</td>
	        <td>${vo.salePath}</td>
	        <td>${vo.orderer}</td>
			<td>${vo.comm}</td>
	      </tr>
		</c:forEach>
    </tbody>     
    <tfoot>
      	<tr>
	        <td>${(pageObject.key eq 'p')?'생산':(pageObject.key eq 'o')?'주문':(pageObject.key eq 's')?'판매':(pageObject.key eq 'po')?'생산주문':(pageObject.key eq 'ps')?'생산판매':(pageObject.key eq 'os')?'주문판매':'모두'}</td>
	        <td></td>
	        <th class="text-right">${ori_250_sum}</th>
	        <th class="text-right">${ori_500_sum}</th>
	        <th class="text-right">${ori_1000_sum}</th>
	        <th class="text-right">${erl_250_sum}</th>
	        <th class="text-right">${erl_500_sum}</th>
	        <th class="text-right">${erl_1000_sum}</th>
	        <th class="text-right">${stc_250_sum}</th>
	        <th class="text-right">${stc_500_sum}</th>
	        <th class="text-right">${stc_1000_sum}</th>
	        <th class="text-right">${ori_250_sum+ori_500_sum+ori_1000_sum+erl_250_sum+erl_500_sum+erl_1000_sum+stc_250_sum+stc_500_sum+stc_1000_sum}</th>
	        <td></td>
	        <td></td>
      	</tr>
    </tfoot>
  </table>
<div class="text-center">
	<c:if test="${pageObject.totalPage>1}" >		
		<pageObject:pageNav listURI="posAllList.do" pageObject="${pageObject}" />
	</c:if>
</div>  
</div>
</div>
</body>
</html>