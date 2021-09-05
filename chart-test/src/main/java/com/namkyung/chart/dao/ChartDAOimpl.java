package com.namkyung.chart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.namkyung.chart.vo.ChartVO;

@Controller
public class ChartDAOimpl implements ChartDAO{

	@Autowired
	private SqlSession SqlSession;
	
	@Override
	public List<ChartVO> selectChartData() {
		List<ChartVO> list = SqlSession.selectList("board.selectChart");
		return list;
	}

}
