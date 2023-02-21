package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_momentor.model.AssetVO;
import com.spring_boot_momentor.model.CardVO;
import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.UserVO;

public interface IUserService {

	// 유저 회원가입
	public void userJoin(UserVO vo);
	
	// 아이디 중복체크
	public String idCheck(String userId);
	
	// 회원 수정
	public void userUpdate();
	
	// 회원 삭제
	public void userDelete();
	
	
	// 로그인
	public String loginCheck(HashMap<String, Object> map);
	
	// 로그인 된 유저이름 가져오기
	public String getUserName(HashMap<String, Object> map);
	
	// 자산 정보유무 확인
	public String findAssetInfo(String userId);
	
	// 자산 정보 입력
	public void userAssetInsert(AssetVO vo);
	
	// 자산 정보에 필요한 데이터 수집
	// 전체 가입자 수
	public int getTotalUserCnt();
	// 가입자 나이
	public String getUserAge(String userId);
	// 해당 나이 가입자 수
	public int getAgeUserCnt(String userAge);
	// 해당 나이 중 재산 순위
	public int getPropertyRank(String userId);
	
	// 아이디 찾기
	public String findId(UserVO vo);
	
	// 비밀번호 찾기
	public String findPw(UserVO vo);
	
	// 비밀번호 변경
	public void PwChange(UserVO vo);
	
	// 랜덤 카드 정보
	public ArrayList<CardVO> randCardList();
	
	// 랜덤 적금 정보
	public ArrayList<SavingBaseVO> randSavingList();
}
