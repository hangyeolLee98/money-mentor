package com.spring_boot_momentor.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.ICalenderDAO;
import com.spring_boot_momentor.model.CalenderProductVO;
import com.spring_boot_momentor.model.CalenderVO;
import com.spring_boot_momentor.model.PlanVO;

@Service
public class CalenderService implements ICalenderService{
	@Autowired
	@Qualifier("ICalenderDAO")
	ICalenderDAO dao;

	@Override
	public ArrayList<PlanVO> calenderView(String userID) {
		// TODO Auto-generated method stub
		return dao.calenderView(userID);
	}

	@Override
	public void insertPlan(CalenderVO vo) {
		// TODO Auto-generated method stub
		dao.insertPlan(vo);
	}

	@Override
	public int planDuplicateCheck(String userID, String prdID, String prdType) {
		// TODO Auto-generated method stub
		return dao.planDuplicateCheck(userID, prdID, prdType);
		
	}

	@Override
	public void changePrdName(String prdName, String userID, int dataID) {
		// TODO Auto-generated method stub
		dao.changePrdName(prdName, userID, dataID);
	}

	@Override
	public ArrayList<CalenderProductVO> calenderPrdList(String kind, String kindDetail, String order) {
		// TODO Auto-generated method stub
		return dao.calenderPrdList(kind, kindDetail, order);
	}

	@Override
	public void deletePlan(int dataID) {
		// TODO Auto-generated method stub
		dao.deletePlan(dataID);
	}

	@Override
	public ArrayList<CalenderVO> getPlanModify(String userID, int dataID) {
		// TODO Auto-generated method stub
		return dao.getPlanModify(userID, dataID);
	}

	@Override
	public void modifyPlan(CalenderVO vo) {
		// TODO Auto-generated method stub
		dao.modifyPlan(vo);
	}

	@Override
	public String prdTotalFee(String userID, String prdType) {
		// TODO Auto-generated method stub
		return dao.prdTotalFee(userID, prdType);
	}

	@Override
	public ArrayList<String> insertPrdCategory(String kind) {
		// TODO Auto-generated method stub
		return dao.insertPrdCategory(kind);
	}

	@Override
	public ArrayList<CalenderProductVO> calenderSearch(String kind, String text) {
		// TODO Auto-generated method stub
		return dao.calenderSearch(kind, text);
	}

	@Override
	public int prdTotalDeposit(String userID) {
		// TODO Auto-generated method stub
		return dao.prdTotalDeposit(userID);
	}


}
