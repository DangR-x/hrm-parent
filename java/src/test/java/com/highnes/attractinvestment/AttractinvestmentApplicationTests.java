package com.highnes.attractinvestment;

import ch.qos.logback.core.net.SyslogOutputStream;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.highnes.attractinvestment.common.excel.ImportExcel;
import com.highnes.attractinvestment.common.utils.EncryptUtil;
import com.highnes.attractinvestment.entity.ProjectInfo;
import com.highnes.attractinvestment.entity.ProjectInvestor;
import com.highnes.attractinvestment.entity.SaveProjectInfo;
import com.highnes.attractinvestment.mapper.ProjectInfoMapper;
import com.highnes.attractinvestment.service.IProjectInvestorService;
import com.highnes.attractinvestment.service.impl.ProjectInfoServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

@RunWith(SpringRunner.class)
@SpringBootTest
class AttractinvestmentApplicationTests {

    @Autowired
    private ProjectInfoMapper projectInfoMapper;

    @Autowired
    private IProjectInvestorService projectInvestorService;

    @Autowired
    private ProjectInfoServiceImpl projectInfoService;



    @Test
    public void saveprojectInfoMapper(){
//        ProjectInfo projectInfo = new ProjectInfo();
//        projectInfo.setTitle("深化与中国电科集团量子通信领域合作");
//        projectInfo.setCode("Z201904000001");
        String filePath = "E:/typora/node/工作簿1.xlsx";
        File file = new File(filePath);
        try {
            ImportExcel importExcel = new ImportExcel(file, 1);
            List<ProjectInfo> dataList = importExcel.getDataList(ProjectInfo.class);
            for (ProjectInfo projectInfo : dataList) {
                System.out.println(projectInfo);
            }
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }

    }




    /**
     * excel 导入
     *
     * @param filePath   excel文件路径
     * @param titleRows  标题行
     * @param headerRows 表头行
     * @param pojoClass  pojo类型
     * @param <T>
     * @return
     */
//    public static <T> List<T> importExcel(String filePath, Integer titleRows, Integer headerRows, Class<T> pojoClass)
//            throws IOException {
//        if (StringUtils.isBlank(filePath)) {
//            return null;
//        }
//        ImportParams params = new ImportParams();
//        params.setTitleRows(titleRows);
//        params.setHeadRows(headerRows);
//        params.setNeedSave(true);
//        params.setSaveUrl("/excel/");
//        try {
//            return ExcelImportUtil.importExcel(new File(filePath), pojoClass, params);
//        } catch (NoSuchElementException e) {
//            throw new IOException("模板不能为空");
//        } catch (Exception e) {
//            throw new IOException(e.getMessage());
//        }
//    }

    @Test
    void excelTest() {

        String filePath = "E:/typora/node/工作簿1.xlsx";

        ImportParams params = new ImportParams();

        //params.setNeedSave(true);
        //params.setSaveUrl("/excel/");
        try {
            List<SaveProjectInfo> objects = ExcelImportUtil.importExcel(new File(filePath), SaveProjectInfo.class, params);
            for (Object object : objects) {
                projectInfoService.save((ProjectInfo) object);
            }
        } catch (NoSuchElementException e) {

        }
    }

    @Test
    void projectList() {
        ArrayList<ProjectInvestor> projectInvestors = new ArrayList<>();
        ProjectInvestor projectInvestor = new ProjectInvestor();
        projectInvestor.setProjectId("123456132");
        projectInvestor.setInvestorname("小小东haha");
        projectInvestor.setDocumentnumber("1235622");
        //projectInvestor.setId(6L);
        projectInvestors.add(projectInvestor);
        projectInvestorService.insertList(projectInvestors, "7afdb8a959574491ab963985caff2b0d");
    }

    @Test
    void project() {
        ProjectInvestor projectInvestor = new ProjectInvestor();
        projectInvestor.setProjectId("5132132");
        projectInvestor.setInvestorname("晓东");
        projectInvestor.setDocumentnumber("1235622");
        projectInvestorService.insert(projectInvestor);
    }

    @Test
    void contextLoads() {
        String mima = "MTIzNDU2";

        String encryPassword = EncryptUtil.encrypt("123456");
        boolean equals = encryPassword.equals(mima);
        System.out.println(equals);
    }

    @Test
    void testAddress() {
        String msg = "市内";
        String cq = "重庆";
        String gt = "香港";
        String add = "来自台湾有什么";
        if (add.indexOf(cq) != -1) {
            msg = "市内";
        } else if (add.indexOf(gt) != -1 || add.indexOf("台湾") != -1 || add.indexOf("澳门") != -1) {
            msg = "港澳台";
        } else {
            msg = "境外";
        }
        System.out.println(msg);
    }

}

