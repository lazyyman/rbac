package com.rbac.dto;

import com.google.common.collect.Lists;
import com.rbac.model.SysDept;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * Created by lxw on 2018/1/20.
 */
@Setter
@Getter
@ToString
public class DeptLevelDto extends SysDept {

    private List<DeptLevelDto> deprList = Lists.newArrayList();

    public static DeptLevelDto adapt(SysDept dept) {
        DeptLevelDto dto = new DeptLevelDto();
        BeanUtils.copyProperties(dept, dto);
        return dto;
    }

}
