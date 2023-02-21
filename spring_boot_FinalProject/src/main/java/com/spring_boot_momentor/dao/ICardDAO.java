package com.spring_boot_momentor.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_momentor.model.CardVO;


public interface ICardDAO {
	public void insertCard(CardVO vo);
	public void updateCardFee(CardVO vo);
	
	public ArrayList<CardVO> listAllCard(); //전체리스트
	public ArrayList<CardVO> CardAllSearch(String cardId); //검색
	public CardVO CardCompare(String cardId);//카드비교 넣기
	public void deleteCard(String carddNoms); // 비교 데이터 선택 삭제
	public ArrayList<CardVO> CardComparemodal(String cardId); // 카드비교 모달
	public ArrayList<CardVO> cardRandom(); // 메인 랭킹 부분 
	
	public ArrayList<CardVO> cardCategory(String comCtg); // 카드사
	public ArrayList<CardVO> cardCategory2(String cardDes); // 혜택
	//public ArrayList<CardVO> cardCategory3(int cardFee); // 연회비 
	public ArrayList<CardVO> cardCategory3(HashMap<String, Integer> map);
	
	public ArrayList<CardVO> cardCategory4(String cardDes, String comCtg);
	
	public ArrayList<CardVO> cardCategory5(HashMap<String, Object> map);

	
}
