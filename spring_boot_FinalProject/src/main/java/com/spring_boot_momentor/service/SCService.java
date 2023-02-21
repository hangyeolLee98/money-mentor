package com.spring_boot_momentor.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.IAnnuitySavingDAO;
import com.spring_boot_momentor.dao.ICardDAO;
import com.spring_boot_momentor.dao.IInsuDAO;
import com.spring_boot_momentor.dao.ISCDAO;
import com.spring_boot_momentor.dao.ISavingDAO;
import com.spring_boot_momentor.model.AnnuitySavingBaseVO;
import com.spring_boot_momentor.model.InsuVO;
import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.ServiceCenterVO;

@Service
public class SCService implements ISCService {
	
	@Autowired
	@Qualifier("ISCDAO")
	ISCDAO dao;
	
	@Override
	public void insertServiceCenter(ServiceCenterVO vo) {
		dao.insertServiceCenter(vo);
	}
	
	@Override
	public void updateServiceCenter(ServiceCenterVO vo) {
		dao.updateServiceCenter(vo);
	}

	@Override
	public ArrayList<ServiceCenterVO> listAllSC() {
		return dao.listAllSC();
	}

	@Override
	public ArrayList<ServiceCenterVO> listAllSC2() {
		return dao.listAllSC2();
	}

	@Override
	public ArrayList<ServiceCenterVO> getQNADetail(String qusNum) {
		// TODO Auto-generated method stub
		return dao.getQNADetail(qusNum);
	}

	@Override
	public void deleteQuestion(int qusNum) {
		// TODO Auto-generated method stub
		dao.deleteQuestion(qusNum);
	}

	@Override
	public ArrayList<InsuVO> insuRandom() {
		// TODO Auto-generated method stub
		return dao.insuRandom();
	}

	@Override
	public ArrayList<SavingBaseVO> savRandom() {
		// TODO Auto-generated method stub
		return dao.savRandom();
	}

	@Override
	public ArrayList<AnnuitySavingBaseVO> annRandom() {
		// TODO Auto-generated method stub
		return dao.annRandom();
	}

	

	

}
