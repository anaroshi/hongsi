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

import com.hongsi.purchbook.vo.PurchIngVO;


public class PurchIngExcelView extends AbstractXlsxView {
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("-----");		
		
//		String name = model.get("name").toString();
//		System.out.println("name : "+name);
		
		List <PurchIngVO> excelList = (List<PurchIngVO>) model.get("excelList");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //원하는 데이터 포맷 지정 String strNowDate = simpleDateFormat.format(nowDate);

		DecimalFormat df = new DecimalFormat("#,##0");
	
		Sheet sheet = workbook.createSheet("재료구매&입출고");
		Row row = null;
		int rowCount = 0;
		int cellCount = 0;
		
		CellStyle styleNum = workbook.createCellStyle();            
		styleNum.setAlignment(HorizontalAlignment.RIGHT);
		CellStyle styleCenter = workbook.createCellStyle();            
		styleNum.setAlignment(HorizontalAlignment.CENTER);
        
		// 제목 Cell 생성
		row = sheet.createRow(rowCount++);
		row.createCell(cellCount++).setCellValue("재료 구매 & 입출고 LIST");
		
		cellCount = 0;
		row = sheet.createRow(rowCount++);
		row.createCell(cellCount++).setCellValue("주문일");
		row.createCell(cellCount).setCellStyle(styleCenter);
		row.createCell(cellCount++).setCellValue("구분");
		row.createCell(cellCount++).setCellValue("주문품");
		row.createCell(cellCount++).setCellValue("용량(g)");
		row.createCell(cellCount++).setCellValue("수량(개)");
		row.createCell(cellCount++).setCellValue("총용량(g)");
		row.createCell(cellCount++).setCellValue("금액(원)");
		row.createCell(cellCount++).setCellValue("거래처");
		row.createCell(cellCount++).setCellValue("입고일");
		row.createCell(cellCount++).setCellValue("비고");
		row.createCell(cellCount++).setCellValue("구매자");
		
		for(PurchIngVO vo : excelList) {
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			row.createCell(cellCount++).setCellValue(sdf.format(vo.getBuyDate()));
			row.createCell(cellCount++).setCellValue(vo.getGubun());
			row.createCell(cellCount++).setCellValue(vo.getItem());
			row.createCell(cellCount++).setCellValue(df.format(vo.getContent()));
			row.createCell(cellCount).setCellStyle(styleNum);
			row.createCell(cellCount++).setCellValue(vo.getQty());
			row.createCell(cellCount).setCellStyle(styleNum);
			row.createCell(cellCount++).setCellValue(df.format(vo.getSumQty()));
			row.createCell(cellCount).setCellStyle(styleNum);
			row.createCell(cellCount++).setCellValue(df.format(vo.getPrice()));
			row.createCell(cellCount).setCellStyle(styleNum);
			row.createCell(cellCount++).setCellValue(vo.getPurShop());
			row.createCell(cellCount++).setCellValue(sdf.format(vo.getInDate()));
			row.createCell(cellCount++).setCellValue(vo.getComm());
			row.createCell(cellCount++).setCellValue(vo.getBuyer());
		}
	}
}
