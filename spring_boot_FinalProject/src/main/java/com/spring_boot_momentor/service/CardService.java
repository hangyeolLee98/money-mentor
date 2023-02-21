package com.spring_boot_momentor.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_momentor.dao.ICardDAO;
import com.spring_boot_momentor.model.CardVO;

@Service
public class CardService implements ICardService{
	@Autowired
	@Qualifier("ICardDAO")
	ICardDAO dao;
	
	@Override
	public void insertCard(CardVO vo) {
		dao.insertCard(vo);	
	}

	@Override
	public void updateCardFee(CardVO vo) {
		dao.updateCardFee(vo);
		
	}
	
	@Override
	public ArrayList<CardVO> listAllCard() {

		return dao.listAllCard();
	}

	// 검색
	public ArrayList<CardVO> CardAllSearch(String cardId) {
		
		return dao.CardAllSearch(cardId);
		
	}

	// 카드비교 넣기
	public CardVO CardCompare(String cardId) {
		return dao.CardCompare(cardId);
	}

	public void deleteCard(String carddNoms) {
		dao.deleteCard(carddNoms);
		
	}
	// 카드비교 모달
	public ArrayList<CardVO> CardComparemodal(String cardId) {
		return dao.CardComparemodal(cardId);
	}

	// 메인 랭킹
	@Override
	public ArrayList<CardVO> cardRandom() {
		// TODO Auto-generated method stub
		return dao.cardRandom();
	}

	// 메인 랭킹 끝
	
	
	// 카드 선택
	public ArrayList<CardVO> cardCategory(String comCtg) {
		return dao.cardCategory(comCtg);
	}

	public ArrayList<CardVO> cardCategory2(String cardDes) {
		return dao.cardCategory2(cardDes);
	}

	public ArrayList<CardVO> cardCategory3(int cardFee) {
		int min = 0;
		int max = 99999999;
		HashMap<String, Integer> map = new HashMap<String, Integer>();  
		if (cardFee==1) {
			max = 10000;
		}else if(cardFee==2){
			min = 10000;
			max = 30000;
		}else if(cardFee==3){
			min = 30000;
			max = 100000;
		}else if(cardFee==4){
			min = 100000;
			max = 900000000;
		}	
		map.put("min", min);
		map.put("max", max);
		
		return dao.cardCategory3(map);
	}

	public ArrayList<CardVO> cardCategory4(String cardDes, String comCtg) {
		return dao.cardCategory4(cardDes,comCtg);
	}

	public ArrayList<CardVO> cardCategory5(String cardDes, String comCtg, int cardFee) {
		int min = 0;
		int max = 99999999;
		HashMap<String, Object> map = new HashMap<String, Object>();  
		if (cardFee==1) {
			max = 10000;
		}else if(cardFee==2){
			min = 10000;
			max = 30000;
		}else if(cardFee==3){
			min = 30000;
			max = 100000;
		}else if(cardFee==4){
			min = 100000;
			max = 900000000;
		}	
		
		map.put("min", min);
		map.put("max", max);
		map.put("comCtg", comCtg);
		map.put("cardDes", cardDes);
		
		return dao.cardCategory5(map);
	}

	


	
}
