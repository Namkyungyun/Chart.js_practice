package com.namkyung.chart.dao;

import java.util.List;

import com.namkyung.chart.vo.ChartVO;

public interface ChartDAO {
	
	public List<ChartVO> selectChartData();
}
