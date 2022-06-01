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
	public int insertPurchpackOrder(PurchPackVO vo) throws Exception {
		log.info("---------------PurchPackServiceImpl:부자재 주문");
		
		Date 		buyDate = vo.getBuyDate();			// 구매일자
		String 		buyer = vo.getBuyer();				// 구매자
		String[] 	pack_codes = vo.getPack_codes();	// 구매품 대분류 코드
		String[] 	codes = vo.getCodes();				// 구매품 소분류 코드
		long[] 		qtys = vo.getQtys();				// 구매갯수 / 수량
		long[] 		prices = vo.getPrices();			// 구매금액	        
		String[] 	purShops = vo.getPurShops(); 		// 구매 / 거래처
		Date[] 		inDates = vo.getInDates();			// 입고일자
		
		int 		cntSuccess = 0;
		int 		cnt = (pack_codes.length);
		log.info("---------------cnt :"+cnt);
		int 		inDatesCnt = (inDates.length);
		log.info("---------------inDatesCnt :"+inDatesCnt);
		for(int i=0;i<cnt;i++) {
			log.info("---------------i :"+i);
			vo.setBuyDate(buyDate);
			log.info("buyDate: "+buyDate);
			vo.setBuyer(buyer);			
			log.info("buyer: "+buyer);
			vo.setPack_code(pack_codes[i]);
			log.info("pack_code: "+pack_codes[i]);
			vo.setCode(codes[i]);
			log.info("code: "+codes[i]);
			vo.setQty(qtys[i]);
			log.info("qty: "+qtys[i]);
			vo.setPrice(prices[i]);
			log.info("price: "+prices[i]);
			vo.setPurShop(purShops[i]);
			log.info("purShop: "+purShops[i]);

//			log.info("inDate: "+ inDates);
			if (inDatesCnt==0) {
				vo.setInDate(null);
			} else {
				log.info("inDate: "+ (inDates[i]==null?null:inDates[i]));
				//vo.setInDate(inDates[i]==null?null:inDates[i]);
				vo.setInDate(inDates[i]);
			}
			log.info(i+" -------------------------------------");
			cntSuccess += mapper.insertPurchpackOrder(vo);
		}
		log.info("---------------cntSuccess: "+cntSuccess);
		return cntSuccess;
	}

	@Override
	public List<PurchPackVO> selectPackList(PageObject pageObject) throws Exception {
		log.info("---------------PurchPackServiceImpl:부자재 리스트");
		pageObject.setTotalRow(mapper.getPackTotalRow(pageObject));
		return mapper.selectPackList(pageObject);
	}

	@Override
	public List<PurchPackVO> selectIndatePackList(PageObject pageObject) throws Exception {
		log.info("---------------PurchPackServiceImpl:입력일자 기준 리스트");
		pageObject.setTotalRow(mapper.getIndatePackTotalRow(pageObject));
		return mapper.selectIndatePackList(pageObject);
	}

	// 부자재 입출고 수정을 위한 cno에 해당하는 정보 가져오기
	@Override
	public PurchPackVO selectPackInfoByCno(PurchPackVO vo) throws Exception {
		return mapper.selectPackInfoByCno(vo);
	}

	// 부자재 구매 & 입출고 정보 삭제
	@Override
	public int deletePack(PurchPackVO vo) throws Exception {
		return mapper.deletePack(vo);
	}

	// 부자재 구입 / 입출고 수정
	@Override
	public int updatePack(PurchPackVO vo) throws Exception {
		log.info("부자재 구입 / 입출고 수정 updatePack vo : "+vo);
		return mapper.updatePack(vo);
	}
}
