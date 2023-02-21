package com.spring_boot_momentor.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_momentor.model.DepositBaseVO;
import com.spring_boot_momentor.model.DepositOptionVO;

public interface IDepositDAO {
	public void insertDepositBase(DepositBaseVO vo);
	public void insertDepositOption(DepositOptionVO vo);
	public ArrayList<DepositBaseVO> listAllDeposit(); //예금 조회
	public ArrayList<DepositBaseVO> depositSearch(HashMap<String, Object> map);  //연금 검색
	public ArrayList<DepositBaseVO> DepositCompare(String depositID); //예금 비교 넣기
	public ArrayList<DepositBaseVO> DepositCompareModal(String depositID); //예금 비교
}
