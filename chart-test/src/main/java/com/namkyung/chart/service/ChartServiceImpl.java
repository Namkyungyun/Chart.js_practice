package com.namkyung.chart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.namkyung.chart.dao.ChartDAO;
import com.namkyung.chart.vo.ChartVO;

@Service
public class ChartServiceImpl implements ChartService{

	@Autowired
	private ChartDAO cdao;
	
	@Override
	public List<ChartVO> searchChartData() {
		
		return cdao.selectChartData();
	}

}
