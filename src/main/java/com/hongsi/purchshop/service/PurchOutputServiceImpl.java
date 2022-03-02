package com.hongsi.purchshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchOutputMapper;
import com.hongsi.purchshop.vo.PurchOutputVO;
import com.hongsi.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchOutputServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchOutputServiceImpl implements PurchOutputService {

	public PurchOutputMapper mapper;

	// M생산 등록
	@Override
	public int insertOutput(PurchOutputVO vo) {
		log.info("Gubun:"+vo.getGubun());		
		if(vo.getGubun().equals("생산_cafe")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("생산_마케팅")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("생산_개발")) vo.setGubunCode("in");
		log.info("---impl: vo"+vo);
		return mapper.insertOutput(vo);
	}

	// 리스트 화면에서 선택하여 실제 삭제가 아닌 UPDATE 처리함 FLAG = 4
	@Override
	public int deleteOutputInfoByCno(long cno) {
		log.info("impl deleteOutput cno:"+cno);
		return mapper.deleteOutputInfoByCno(cno);
	}
	
	// 리스트 화면에서 선택하여 M생산 수정 FLAG = 2
	@Override
	public int updateOutputInfoByCno(PurchOutputVO vo) {		
		if(vo.getGubun().equals("생산_cafe")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("생산_마케팅")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("생산_개발")) vo.setGubunCode("in");
		log.info("---impl: vo"+vo);		
		return mapper.updateOutputInfoByCno(vo);
	}
	
	// M생산 등록 리스트
	@Override
	public List<PurchOutputVO> selectOutputList(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getOutputTotalRow());
		return mapper.selectOutputList(pageObject);
	}

	@Override
	public PurchOutputVO selectOutputInfoByCno(int cno) {
		log.info("impl cno:"+cno);
		log.info(mapper.selectOutputInfoByCno(cno));
		return mapper.selectOutputInfoByCno(cno);
	}

}
