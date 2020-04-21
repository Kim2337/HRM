package members.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import members.persistence.MembersDao;
import user.domain.DeptDTO;
import user.domain.EmpDto;

@Service
public class MembersService {
	@Autowired
	MembersDao dao;

	public void setDao(MembersDao dao) {
		this.dao = dao;
	}
	
	public List<DeptDTO> selectDepts(){
		
		return dao.selectDepts();
	}
	public List<Map<String,Object>> selectEmps(int deptno){
		return dao.selectEmps(deptno);
	}
	
	public List<String> selectNames(){
		return dao.selectNames();
	}

	public List<EmpDto> searchName(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return dao.searchName(searchOption, keyword);
	}
	

}
