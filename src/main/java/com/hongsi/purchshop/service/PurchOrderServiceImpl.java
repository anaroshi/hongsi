package com.hongsi.purchshop.service;

import java.util.List;

import org.apache.ibatis.io.ResolverUtil.IsA;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchOrderMapper;
import com.hongsi.purchshop.vo.PurchOrderVO;
import com.hongsi.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchOrderServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchOrderServiceImpl implements PurchOrderService {
	
	public PurchOrderMapper mapper;

	@Override
	public int insertPurchshopOrder(PurchOrderVO vo) throws Exception {
		log.info("Impl vo : "+vo);
		// 주문 들어온 상품에 대한 생산 준비
//		vo.setOrderDate(vo.getOrderDate().replace("/", ""));
//		vo.setOrderDate(vo.getOrderDate().replace(".", ""));
//		vo.setOrderDate(vo.getOrderDate().replace("-", ""));
		if(vo.getGubun().equals("주문")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		return mapper.insertPurchshopOrder(vo);
	}

	@Override
	public PurchOrderVO selectItemTotSum() throws Exception {
		return mapper.selectItemTotSum();
	}
	
	@Override
	public PurchOrderVO selectOrderSum() throws Exception {
		return mapper.selectOrderSum();
	}

	// 주문 리스트
	@Override
	public List<PurchOrderVO> selectOrderList(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getOrderTotalRow());				
		return mapper.selectOrderList(pageObject);
	}
	
	@Override
	public List<PurchOrderVO> selectOrderListSuntSat() throws Exception {
		// 주문 리스트 일요일 ~ 토요일
		return mapper.selectOrderListSuntSat();
	}

	// 완제품 재고 현황
	@Override
	public PurchOrderVO selectProductStock() throws Exception {		
		return  mapper.selectProductStock();
	}

	// 주문 화면에서 주문 리스트에서 주문을 선택
	// 판매 정보에 넘겨주기 위함.
	@Override
	public PurchOrderVO selectOrderByCno(int cno) throws Exception {
		return mapper.selectOrderByCno(cno);
	}

	@Override
	public int updatePurchshopOrder(long cno) throws Exception {		
		return mapper.updatePurchshopOrder(cno);
	}

	@Override
	public PurchOrderVO selectOrderStock() throws Exception {
		return mapper.selectOrderStock();
	}

	@Override
	public List<PurchOrderVO> selectOrderListWaitSale() throws Exception {
		return mapper.selectOrderListWaitSale();
	}

	@Override
	public PurchOrderVO selectOrderInfoByCno(int cno) throws Exception {		
		return mapper.selectOrderInfoByCno(cno);
	}

	@Override
	public int deleteOrderInfoByCno(long cno) throws Exception {
		log.info("-----------impl-------------deleteOrderInfoByCno :"+cno);
		return mapper.deleteOrderInfoByCno(cno);
	}
	
	@Override
	public int updateOrderInfoByCno(PurchOrderVO vo) throws Exception {
		if(vo.getGubun().equals("주문")) vo.setGubunCode("out");
//		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
//		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
//		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("주문취소")) vo.setGubunCode("cancle");
		log.info("Impl vo : "+vo);

		return mapper.updateOrderInfoByCno(vo);
	}

	@Override
	public List<PurchOrderVO> selectProductOrderSaleAllInfo(PageObject pageObject) {
		if(pageObject.getKey()==null) pageObject.setKey("pos");
		pageObject.setTotalRow(mapper.getProductOrderSaleAllTotalRow(pageObject));
		return mapper.selectProductOrderSaleAllInfo(pageObject);
	}


}
