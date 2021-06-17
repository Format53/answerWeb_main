package cn.edu.lingnan.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Component
public interface TestMapper {

	// 查询test表
	public List selectTest();

}
