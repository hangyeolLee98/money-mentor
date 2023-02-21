package com.spring_boot_momentor.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_momentor.model.RentHouseLoanBaseVO;
import com.spring_boot_momentor.model.RentHouseLoanOptionVO;


public interface IRentHouseLoanDAO {
	public void insertRentHouseLoanBase(RentHouseLoanBaseVO vo);
	public void insertRentHouseLoanOption(RentHouseLoanOptionVO vo);
	public ArrayList<RentHouseLoanBaseVO> listAllRentHouseLoan(); //전세 자금 대출 조회
	public ArrayList<RentHouseLoanBaseVO> rentHouseLoanSearch(HashMap<String, Object> map); //전세 자금 대출 검색 처리
	public ArrayList<RentHouseLoanBaseVO> RentHouseLoanCompare(String rentHouseLoanID); //전세 대출 비교 넣기
	public ArrayList<RentHouseLoanBaseVO> RentHouseLoanCompareModal(String rentHouseLoanID); //전세 대출 비교 모달
}
