package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.IUserDAO;
import com.spring_boot_momentor.model.AssetVO;
import com.spring_boot_momentor.model.CardVO;
import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.UserVO;

@Service
public class UserService implements IUserService {
	@Autowired
	@Qualifier("IUserDAO")
	IUserDAO dao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void userJoin(UserVO vo) {
		String encodedPassword = passwordEncoder.encode(vo.getUserPassword());
		vo.setUserPassword(encodedPassword);
		dao.userJoin(vo);
	}

	@Override
	public void userUpdate() {

	}

	@Override
	public void userDelete() {

	}

	@Override
	public String idCheck(String userId) {
		return dao.idCheck(userId);
	}

	@Override
	public String loginCheck(HashMap<String, Object> map) {
		String encodedPw = dao.loginCheck((String) map.get("id"));

		String result = "fail";
		if (encodedPw != null && passwordEncoder.matches((String) map.get("pw"), encodedPw)) {
			result = "success";
		}

		return result;
	}

	@Override
	public String getUserName(HashMap<String, Object> map) {
		return dao.getUserName((String) map.get("id"));
	}

	@Override
	public void userAssetInsert(AssetVO vo) {
		dao.userAssetInsert(vo);
	}

	@Override
	public int getTotalUserCnt() {
		return dao.getTotalUserCnt();
	}

	@Override
	public String getUserAge(String userId) {
		return dao.getUserAge(userId);
	}

	@Override
	public int getAgeUserCnt(String userAge) {
		return dao.getAgeUserCnt(userAge);
	}

	@Override
	public int getPropertyRank(String userId) {
		return dao.getPropertyRank(userId);
	}

	@Override
	public String findId(UserVO vo) {
		return dao.findId(vo);
	}

	@Override
	public String findPw(UserVO vo) {
		return dao.findPw(vo);
	}

	@Override
	public void PwChange(UserVO vo) {
		String encodedPassword = passwordEncoder.encode(vo.getUserPassword());
		vo.setUserPassword(encodedPassword);
		dao.PwChange(vo);
	}

	@Override
	public String findAssetInfo(String userId) {
		return dao.findAssetInfo(userId);
	}

	@Override
	public ArrayList<CardVO> randCardList() {
		return dao.randCardList();
	}

	@Override
	public ArrayList<SavingBaseVO> randSavingList() {
		return dao.randSavingList();
	}
}
