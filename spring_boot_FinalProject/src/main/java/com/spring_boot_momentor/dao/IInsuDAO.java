package com.spring_boot_momentor.dao;

import java.util.ArrayList;
import java.util.HashMap;


import com.spring_boot_momentor.model.InsuVO;

public interface IInsuDAO {
	public void insertInsu(InsuVO vo);
	public ArrayList<InsuVO> listAllInsu();

	public ArrayList<InsuVO> InsuAllSearch(String insuId);
	public InsuVO InsuCompare(String insuId);
	
	
	public ArrayList<InsuVO> insuCategory1(String insuCtg);
	public ArrayList<InsuVO> insuCategory2(String prdLogo);
	public ArrayList<InsuVO> insuCategory3(HashMap<String, Float> map);
	public ArrayList<InsuVO> insuCategory4(String insuCtg, String prdLogo);
	public ArrayList<InsuVO> insuCategory5(HashMap<String, Object> map);
}
