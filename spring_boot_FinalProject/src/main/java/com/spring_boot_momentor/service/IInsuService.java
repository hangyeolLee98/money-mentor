package com.spring_boot_momentor.service;

import java.util.ArrayList;


import com.spring_boot_momentor.model.InsuVO;

public interface IInsuService {
	public void insertInsu(InsuVO vo);
	public ArrayList<InsuVO> listAllInsu();
	
	public ArrayList<InsuVO> InsuAllSearch(String insuId);
	public InsuVO InsuCompare(String insuId);
	public ArrayList<InsuVO> insuCategory1(String insuCtg);
	public ArrayList<InsuVO> insuCategory2(String prdLogo);
	public ArrayList<InsuVO> insuCategory3(int insuIndex);
	public ArrayList<InsuVO> insuCategory4(String insuCtg, String prdLogo);
	public ArrayList<InsuVO> insuCategory5(String insuCtg, String prdLogo, int insuIndex);
}
