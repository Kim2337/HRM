package members.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import user.domain.DeptDTO;
import user.domain.EmpDto;

public class MembersDao extends SqlSessionDaoSupport{

	
	//부서 선택 
	public List<DeptDTO> selectDepts(){
		return getSqlSession().selectList("members.depts");
	}
	
	//사원 선택 
	public List<Map<String,Object>> selectEmps(int deptno){
		return getSqlSession().selectList("members.emps", deptno);
	}
	
	public List<String> selectNames(){
		return getSqlSession().selectList("members.empNames");
	}

	//검색 옵션 키워드 
	public List<EmpDto> searchName(String searchOption, String keyword){
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		
		return getSqlSession().selectList("members.searchName", map);
		
	}
}
