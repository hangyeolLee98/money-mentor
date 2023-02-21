package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_momentor.model.AnnuitySavingBaseVO;
import com.spring_boot_momentor.model.AnnuitySavingOptionVO;



public interface IAnnuitySavingService {
	public void insertAnnuitySavingBase(AnnuitySavingBaseVO vo);
	public void insertAnnuitySavingOption(AnnuitySavingOptionVO vo);
	public ArrayList<AnnuitySavingBaseVO> listAllAnnuitySaving(); //연금 조회
	public ArrayList<AnnuitySavingBaseVO> AnnuitySavingSearch(HashMap<String, String> map); //연금 검색
	public ArrayList<AnnuitySavingBaseVO> AnnuitySavingCompare(String annuitySavingID); //연금 비교 넣기
	public ArrayList<AnnuitySavingBaseVO> AnnuitySavingCompareModal(String annuitySavingID); //연금 비교 넣기
}
