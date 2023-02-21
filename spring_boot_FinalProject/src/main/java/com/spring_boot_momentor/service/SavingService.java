package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.ISavingDAO;
import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.SavingOptionVO;




@Service
public class SavingService implements ISavingService {
	@Autowired
	@Qualifier("ISavingDAO")
	ISavingDAO dao;

	@Override
	public void insertSavingBase(SavingBaseVO vo) {
		dao.insertSavingBase(vo);
		
	}

	@Override
	public void insertSavingOption(SavingOptionVO vo) {
		dao.insertSavingOption(vo);
		
	}
	
	@Override
	public ArrayList<SavingBaseVO> listAllSaving() {
		return dao.listAllSaving();
	}

	
	@Override
	public ArrayList<SavingBaseVO> savingSearch(HashMap<String, Object> map) {
		return dao.savingSearch(map);
	}

	//적금 비교 넣기
	public ArrayList<SavingBaseVO> SavingCompare(String savingID) {
		return dao.SavingCompare(savingID);	
	}
	
	//적금 비교 모달
	public ArrayList<SavingBaseVO> SavingCompareModal(String savingID){
		return dao.SavingCompareModal(savingID);
	}
}
