package cn.edu.lingnan.controller;

import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class XlsController extends BaseController{
    @Autowired
    private UserService userService;

    @RequestMapping("/showXlsPage")
    public String showXlsPage(){

        return "/admin/xlsWrite";
    }

    @RequestMapping("/insertUserByXls")
    @ResponseBody
    public String insertUserByXls(MultipartFile file1,String str,String array) throws IOException {
        ObjectMapper objectMapper=new ObjectMapper();
        String nativeStr=str;
        List<String> arrayList=(List)objectMapper.readValue(array,List.class);
        InputStream inputStream=file1.getInputStream();
        String filename=file1.getOriginalFilename();

        Workbook workbook=null;
        String fileType=filename.substring(filename.lastIndexOf("."));
        if(".xls".equals(fileType)){
            workbook =new HSSFWorkbook(inputStream);
        }else if(".xlsx".equals(fileType)){
            workbook =new XSSFWorkbook(inputStream);
        }

        ArrayList<ArrayList<Object>>list=new ArrayList<>();
        Sheet sheet;
        Row row;
        Cell cell;

//        for(int i=0;i<workbook.getNumberOfSheets();i++){
//            sheet=workbook.getSheetAt(i);
//            for(int j=sheet.getFirstRowNum();j<=sheet.getLastRowNum();j++){
//                row=sheet.getRow(j);
//                if(row!=null&&row.getFirstCellNum()!=j){
//                    ArrayList tempList=new ArrayList();
//                    for(int k=row.getFirstCellNum();k<row.getLastCellNum();k++){
//                        cell=row.getCell(k);
//                        tempList.add(cell);
//                    }
//                    list.add(tempList);
//                }
//            }
//        }
        sheet=workbook.getSheetAt(0);
        for(int i=5;i<=sheet.getLastRowNum();i++){
            row=sheet.getRow(i);
            User user = new User();

            User userTry= userService.findUserByEmail(String.valueOf(row.getCell(1)));
            if(userTry!=null){
                System.out.println("用户已存在");
            }else {
                SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
                user.setNewdate(format.format(new Date()));
                float tempF=Float.parseFloat(row.getCell(0).toString());
                int no=(int) tempF;
                user.setUserno(no);
                user.setEmail(String.valueOf(row.getCell(1)));
                user.setUsername(String.valueOf(row.getCell(3)));
                user.setSex(String.valueOf(row.getCell(4)));
                user.setStatus(1);
                user.setPassword(String.valueOf(row.getCell(1)));
                int flag=userService.register(user);
                if(flag>0){
                    System.out.println("注册成功");
                }
            }
        }

        return "success";
    }
}























