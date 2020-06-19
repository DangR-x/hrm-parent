package com.highnes.attractinvestment;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Maps;
import com.highnes.attractinvestment.common.utils.EncryptUtil;
import com.highnes.attractinvestment.entity.ProjectInfo;
import com.highnes.attractinvestment.entity.ProjectInvestor;
import com.highnes.attractinvestment.entity.SysDept;
import com.highnes.attractinvestment.entity.SysUser;
import com.highnes.attractinvestment.mapper.ProjectInfoMapper;
import com.highnes.attractinvestment.service.IProjectInvestorService;
import com.highnes.attractinvestment.service.impl.ProjectInfoServiceImpl;
import com.highnes.attractinvestment.service.impl.SysDeptServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RunWith(SpringRunner.class)
@SpringBootTest
class AttractinvestmentApplicationTests {

    @Autowired
    private ProjectInfoMapper projectInfoMapper;

    @Autowired
    private IProjectInvestorService projectInvestorService;

    @Autowired
    private ProjectInfoServiceImpl projectInfoService;

    @Autowired
    private SysDeptServiceImpl sysDeptService;


    @Test
    public void getDeptById(){
        List<SysUser> deptUserByDeptId = sysDeptService.findDeptUserByDeptId(105L);
        for (SysUser sysUser : deptUserByDeptId) {
            System.out.println(sysUser);
        }
//        List<SysDept> deptByparentId = sysDeptService.findDeptByparentId(101L);
//        for (SysDept sysDept : deptByparentId) {
//            System.out.println(sysDept);
//        }
    }


    @Test
    public void setProjectInfoMapper(){

        ProjectInfo projectInfo = new ProjectInfo();
        projectInfo.setTitle(null);
        projectInfo.setCode("");
        projectInfo.setUrgeFlag(null);
        projectInfo.setUrgeType(null);
        projectInfo.setStepStatus(null);
        projectInfo.setClassifyType(null);
        projectInfo.setClassifyTypeTwo(null);
        projectInfo.setSourceType(null);
        projectInfo.setGroupId(null);
        projectInfo.setTransferFlag(null);

        Map<String, Object> paras = Maps.newHashMap();
        paras.put("startCast", null);
        paras.put("endCast", null);
        paras.put("companyName", null);
        paras.put("companyCode", null);
        paras.put("companyUser", null);
        paras.put("companyAddress", null);
        paras.put("companyClassify", null);
        projectInfo.setParas(paras);
        projectInfo.setPageNo(1);
        projectInfo.setPageSize(10);
        projectInfo.setStatus("3");
        projectInfo.setItemType("楼宇类项目");
        PageInfo<ProjectInfo> page = projectInfoService.findPage(projectInfo);
        for (ProjectInfo info : page.getList()) {
            System.out.println(info);
        }
    }
    @Test
    public void testUUID(){
        String s = UUID.randomUUID().toString().replaceAll("-", "");
        System.out.println(s);
    }

    @Test
    public void saveprojectInfoMapper(){
//        ProjectInfo projectInfo = new ProjectInfo();
//        projectInfo.setTitle("深化与中国电科集团量子通信领域合作");
//        projectInfo.setCode("Z201904000001");
//        String filePath = "E:/typora/node/工作簿1.xlsx";
//        File file = new File(filePath);
//        try {
//            ImportExcel importExcel = new ImportExcel(file, 1);
//            List<ProjectInfo> dataList = importExcel.getDataList(ProjectInfo.class);
//            for (ProjectInfo projectInfo : dataList) {
//                System.out.println(projectInfo);
//            }
//        } catch (InvalidFormatException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        } catch (InstantiationException e) {
//            e.printStackTrace();
//        }

    }




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
//
//        String filePath = "E:/typora/node/工作簿1.xlsx";
//
//        ImportParams params = new ImportParams();
//
//        //params.setNeedSave(true);
//        //params.setSaveUrl("/excel/");
//        try {
//            List<SaveProjectInfo> objects = ExcelImportUtil.importExcel(new File(filePath), SaveProjectInfo.class, params);
//            for (Object object : objects) {
//                projectInfoService.save((ProjectInfo) object);
//            }
//        } catch (NoSuchElementException e) {
//
//        }
    }

    @Test
    void projectList() {
//        ArrayList<ProjectInvestor> projectInvestors = new ArrayList<>();
//        ProjectInvestor projectInvestor = new ProjectInvestor();
//        projectInvestor.setProjectId("123456132");
//        projectInvestor.setInvestorname("小小东haha");
//        projectInvestor.setDocumentnumber("1235622");
//        //projectInvestor.setId(6L);
//        projectInvestors.add(projectInvestor);
//        projectInvestorService.insertList(projectInvestors, "7afdb8a959574491ab963985caff2b0d");
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

