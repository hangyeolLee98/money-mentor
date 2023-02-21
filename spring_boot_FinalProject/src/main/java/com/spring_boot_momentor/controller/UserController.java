package com.spring_boot_momentor.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_momentor.model.AssetVO;
import com.spring_boot_momentor.model.CardVO;
import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.UserVO;
import com.spring_boot_momentor.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService service;

	// 회원가입 폼 이동
	@RequestMapping("/user/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}

	// 회원가입
	@RequestMapping("/user/userJoin")
	public String userJoin(UserVO vo, @RequestParam("hp1") String userHp1, @RequestParam("hp2") String userHp2,
			@RequestParam("hp3") String userHp3, @RequestParam("email") String email,
			@RequestParam("emailAddress") String emailAddress, Model model) {
		vo.setUserPhone(userHp1 + "-" + userHp2 + "-" + userHp3);
		vo.setUserEmail(email + "@" + emailAddress);
		service.userJoin(vo);
		return "index";
	}

	// ID 중복확인
	@ResponseBody
	@RequestMapping("/user/idCheck")
	public String idCheck(@RequestParam("userId") String userId) {
		String answer = service.idCheck(userId);
		String result = "";
		if (answer == null) {
			result = "success";
		} else {
			result = "fail";
		}

		return result;
	}

	// 로그인 폼 이동
	@RequestMapping("/user/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	// 로그인
	@ResponseBody
	@RequestMapping("/user/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param, HttpSession session) {
		String result = service.loginCheck(param);

		if (result.equals("success")) {
			session.setAttribute("sid", param.get("id"));
			session.setAttribute("suserName", service.getUserName(param));
		}

		return result;
	}

	// 아이디 찾기 폼 이동
	@RequestMapping("/user/findIdForm")
	public String findIdForm() {
		return "user/findIdForm";
	}

	// 아이디 찾기
	@ResponseBody
	@RequestMapping("/user/findId")
	public String findId(UserVO vo, @RequestParam("hp1") String userHp1, @RequestParam("hp2") String userHp2,
			@RequestParam("hp3") String userHp3, Model model) {
		vo.setUserPhone(userHp1 + "-" + userHp2 + "-" + userHp3);
		String userId = service.findId(vo);
		String result = "";
		if (userId == null) {
			result = "fail";
		} else {
			result = "success";
		}
		model.addAttribute("userName", vo.getUserName());
		model.addAttribute("userId", userId);
		return result;
	}

	// 아이디 찾기 성공
	@RequestMapping("/user/findIdSuccess/{userName}/{userPhone}")
	public String idFineSuccess(@PathVariable String userName, @PathVariable String userPhone, Model model) {

		UserVO vo = new UserVO();
		vo.setUserName(userName);
		vo.setUserPhone(userPhone);
		String userId = service.findId(vo);

		model.addAttribute("userName", vo.getUserName());
		model.addAttribute("userId", userId);
		return "user/findIdSuccess";
	}

	// 비밀번호 찾기 폼 이동
	@RequestMapping("/user/findPasswordForm")
	public String findPasswordForm() {
		return "user/findPasswordForm";
	}

	// 비밀번호 찾기
	@ResponseBody
	@RequestMapping("/user/findPassword")
	public String findPassword(UserVO vo, @RequestParam("hp1") String userHp1, @RequestParam("hp2") String userHp2,
			@RequestParam("hp3") String userHp3, Model model) {
		vo.setUserPhone(userHp1 + "-" + userHp2 + "-" + userHp3);
		String userPassword = service.findPw(vo);
		String result = "";
		if (userPassword == null) {
			result = "fail";
		} else {
			model.addAttribute("userId", vo.getUserId());
			result = "success";
		}
		return result;
	}

	// 비밀번호 찾기 성공
	@RequestMapping("/user/findPwSuccess/{userId}")
	public String pwFineSuccess(@PathVariable String userId, Model model) {
		model.addAttribute("userId", userId);
		return "user/findPwSuccess";
	}

	// 비밀번호 변경
	@RequestMapping("/user/pwChange")
	public String pwChange(UserVO vo) {
		service.PwChange(vo);
		return "user/loginForm";
	}

	// 로그아웃
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 자산정보 입력 폼
	@RequestMapping("/user/assetInfoForm/{userId}")
	public String assetInfoForm(@PathVariable String userId) {
		if (service.findAssetInfo(userId) == null) {
			return "user/assetInfoForm";
		} else {
			return "redirect:/user/assetResultForm/" + userId;
		}
	}

	// 자산정보 db저장
	@ResponseBody
	@RequestMapping("/user/userAssetInsert")
	public String userAssetInsert(AssetVO vo) {
		service.userAssetInsert(vo);
		return "result";
	}

	// 자산 결과 출력페이지 이동
	@RequestMapping("/user/assetResultForm/{userId}")
	public String AssetResultForm(@PathVariable String userId, Model model) {

		// 총 가입자 수
		int totalUserCnt = service.getTotalUserCnt();
		model.addAttribute("totalUserCnt", totalUserCnt);
		// 해당 유저 나이
		String userAge = service.getUserAge(userId);
		model.addAttribute("userAge", userAge);
		// 해당 나이 유저 수
		int ageUserCnt = service.getAgeUserCnt(userAge);
		model.addAttribute("ageUserCnt", ageUserCnt);
		// 상위 몇퍼센트
		double propertyRank = service.getPropertyRank(userId);
		double percentage = (propertyRank / ageUserCnt) * 100;
		model.addAttribute("percentage", Math.round(percentage * 100) / 100.0);
		
		// 카드 데이터 랜덤
		ArrayList<CardVO> cardList = service.randCardList();
		model.addAttribute("cardList", cardList);
		
		// 적금 데이터 랜덤
		ArrayList<SavingBaseVO> savingList = service.randSavingList();
		model.addAttribute("savingList", savingList);

		return "user/assetResultForm";
	}
}
