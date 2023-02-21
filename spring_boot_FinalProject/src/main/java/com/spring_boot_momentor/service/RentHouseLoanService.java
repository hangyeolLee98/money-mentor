package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.IRentHouseLoanDAO;
import com.spring_boot_momentor.model.RentHouseLoanBaseVO;
import com.spring_boot_momentor.model.RentHouseLoanOptionVO;


@Service
public class RentHouseLoanService implements IRentHouseLoanService {
	@Autowired
	@Qualifier("IRentHouseLoanDAO")
	IRentHouseLoanDAO dao;
	
	@Override
	public void insertRentHouseLoanBase(RentHouseLoanBaseVO vo) {
		dao.insertRentHouseLoanBase(vo);

	}

	@Override
	public void insertRentHouseLoanOption(RentHouseLoanOptionVO vo) {
		dao.insertRentHouseLoanOption(vo);

	}
	@Override
	public ArrayList<RentHouseLoanBaseVO> listAllRentHouseLoan() {
		return dao.listAllRentHouseLoan();
	}
	
	@Override
	public ArrayList<RentHouseLoanBaseVO> rentHouseLoanSearch(HashMap<String, Object> map) {
		return dao.rentHouseLoanSearch(map);
	}
	
	//전세 대출 비교 넣기
	@Override
	public ArrayList<RentHouseLoanBaseVO> RentHouseLoanCompare(String rentHouseLoanID){
		return dao.RentHouseLoanCompare(rentHouseLoanID);
	}
	
	//전세 대출 비교 넣기
	@Override
	public ArrayList<RentHouseLoanBaseVO> RentHouseLoanCompareModal(String rentHouseLoanID){
		return dao.RentHouseLoanCompareModal(rentHouseLoanID);
	}

}
