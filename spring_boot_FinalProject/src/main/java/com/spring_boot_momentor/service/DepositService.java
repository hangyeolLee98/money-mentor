package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.IDepositDAO;
import com.spring_boot_momentor.model.DepositBaseVO;
import com.spring_boot_momentor.model.DepositOptionVO;


@Service
public class DepositService implements IDepositService {
	@Autowired
	@Qualifier("IDepositDAO")
	IDepositDAO dao;
	
	@Override
	public void insertDepositBase(DepositBaseVO vo) {
		dao.insertDepositBase(vo);
		
	}

	@Override
	public void insertDepositOption(DepositOptionVO vo) {
		dao.insertDepositOption(vo);
		
	}
	
	@Override
	public ArrayList<DepositBaseVO> listAllDeposit() {
		return dao.listAllDeposit();
	}
	
	@Override
	public ArrayList<DepositBaseVO> depositSearch(HashMap<String, Object> map) {
		return dao.depositSearch(map);
	}
	
	//예금 비교 넣기
	public ArrayList<DepositBaseVO> DepositCompare(String depositID){
		return dao.DepositCompare(depositID);
	}
	
	//예금 비교 모달
	public ArrayList<DepositBaseVO> DepositCompareModal(String depositID){
		return dao.DepositCompareModal(depositID);
	}
}
