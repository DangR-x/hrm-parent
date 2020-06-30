package com.highnes.attractinvestment.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.highnes.attractinvestment.entity.BaseEntity;
import com.highnes.attractinvestment.entity.SysDept;
import com.highnes.attractinvestment.entity.SysUser;
import com.highnes.attractinvestment.mapper.SysDeptMapper;
import com.highnes.attractinvestment.mapper.SysUserMapper;
import com.highnes.attractinvestment.service.BaseService;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import java.util.stream.Collectors;


/**
 * 部门Service接口
 *
 * @author ranlj
 * @date 2020-05-18
 */
@Service
public class SysDeptServiceImpl extends BaseService<SysDeptMapper, SysDept> {


    private Logger logger = Logger.getLogger(SysDeptServiceImpl.class);

    @Autowired
    private SysUserServiceImpl sysUserService;

    @Autowired
    private SysDeptMapper sysDeptMapper;

    /**
     * 根据ID获取信息
     *
     * @param id
     * @return
     */
    @Override
    public SysDept get(String id) {
        return super.get(id);
    }


    /**
     * 查询列表
     *
     * @param sysDept
     * @return
     */
    @Override
    public List<SysDept> findList(SysDept sysDept) {
        return super.findList(sysDept);
    }


    /**
     * @param sysDept 部门id
     * @return 该部门所有成员
     */
    public List<SysUser> findDeptUserByDeptId(SysDept sysDept) {
//        //通过部门id查处该部门
//        SysDept sysDept1 = get(sysDept.getDeptId().toString());
        //判断该部门是几级部门
        String deptLevel = sysDept.getDeptLevel();
        SysDept sysDeptparent = new SysDept();
        // deptLevel 0全公司的员工 ， 1 分公司的全部员工   2，分公司部门的员工
        if (deptLevel.equals("0")) {
            SysUser sysUser = new SysUser();
            sysUser.setDeptId("");
            sysUser.setPageNo(sysDept.getPageNo());
            sysUser.setPageSize(sysDept.getPageSize());
            PageInfo<SysUser> page = sysUserService.findPage(sysUser);
            List<SysUser> list = page.getList();
            return list;
        } else if (deptLevel.equals("1")) {
            sysDeptparent.setParentId(sysDept.getDeptId());
            sysDeptparent.setPageNo(sysDept.getPageNo());
            sysDeptparent.setPageSize(sysDept.getPageSize());
            List<SysUser> deptChildrenByDeptId = findDeptChildrenByDeptId(sysDeptparent);
            return deptChildrenByDeptId;

        } else if (deptLevel.equals("2")) {
//            sysDeptparent.setParentId(sysDept.getParentId());
//            sysDeptparent.setPageNo(sysDept.getPageNo());
//            sysDeptparent.setPageSize(sysDept.getPageSize());
//            List<SysUser> deptChildrenByDeptId = findDeptChildrenByDeptId(sysDeptparent);
            SysUser sysUser = new SysUser();
            sysUser.setDeptId(sysDept.getDeptId().toString());
            PageInfo<SysUser> page = sysUserService.findPage(sysUser);
            return page.getList();
        }
        return null;
    }

    /**
     * @param sysDeptId
     * @return List<SysUser>
     */
    public List<SysUser> findDeptChildrenByDeptId(SysDept sysDeptId) {

        List<SysDept> list = sysDeptMapper.findList(sysDeptId);
        ArrayList<Long> depIds = new ArrayList();
        for (SysDept dept : list) {
            depIds.add(dept.getDeptId());
        }
        PageInfo<SysUser> userByDeptIds = sysUserService.findUserByDeptIds(depIds, sysDeptId.getPageNo(), sysDeptId.getPageSize());
        return userByDeptIds.getList();
    }


    /**
     * 分页查询
     *
     * @param sysDept
     * @return
     */
    @Override
    public PageInfo<SysDept> findPage(SysDept sysDept) {
        return super.findPage(sysDept);
    }

    /**
     * 保存
     *
     * @param sysDept
     */
    @Override
    @Transactional(readOnly = false)
    public void save(SysDept sysDept) {
        if (sysDept.getDeptId() != null) {
            sysDeptMapper.update(sysDept);
        } else {
            super.save(sysDept);
        }
    }

    /**
     * 删除
     *
     * @param sysDept
     */
    @Override
    @Transactional(readOnly = false)
    public void delete(SysDept sysDept) {
        sysDept.setDelFlag("1");
        super.delete(sysDept);
    }

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    @Transactional(readOnly = false)
    public int delete(String ids) {
        String[] arr = ids.split(",");
        for (String s : arr) {
            delete(new SysDept(s));
        }
        return arr.length;
    }

    /**
     * 得到树形结构
     *
     * @param sysDepts
     * @return
     */
    public List<SysDept> getTreeData(List<SysDept> sysDepts) {
        List<SysDept> firstList = sysDepts.stream()
                .filter((SysDept sysDept) -> BaseEntity.HEAD_OFFICE
                        .equals(sysDept.getDeptLevel()))
                .collect(Collectors.toList());
        List<SysDept> secondList = sysDepts.stream()
                .filter((SysDept sysDept) -> BaseEntity.HEAD_DEPT
                        .equals(sysDept.getDeptLevel()))
                .collect(Collectors.toList());
        List<SysDept> thirdList = sysDepts.stream()
                .filter((SysDept sysDept) -> BaseEntity.FOOT_DEPT
                        .equals(sysDept.getDeptLevel()))
                .collect(Collectors.toList());

        if (secondList.size() > 0) {
            secondList.forEach(sysDept1 -> {
                List<SysDept> branchList = thirdList.stream().filter(
                        (SysDept sysDept2) -> sysDept1.getDeptId()
                                .equals(sysDept2.getParentId())).collect(Collectors.toList());
                if (branchList.size() > 0) {
                    sysDept1.setChildren(branchList);
                }
            });
        }
        if (firstList.size() > 0) {
            firstList.forEach(sysDept1 -> {
                List<SysDept> regionalBranchList = secondList.stream().filter(
                        (SysDept sysDept2) -> sysDept1.getDeptId()
                                .equals(sysDept2.getParentId())).collect(Collectors.toList());
                if (regionalBranchList.size() > 0) {
                    sysDept1.setChildren(regionalBranchList);
                }
            });
        }
        return firstList.size() > 0 ? firstList
                : (secondList.size() > 0 ? secondList : thirdList);
    }
}
