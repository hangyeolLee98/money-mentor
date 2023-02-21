package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.IInsuDAO;
import com.spring_boot_momentor.model.InsuVO;

@Service
public class InsuService implements IInsuService{
	@Autowired
	@Qualifier("IInsuDAO")
	IInsuDAO dao;
	
	@Override
	public void insertInsu(InsuVO vo) {
		dao.insertInsu(vo);	
	}

	public ArrayList<InsuVO> listAllInsu() {
		return dao.listAllInsu();
	}
	@Override
	// 검색
	public ArrayList<InsuVO> InsuAllSearch(String insuId) {
		return dao.InsuAllSearch(insuId);
	}

	public InsuVO InsuCompare(String insuId) {
		return dao.InsuCompare(insuId);
	}

	public ArrayList<InsuVO> insuCategory1(String insuCtg) {
		return dao.insuCategory1(insuCtg);
	}

	public ArrayList<InsuVO> insuCategory2(String prdLogo) {
		return dao.insuCategory2(prdLogo);
	}
	
	
	public ArrayList<InsuVO> insuCategory3(int insuIndex) {
		float min = 0.0f;
		float max = 99999999.0f;
		HashMap<String, Float> map = new HashMap<String, Float>();  
		if (insuIndex==1) {
			max = 80.0f;
		}else if(insuIndex==2){
			min = 80.0f;
			max = 90.0f;
		}else if(insuIndex==3){
			min = 90.0f;
			max = 100.0f;
		}else if(insuIndex==4){
			min = 100.0f;
			max = 110.0f;
		}else if(insuIndex==5){
			min = 110.0f;
			max = 120.0f;
		}else if(insuIndex==6){
			min = 120.0f;
			max = 999999.0f;
		}
		map.put("min",  min);
		map.put("max",  max);
		
		return dao.insuCategory3(map);
	}

	public ArrayList<InsuVO> insuCategory4(String insuCtg, String prdLogo) {
		return dao.insuCategory4(insuCtg,prdLogo);
	}

	public ArrayList<InsuVO> insuCategory5(String insuCtg, String prdLogo, int insuIndex) {
		float min = 0.0f;
		float max = 99999999.0f;
		HashMap<String, Object> map = new HashMap<String, Object>();  
		if (insuIndex==1) {
			max = 80.0f;
		}else if(insuIndex==2){
			min = 80.0f;
			max = 90.0f;
		}else if(insuIndex==3){
			min = 90.0f;
			max = 100.0f;
		}else if(insuIndex==4){
			min = 100.0f;
			max = 110.0f;
		}else if(insuIndex==5){
			min = 110.0f;
			max = 120.0f;
		}else if(insuIndex==6){
			min = 120.0f;
			max = 999999.0f;
		}
		map.put("min",  min);
		map.put("max",  max);
		map.put("insuCtg",  insuCtg);
		map.put("prdLogo",  prdLogo);
		
		return dao.insuCategory5(map);
	}
	
}
