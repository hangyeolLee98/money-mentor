package com.spring_boot_momentor.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_momentor.model.CardVO;
import com.spring_boot_momentor.model.InsuVO;
import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.ServiceCenterVO;
import com.spring_boot_momentor.service.CardService;
import com.spring_boot_momentor.service.SCService;


@Controller
public class HanController {
@Autowired
CardService service;
@Autowired
SCService scservice;
	@RequestMapping("/all/introduce")
	public String introduce() {
		return "/introduce/introduce";
	}
	@RequestMapping("/all/chatguide")
	public String chatGuide() {
		return "/chat/chatBotGuide";
	}
	
	/*서비스센터 start*/
	@RequestMapping("/all/serviceCenter") //고객센터 열기
	public String serviceCenter(Model model) {
		ArrayList<ServiceCenterVO> listAllSC = scservice.listAllSC();
		model.addAttribute("listAllSC", listAllSC);
		ArrayList<ServiceCenterVO> listAllSC2 = scservice.listAllSC2();
		model.addAttribute("listAllSC2", listAllSC2);
		return "serviceCenter/serviceCenter";
	}
	@RequestMapping("/question") // 질문 등록 폼 
	public String questionForm() {
		return "serviceCenter/questionForm";
	}
	@RequestMapping("/question/insertQ") //질문 등록 
	public String insertServiceCenter(ServiceCenterVO vo) {
		scservice.insertServiceCenter(vo);
		return "redirect:/all/serviceCenter";
	}
	@RequestMapping("/all/serviceCenter/detail/{qusNum}") // 질문 상세보기
	public String answerDetail(@PathVariable("qusNum") String qusNum, Model model) {
		
		model.addAttribute("qusNum",qusNum);
		ArrayList<ServiceCenterVO> getQNADetail = scservice.getQNADetail(qusNum);
		model.addAttribute("getQNADetail", getQNADetail);
		
		return "serviceCenter/questionDetail";
		
	}
	@RequestMapping("/deleteQuestion/{qusNum}") // 질문 지우기
	public String deleteQuestion(@PathVariable("qusNum") int qusNum ) {
			scservice.deleteQuestion(qusNum);
		return "redirect:/all/serviceCenter";
	}
	
	@RequestMapping("/questionUpload/{qusNum}") // 업뎃 질문 불러오기 
	public String questionUpload(@PathVariable("qusNum") String qusNum, Model model) {
		
		ArrayList<ServiceCenterVO> getQNADetail = scservice.getQNADetail(qusNum);
		model.addAttribute("getQNADetail", getQNADetail);
			
		return "serviceCenter/answerUpload";
	}
	
	@RequestMapping("/updateServiceCenter") // 답변
	public String updateServiceCenter(ServiceCenterVO vo) {
		
		scservice.updateServiceCenter(vo);
		
		return "redirect:/all/serviceCenter";
	}
	/*서비스센터 end*/

	@RequestMapping("/cardRandom")
	public String cardRandom(Model model) {
		ArrayList<CardVO> cardRandom = service.cardRandom();
		model.addAttribute("cardRandom", cardRandom);
		return "indexRanking/cardRanking";
	}
	@RequestMapping("/insuRandom")
	public String insuRandom(Model model) {
		ArrayList<InsuVO> insuRandom = scservice.insuRandom();
		model.addAttribute("insuRandom", insuRandom);
		return "indexRanking/insuRanking";
	}
	@RequestMapping("/savRandom")
	public String savRandom(Model model) {
		ArrayList<SavingBaseVO> savRandom = scservice.savRandom();
		model.addAttribute("savRandom", savRandom);
		return "indexRanking/savRanking";
	}
	
	
	
}
