package com.hongsi.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.hongsi.purchshop.vo.PurchOrderVO;


public class PurchshopExcelView extends AbstractXlsxView {
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("-----");		
		
//		String name = model.get("name").toString();
//		System.out.println("name : "+name);
		
		List <PurchOrderVO> excelList = (List<PurchOrderVO>) model.get("excelList");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //원하는 데이터 포맷 지정 String strNowDate = simpleDateFormat.format(nowDate);

		DecimalFormat df = new DecimalFormat("#,##0");
	
		Sheet sheet = workbook.createSheet("생산&주문&판매");
		Row row = null;
		int rowCount = 0;
		int cellCount = 0;
		
		CellStyle styleNum = workbook.createCellStyle();            
		styleNum.setAlignment(HorizontalAlignment.RIGHT);
		CellStyle styleCenter = workbook.createCellStyle();            
		styleNum.setAlignment(HorizontalAlignment.CENTER);
        
		// 제목 Cell 생성
		row = sheet.createRow(rowCount++);
		row.createCell(cellCount++).setCellValue("생산 & 주문 & 판매 LIST");
		
		cellCount = 0;
		row = sheet.createRow(rowCount++);
		row.createCell(cellCount++).setCellValue("주문일");
		row.createCell(cellCount).setCellStyle(styleCenter);
		row.createCell(cellCount++).setCellValue("구분");		
		row.createCell(cellCount++).setCellValue("O250");
		row.createCell(cellCount++).setCellValue("O500");
		row.createCell(cellCount++).setCellValue("O1000");
		row.createCell(cellCount++).setCellValue("E250");
		row.createCell(cellCount++).setCellValue("E500");
		row.createCell(cellCount++).setCellValue("E1000");
		row.createCell(cellCount++).setCellValue("S250");
		row.createCell(cellCount++).setCellValue("S500");
		row.createCell(cellCount++).setCellValue("S1000");		
		row.createCell(cellCount++).setCellValue("총주문");
		row.createCell(cellCount++).setCellValue("주문경로");
		row.createCell(cellCount++).setCellValue("주문자");
		row.createCell(cellCount++).setCellValue("비고");
		
		for(PurchOrderVO vo : excelList) {
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			row.createCell(cellCount++).setCellValue(sdf.format(vo.getOrderDate()));
			row.createCell(cellCount++).setCellValue(vo.getGubun());
			row.createCell(cellCount++).setCellValue(vo.getOri_250());
			row.createCell(cellCount++).setCellValue(vo.getOri_500());
			row.createCell(cellCount++).setCellValue(vo.getOri_1000());
			row.createCell(cellCount++).setCellValue(vo.getErl_250());
			row.createCell(cellCount++).setCellValue(vo.getErl_500());
			row.createCell(cellCount++).setCellValue(vo.getErl_1000());
			row.createCell(cellCount++).setCellValue(vo.getStc_250());
			row.createCell(cellCount++).setCellValue(vo.getStc_500());
			row.createCell(cellCount++).setCellValue(vo.getStc_1000());
			row.createCell(cellCount++).setCellValue(vo.getOri_250()+vo.getOri_500()+vo.getOri_1000()+
					vo.getErl_250()+vo.getErl_500()+vo.getErl_1000()+vo.getStc_250()+vo.getStc_500()+vo.getStc_1000());
			row.createCell(cellCount++).setCellValue(vo.getSalePath() );
			row.createCell(cellCount++).setCellValue(vo.getOrderer());
			row.createCell(cellCount++).setCellValue(vo.getComm());
		}
	}
}
