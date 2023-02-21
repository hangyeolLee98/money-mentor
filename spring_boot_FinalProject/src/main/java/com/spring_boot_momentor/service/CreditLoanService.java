package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.ICreditLoanDAO;
import com.spring_boot_momentor.model.CreditLoanBaseVO;
import com.spring_boot_momentor.model.CreditLoanOptionVO;

@Service
public class CreditLoanService implements ICreditLoanService {
	@Autowired
	@Qualifier("ICreditLoanDAO")
	ICreditLoanDAO dao;
	
	@Override
	public void insertCreditLoanBase(CreditLoanBaseVO vo) {
		dao.insertCreditLoanBase(vo);

	}

	@Override
	public void insertCreditLoanOption(CreditLoanOptionVO vo) {
		dao.insertCreditLoanOption(vo);

	}
	
	@Override
	public ArrayList<CreditLoanBaseVO> listAllCreditLoan() {
		return dao.listAllCreditLoan();
	}
	
	@Override
	public ArrayList<CreditLoanBaseVO> creditLoanSearch(HashMap<String, Object> map) {
		return dao.creditLoanSearch(map);
	}

	//대출 비교 넣기
	@Override
	public ArrayList<CreditLoanBaseVO> CreditLoanCompare(String creditLoanID){
		return dao.CreditLoanCompare(creditLoanID);
	}
	
	//대출 비교 모달
	@Override
	public ArrayList<CreditLoanBaseVO> CreditLoanCompareModal(String creditLoanID){
		return dao.CreditLoanCompareModal(creditLoanID);
	}
}
