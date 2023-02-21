package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.IAnnuitySavingDAO;
import com.spring_boot_momentor.model.AnnuitySavingBaseVO;
import com.spring_boot_momentor.model.AnnuitySavingOptionVO;


@Service
public class AnnuitySavingService implements IAnnuitySavingService {
	@Autowired
	@Qualifier("IAnnuitySavingDAO")
	IAnnuitySavingDAO dao;
	
	@Override
	public void insertAnnuitySavingBase(AnnuitySavingBaseVO vo) {
		dao.insertAnnuitySavingBase(vo);

	}

	@Override
	public void insertAnnuitySavingOption(AnnuitySavingOptionVO vo) {
		dao.insertAnnuitySavingOption(vo);

	}
	
	@Override
	public ArrayList<AnnuitySavingBaseVO> listAllAnnuitySaving() {
		return dao.listAllAnnuitySaving();
	}
	
	@Override
	public ArrayList<AnnuitySavingBaseVO> AnnuitySavingSearch(HashMap<String, String> map) {
		return dao.AnnuitySavingSearch(map);
	}

	//연금 비교 넣기 
	@Override
	public ArrayList<AnnuitySavingBaseVO> AnnuitySavingCompare(String annuitySavingID){
		return dao.AnnuitySavingCompare(annuitySavingID);
	}
	
	//연금 비교 모달
	@Override
	public ArrayList<AnnuitySavingBaseVO> AnnuitySavingCompareModal(String annuitySavingID){
		return dao.AnnuitySavingCompareModal(annuitySavingID);
	}

}
