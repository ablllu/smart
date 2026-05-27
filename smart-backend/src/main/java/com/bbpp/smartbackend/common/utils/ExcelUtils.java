package com.bbpp.smartbackend.common.utils;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

public class ExcelUtils {

    /**
     * 导出 Excel 文件
     *
     * @param response HTTP 响应对象，用于输出 Excel 文件流
     * @param fileName 导出的文件名（不含扩展名）
     * @param sheetName Excel 工作表名称
     * @param headers 表头列表，每个元素对应一列的标题
     * @param rows 数据行列表，每行是一个 List<Object>，包含该行的所有单元格数据
     * @throws IOException
     */
    public static void export(
            HttpServletResponse response,
            String fileName,
            String sheetName,
            List<String> headers,
            List<List<Object>> rows
    ) throws IOException {

        //1. 创建工作簿和工作表
        Workbook workbook =
                new XSSFWorkbook();

        Sheet sheet = workbook.createSheet(sheetName);

        // 写入表头
        Row headerRow = sheet.createRow(0);

        for(int i = 0; i < headers.size(); i++) {

            Cell cell = headerRow.createCell(i);

            cell.setCellValue(headers.get(i));
        }

        // 数据
        for(int i = 0; i < rows.size(); i++) {

            Row row = sheet.createRow(i+1);

            List<Object> data = rows.get(i);

            for(int j = 0; j < data.size(); j++) {

                Cell cell = row.createCell(j);

                Object value = data.get(j);

                if(value != null) {
                    cell.setCellValue(value.toString());
                }
            }
        }

        // 下载响应
        response.setContentType(
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        );

        response.setCharacterEncoding("utf-8");

        fileName = URLEncoder.encode(fileName, "UTF-8");

        response.setHeader(
                "Content-disposition",
                "attachment;filename=" + fileName + ".xlsx"
                );

        workbook.write(response.getOutputStream());

        workbook.close();
    }
}
