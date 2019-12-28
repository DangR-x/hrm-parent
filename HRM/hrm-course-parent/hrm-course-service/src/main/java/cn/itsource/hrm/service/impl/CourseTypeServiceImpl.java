package cn.itsource.hrm.service.impl;

import cn.itsource.basic.util.PageList;
import cn.itsource.hrm.domain.CourseType;
import cn.itsource.hrm.mapper.CourseTypeMapper;
import cn.itsource.hrm.query.CourseTypeQuery;
import cn.itsource.hrm.service.ICourseTypeService;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程目录 服务实现类
 * </p>
 *
 * @author DangR-X
 * @since 2019-12-26
 */
@Service
@Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
public class CourseTypeServiceImpl extends ServiceImpl<CourseTypeMapper, CourseType> implements ICourseTypeService {

    @Autowired
    private CourseTypeMapper courseTypeMapper;

    @Override
    public List<CourseType> getTreeDate() {
       /* List<CourseType> parent = getParentBypid(0L);*/
        List<CourseType> parent = getFirstlenven();

        return parent;
    }
    //根据数据库中的parentid可以快速确定第一个父级，表中设计的parentid=0的都是第一父级
    //用递归的方法
    public List<CourseType> getParentBypid(Long pid){

        List<CourseType> children = courseTypeMapper.selectList(new QueryWrapper<CourseType>().eq("pid", pid));

        //根据parentid查询出来的是空的话就说明
        if(children==null||children.size()==0){
            return null;
        }
        for (CourseType child : children) {
            List<CourseType> childs = getParentBypid(child.getId());
            child.setChildren(childs);
        }

        return children;
    }
    //循环嵌套的方法
    public List<CourseType> getFirstlenven(){

        List<CourseType> firstlenven = new ArrayList<>();

        //先查询所有的数据
        List<CourseType> courseTypes = courseTypeMapper.selectList(null);

        for (CourseType courseType : courseTypes) {
            if(courseType.getPid()==0L){
                firstlenven.add(courseType);
            }else {
                for (CourseType course : courseTypes) {
                    if(course.getId().longValue()==courseType.getPid().longValue()){
                        course.getChildren().add(courseType);
                    }
                }
            }
        }


        return firstlenven;

    }


}
