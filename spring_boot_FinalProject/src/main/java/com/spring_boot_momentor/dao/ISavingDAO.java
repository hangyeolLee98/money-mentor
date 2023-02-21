package com.spring_boot_momentor.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.SavingOptionVO;


public interface ISavingDAO {
	public void insertSavingBase(SavingBaseVO vo);
	public void insertSavingOption(SavingOptionVO vo);
	public ArrayList<SavingBaseVO> listAllSaving();//전체 적금 조회
	public ArrayList<SavingBaseVO> savingSearch(HashMap<String, Object> map); //적금 검색
	public ArrayList<SavingBaseVO> SavingCompare(String savingID); //적금 비교 넣기
	public ArrayList<SavingBaseVO> SavingCompareModal(String savingID); //적금 비교 모달
}
