package com.rbac.param;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

/**
 * Created by lxw on 2018/1/20.
 */
@Setter
@Getter
@ToString
public class DeptParam {

    private Integer id;

    @NotBlank(message = "部门名称不能为空")
    @Length(max = 15, min = 2, message = "部门名称需要在2-15个字之间")
    private String name;

    private Integer parentId;

    @NotNull(message = "展示顺序不可以为空")
    private Integer seq;

    @Length(max = 150, message = "备注长度需要在150个字以内")
    private String remark;

}
