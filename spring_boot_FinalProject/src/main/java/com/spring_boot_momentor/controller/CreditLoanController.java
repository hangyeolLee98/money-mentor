package com.spring_boot_momentor.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_momentor.model.CreditLoanBaseVO;
import com.spring_boot_momentor.model.CreditLoanOptionVO;
import com.spring_boot_momentor.service.CreditLoanService;





@Controller
public class CreditLoanController {
	@Autowired
	CreditLoanService service;
	
	CreditLoanBaseVO vo = new CreditLoanBaseVO();
	CreditLoanOptionVO vo2 = new CreditLoanOptionVO();
	
	private static final int FIRST_PAGE_INDEX = 1;
	private static final int LAST_PAGE_INDEX = 4;
	private static String finnum = "";

	@RequestMapping("/CreditLoan")
	public String insertCreditLoan() {

		try {
			for (int k = 0; k < 3; k++) {
				if (k == 0) {
					finnum = "020000";
				} else if (k == 1) {
					finnum = "030300";
				} else {
					finnum = "050000";
				}
				
				for (int j = FIRST_PAGE_INDEX; j <= LAST_PAGE_INDEX; j++) {
				String apiURL = "http://finlife.fss.or.kr/finlifeapi/creditLoanProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo="
						+ finnum + "&pageNo=" + j;
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Content-Type", "application/json;UTF-8");
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println(response.toString());
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(response.toString());
				JSONObject dataObj = (JSONObject) obj.get("result");
				JSONArray dataList = (JSONArray) dataObj.get("baseList");

				for (int i = 0; i < dataList.size(); i++) {
					JSONObject jsonObj = (JSONObject) dataList.get(i);
					
					//공시 제출월
					String dclsMonth = (String) jsonObj.get("dcls_month");
					// 회사명번호, 상품번호
					String comNum = (String) jsonObj.get("fin_co_no");
					String prdNum = (String) jsonObj.get("fin_prdt_cd");
					
					String creditLoanID = comNum + prdNum;
					
					// 회사명, 상품명
					String comName = (String) jsonObj.get("kor_co_nm");
					String prdName = (String) jsonObj.get("fin_prdt_nm");
					// 가입방법
					String joinWay = (String) jsonObj.get("join_way");
					String crdtTypeName = (String) jsonObj.get("crdt_prdt_type_nm");
					String cbName = (String) jsonObj.get("cb_name");
					String dclsStart = (String) jsonObj.get("dcls_strt_day");

					vo.setCreditLoanID(creditLoanID);
					vo.setDclsMonth(dclsMonth);
					vo.setComNum(comNum);
					vo.setPrdNum(prdNum);
					vo.setComName(comName);
					vo.setPrdName(prdName);
					vo.setJoinWay(joinWay);
					vo.setCrdtTypeName(crdtTypeName);
					vo.setCbName(cbName);
					vo.setDclsStart(dclsStart);
					service.insertCreditLoanBase(vo);

					}
				}
			}
			System.out.println("Base성공");
			
			for (int k = 0; k < 3; k++) {
				if (k == 0) {
					finnum = "020000";
				} else if (k == 1) {
					finnum = "030300";
				} else {
					finnum = "050000";
				}
				
				for (int j = FIRST_PAGE_INDEX; j <= LAST_PAGE_INDEX; j++) {
				String apiURL = "http://finlife.fss.or.kr/finlifeapi/creditLoanProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo="
						+ finnum + "&pageNo=" + j;
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Content-Type", "application/json;UTF-8");
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				System.out.println(response.toString());
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(response.toString());
				JSONObject dataObj = (JSONObject) obj.get("result");
				JSONArray optionList = (JSONArray) dataObj.get("optionList");

				for (int i = 0; i < optionList.size(); i++) {
					JSONObject jsonOption = (JSONObject) optionList.get(i);
					
					//공시 제출월
					String dclsMonth = (String) jsonOption.get("dcls_month");
					
					// 회사명번호, 상품번호
					String comNum = (String) jsonOption.get("fin_co_no");
					String prdNum = (String) jsonOption.get("fin_prdt_cd");
					
					String creditLoanID = comNum + prdNum;
					
					// 금리구분
					String crdtLendRateTypeName = (String) jsonOption.get("crdt_lend_rate_type_nm");

					Double crdtGrade9Up = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_1")).equals("null")) {
						crdtGrade9Up = 0.0;
					} else {
						crdtGrade9Up = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_1")));
					}
					Double crdtGrade8Up = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_4")).equals("null")) {
						crdtGrade8Up = 0.0;
					} else {
						crdtGrade8Up = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_4")));
					}
					Double crdtGrade7Up = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_5")).equals("null")) {
						crdtGrade7Up = 0.0;
					} else {
						crdtGrade7Up = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_5")));
					}
					Double crdtGrade6Up = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_6")).equals("null")) {
						crdtGrade6Up = 0.0;
					} else {
						crdtGrade6Up = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_6")));
					}
					Double crdtGrade5Up = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_10")).equals("null")) {
						crdtGrade5Up = 0.0;
					} else {
						crdtGrade5Up = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_10")));
					}
					Double crdtGrade4Up = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_11")).equals("null")) {
						crdtGrade4Up = 0.0;
					} else {
						crdtGrade4Up = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_11")));
					}
					Double crdtGrade3Up = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_12")).equals("null")) {
						crdtGrade3Up = 0.0;
					} else {
						crdtGrade3Up = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_12")));
					}
					Double crdtGrade3Down = 0.0;
					if (String.valueOf(jsonOption.get("crdt_grad_13")).equals("null")) {
						crdtGrade3Down = 0.0;
					} else {
						crdtGrade3Down = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_13")));
					}
					Double crdtGradeAvg = Double.parseDouble(String.valueOf(jsonOption.get("crdt_grad_avg")));

					vo2.setCreditLoanID(creditLoanID);
					vo2.setDclsMonth(dclsMonth);
					vo2.setComNum(comNum);
					vo2.setPrdNum(prdNum);
					vo2.setCrdtLendRateTypeName(crdtLendRateTypeName);
					vo2.setCrdtGrade9Up(crdtGrade9Up);
					vo2.setCrdtGrade8Up(crdtGrade8Up);
					vo2.setCrdtGrade7Up(crdtGrade7Up);
					vo2.setCrdtGrade6Up(crdtGrade6Up);
					vo2.setCrdtGrade5Up(crdtGrade5Up);
					vo2.setCrdtGrade4Up(crdtGrade4Up);
					vo2.setCrdtGrade3Up(crdtGrade3Up);
					vo2.setCrdtGrade3Down(crdtGrade3Down);
					vo2.setCrdtGradeAvg(crdtGradeAvg);
					service.insertCreditLoanOption(vo2);

				
					}
				}
			}
			System.out.println("Option성공");
		} catch (Exception e) {
			System.out.println(e);
		}
		return "loan/creditLoanForm";
	}
	@RequestMapping("/creditLoanForm")
	public String viewCreditLoanListAll() {
		return "loan/creditLoanForm";
	}
	
	//전체 대출 조회
	@RequestMapping("/creditLoanListAll")
	public String viewCreditLoanListAll(Model model) {
		ArrayList<CreditLoanBaseVO> creditLoanList = service.listAllCreditLoan();
		model.addAttribute("creditLoanList", creditLoanList);
		return "loan/creditLoanResultForm";
	}
	
	//대출 검색 처리
	@RequestMapping("/creditLoanSearch")
	public String CreditLoanSearch(@RequestParam String prdName,
								   @RequestParam String joinWay,
								   @RequestParam String crdtTypeName,
								   Model model) {
		
		HashMap<String ,Object> map = new HashMap<String, Object>();
		map.put("prdName", prdName);
		map.put("joinWay", joinWay);
		map.put("crdtTypeName", crdtTypeName);
		
		// 서비스로 전송해서 DB 검색 결과 받아옴
		ArrayList<CreditLoanBaseVO> creditLoanList = service.creditLoanSearch(map);	
		model.addAttribute("creditLoanList", creditLoanList);
		return "loan/creditLoanResultForm";	
	}
	
	//신용 대출 비교 추가
	@ResponseBody
	@RequestMapping("/CreditLoanCompare")
	public CreditLoanBaseVO CreditLoanCompare(@RequestParam String creditLoanID, Model model) {
		ArrayList<CreditLoanBaseVO> creditLoanList = service.CreditLoanCompare(creditLoanID);
		model.addAttribute("creditLoanList", creditLoanList.get(0));
		return creditLoanList.get(0);
	}
	
	@RequestMapping("/creditLoanPopup")
	public String creditLoanPopup() {
		return "loan/crditLoanForm";
	}
	
	//신용 대출 비교 모달
	@ResponseBody
	@RequestMapping("/CreditLoanCompareModal")
	public String CreditLoanCompareModal(@RequestParam String creditLoanID, Model model) {
		ArrayList<CreditLoanBaseVO> creditLoanList = service.CreditLoanCompareModal(creditLoanID);
		model.addAttribute("creditLoanList", creditLoanList);
		return "loan/crditLoanForm";
	}
	
}



