package com.namkyung.chart.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.namkyung.chart.dao.ChartDAO;
import com.namkyung.chart.service.ChartService;
import com.namkyung.chart.vo.ChartVO;

@Controller
public class ChartContoller {

	@Autowired
	private ChartService cservice;
	
	@RequestMapping("/chart")
	public String chart() {
		
		
		return "index";
	}
	
	@RequestMapping("/chartshow")
	@ResponseBody
	public String chart(HttpServletRequest req, ChartVO vo) {
		
		List<ChartVO> list = cservice.searchChartData();
		req.setAttribute("list", list);
		
		HashMap map = new HashMap();
		map.put("list", list);

		String json =null;
		try {
			json = new ObjectMapper().writeValueAsString(map);
			System.out.println(json);

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return json;
		
	
	}
	
}
