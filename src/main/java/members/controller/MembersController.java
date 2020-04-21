package members.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import members.service.MembersService;
import user.domain.DeptDTO;
import user.domain.EmpDto;


@Controller
class MembersController {
	
	@Autowired
	MembersService service;
	
	
	public void setService(MembersService service) {
		this.service = service;
	}

	@RequestMapping(value = "/members/list.do")
	public String emp() {
		return "members/list";
	}

	@RequestMapping(value = "/members/depts.do", method = RequestMethod.POST)
	public void deptList(HttpServletResponse resp) throws Exception {
		List<DeptDTO> list = service.selectDepts();
		Gson json = new Gson(); // JASON 객체생성
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list)); // out.print 내용을 ajax의 dataType이 jason에게 데이터 쏴줌
	}

	@RequestMapping(value = "/members/emps.do", method =  {RequestMethod.GET, RequestMethod.POST}, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String empList(int deptno) throws Exception {
		List<Map<String,Object>> list = service.selectEmps(deptno);
		Gson json = new Gson(); 
		return json.toJson(list);
	}
	
	@RequestMapping("/members/search.do")
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption, 
							@RequestParam(defaultValue="") String keyword) throws Exception{
		List<EmpDto> list = service.searchName(searchOption, keyword);
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.putIfAbsent("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return mav;
	}
	
}
