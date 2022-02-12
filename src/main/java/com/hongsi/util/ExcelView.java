package com.hongsi.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.hongsi.purchbook.vo.PurchIngVO;

public class ExcelView extends AbstractXlsxView {
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("-----");		
		
		List <PurchIngVO> buyList = (List<PurchIngVO>) model.get("buyList");
		
		Sheet sheet = workbook.createSheet("재료주문");
		Row row = null;
		int rowCount = 0;
		int cellCount = 0;
		
		// 제목 Cell 생성
		row = sheet.createRow(rowCount++);
		row.createCell(cellCount++).setCellValue("재료 구매 List");
		
		cellCount = 0;
		row = sheet.createRow(rowCount++);
		row.createCell(cellCount++).setCellValue("주문일");
		row.createCell(cellCount++).setCellValue("구분");
		row.createCell(cellCount++).setCellValue("주문품");
		row.createCell(cellCount++).setCellValue("용량(g)");
		row.createCell(cellCount++).setCellValue("수량(개)");
		row.createCell(cellCount++).setCellValue("금액(원)");
		row.createCell(cellCount++).setCellValue("거래처");
		row.createCell(cellCount++).setCellValue("입고일");
		row.createCell(cellCount++).setCellValue("비고");
		
		for(PurchIngVO vo : buyList) {
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			row.createCell(cellCount++).setCellValue(vo.getBuyDate());
			row.createCell(cellCount++).setCellValue(vo.getGubun());
			row.createCell(cellCount++).setCellValue(vo.getItem());
			row.createCell(cellCount++).setCellValue(vo.getContent());
			row.createCell(cellCount++).setCellValue(vo.getQty());
			row.createCell(cellCount++).setCellValue(vo.getPrice());
			row.createCell(cellCount++).setCellValue(vo.getPurShop());
			row.createCell(cellCount++).setCellValue(vo.getInDate());
			row.createCell(cellCount++).setCellValue(vo.getComm());
		}

	}

}
