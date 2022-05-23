package com.hongsi.purchpack.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchpack.mapper.PurchPackMapper;
import com.hongsi.purchpack.vo.PurchPackItemVO;
import com.hongsi.purchpack.vo.PurchPackVO;
import com.hongsi.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchPackSerivceImpl")
@AllArgsConstructor
@Log4j
public class PurchPackServiceImpl implements PurchPackService {

	private PurchPackMapper mapper;

	@Override
	public List<PurchPackItemVO> mainList() throws Exception {
		log.info("----mainList-----------PurchPackServiceImpl");
		log.info("---------------"+mapper.mainList());
		return mapper.mainList();
	}

	@Override
	public List<PurchPackItemVO> subList(String pack_code) throws Exception {
		log.info("----subList-----------PurchPackServiceImpl");
		log.info("---------------"+mapper.subList(pack_code));
		return mapper.subList(pack_code);
	}

	@Override
	public int insertPurchpackOrder(PurchPackVO vo) {
		log.info("---------------PurchPackServiceImpl:부자재 주문");
		
		Date 		buyDate = vo.getBuyDate();		// 구매일자
		String 		buyer = vo.getBuyer();			// 구매자
		String[] 	pack_codes = vo.getPack_codes();	// 구매품 대분류 코드
		String[] 	codes = vo.getCodes();			// 구매품 소분류 코드
		long[] 		qtys = vo.getQtys();				// 구매갯수 / 수량
		long[] 		prices = vo.getPrices();			// 구매금액	        
		String[] 	purShops = vo.getPurShops(); 		// 구매 / 거래처
		Date[] 		inDates = vo.getInDates();		// 입고일자
		int 		cntSuccess = 0;
		
		for(int i=0;i<pack_codes.length;i++) {
			vo.setBuyDate(buyDate);
			vo.setBuyer(buyer);			
			vo.setPack_code(pack_codes[i]);
			vo.setCode(codes[i]);
			vo.setQty(qtys[i]);
			vo.setPrice(prices[i]);
			vo.setPurShop(purShops[i]);
			vo.setInDate(inDates[i]);
			log.info("buyDate: "+buyDate);
			log.info("buyer: "+buyer);
			log.info("pack_code: "+pack_codes[i]);
			log.info("code: "+codes[i]);
			log.info("qty: "+qtys[i]);
			log.info("price: "+prices[i]);
			log.info("purShop: "+purShops[i]);
			log.info("inDate: "+inDates[i]);
			log.info(i+" -------------------------------------");
			cntSuccess += mapper.insertPurchpackOrder(vo);
		}
		log.info("---------------cntSuccess: "+cntSuccess);
		return cntSuccess;
	}

	@Override
	public List<PurchPackVO> selectPackList(PageObject pageObject) {
		log.info("---------------PurchPackServiceImpl:부자재 리스트");
		return mapper.selectPackList();
	}

	@Override
	public List<PurchPackVO> selectIndatePackList() {
		log.info("---------------PurchPackServiceImpl:입력일자 기준 리스트");
		return mapper.selectIndatePackList();
	}
}
