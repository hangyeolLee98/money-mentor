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

import com.spring_boot_momentor.model.RentHouseLoanBaseVO;
import com.spring_boot_momentor.model.RentHouseLoanOptionVO;
import com.spring_boot_momentor.service.RentHouseLoanService;

@Controller
public class RentHouseLoanController {
	@Autowired
	RentHouseLoanService service;
	
	RentHouseLoanBaseVO vo = new RentHouseLoanBaseVO();
	RentHouseLoanOptionVO vo2 = new RentHouseLoanOptionVO();
	
	private static final int FIRST_PAGE_INDEX = 1;
	private static final int LAST_PAGE_INDEX = 4;
	private static String finnum = "";
	
	@RequestMapping("/RentHouseLoan")
	public String insertRentHouseLoan() {

		try {
			for (int k = 0; k < 3; k++) {
				if (k == 0) {
					finnum = "020000";
				} else if (k == 1) {
					finnum = "030300";
				} else {
					finnum = "050000";
				}

				String apiURL = "http://finlife.fss.or.kr/finlifeapi/rentHouseLoanProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo="
						+ finnum + "&pageNo=1";
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
					
					String rentHouseLoanID = comNum + prdNum; 
					
					// 회사명, 상품명
					String comName = (String) jsonObj.get("kor_co_nm");
					String prdName = (String) jsonObj.get("fin_prdt_nm");
					// 가입방법
					String joinWay = (String) jsonObj.get("join_way"); 
					
					String loanInciExpn = (String) jsonObj.get("loan_inci_expn");
					
					String erlyRpayFee = (String) jsonObj.get("erly_rpay_fee");
					String dlyRate = (String) jsonObj.get("dly_rate");
					String loanLimit = (String) jsonObj.get("loan_lmt");
					
					String dclsStart = (String) jsonObj.get("dcls_strt_day");

					vo.setRentHouseLoanID(rentHouseLoanID);
					vo.setDclsMonth(dclsMonth);
					vo.setComNum(comNum);
					vo.setPrdNum(prdNum);
					vo.setComName(comName);
					vo.setPrdName(prdName);
					vo.setJoinWay(joinWay);
					/* System.out.println(i + "_ 가입방법: " + join_way); */
					vo.setLoanInciExpn(loanInciExpn);
					vo.setErlyRpayFee(erlyRpayFee);
					vo.setDlyRate(dlyRate);
					vo.setLoanLimit(loanLimit);
					vo.setDclsStart(dclsStart);
					service.insertRentHouseLoanBase(vo);

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
				String apiURL = "http://finlife.fss.or.kr/finlifeapi/rentHouseLoanProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo="
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
					
					String rentHouseLoanID = comNum + prdNum; 
					
					// 대출 상환 유형, 대출금리유형
					String rpayTypeName = (String) jsonOption.get("rpay_type_nm");
					String lendRateTypeName = (String) jsonOption.get("lend_rate_type_nm");

					Double lendRateMin = 0.0;
					if (String.valueOf(jsonOption.get("lend_rate_min")).equals("null")) {
						lendRateMin = 0.0;
					} else {
						lendRateMin = Double.parseDouble(String.valueOf(jsonOption.get("lend_rate_min")));
					}
					Double lendRateMax = 0.0;
					if (String.valueOf(jsonOption.get("lend_rate_max")).equals("null")) {
						lendRateMax = 0.0;
					} else {
						lendRateMax = Double.parseDouble(String.valueOf(jsonOption.get("lend_rate_max")));
					}
					Double lendRateAvg = 0.0;
					if (String.valueOf(jsonOption.get("lend_rate_avg")).equals("null")) {
						lendRateAvg = 0.0;
					} else {
						lendRateAvg = Double.parseDouble(String.valueOf(jsonOption.get("lend_rate_avg")));
					}

					vo2.setRentHouseLoanID(rentHouseLoanID);
					vo2.setDclsMonth(dclsMonth);
					vo2.setComNum(comNum);
					vo2.setPrdNum(prdNum);
					vo2.setRpayTypeName(rpayTypeName);
					vo2.setLendRateTypeName(lendRateTypeName);
					vo2.setLendRateMin(lendRateMin);
					vo2.setLendRateMax(lendRateMax);
					vo2.setLendRateAvg(lendRateAvg);
					service.insertRentHouseLoanOption(vo2);
				}

					}
				}
			
			System.out.println("Option성공");
		} catch (Exception e) {
		System.out.println(e);
		}
		return "loan/rentHouseLoanForm";
	}


	@RequestMapping("/rentHouseLoanForm")
	public String viewRentHouseLoanListAll() {
		return "loan/rentHouseLoanForm";
	}
	
	//전체 전세 자금 대출 조회
	@RequestMapping("/rentHouseLoanListAll")
	public String viewRentHouseLoanListAll(Model model) {
		ArrayList<RentHouseLoanBaseVO> rentHouseLoanList = service.listAllRentHouseLoan();
		model.addAttribute("rentHouseLoanList", rentHouseLoanList);
		return "loan/rentHouseLoanResultForm";
		
	}
	
	//전세 자금 대출 검색 처리
	@RequestMapping("/rentHouseLoanSearch")
	public String RentHouseLoanSearch(@RequestParam String prdName,
									  @RequestParam String joinWay,
									  @RequestParam String rpayTypeName,
									  Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("prdName", prdName);
		map.put("joinWay", joinWay);
		map.put("rpayTypeName", rpayTypeName);
		
		//서비스로 전송해서 DB 검색 결과 받아옴 
		ArrayList<RentHouseLoanBaseVO> rentHouseLoanList = service.rentHouseLoanSearch(map);
		model.addAttribute("rentHouseLoanList", rentHouseLoanList);
		return "loan/rentHouseLoanResultForm";
	}
	
	//전세 자금 대출 비교 추가
	@ResponseBody
	@RequestMapping("/RentHouseLoanCompare")
	public RentHouseLoanBaseVO RentHouseLoanCompare(@RequestParam String rentHouseLoanID, Model model) {
		ArrayList<RentHouseLoanBaseVO> rentHouseLoanList = service.RentHouseLoanCompare(rentHouseLoanID);
		model.addAttribute("rentHouseLoanList", rentHouseLoanList.get(0));
		return rentHouseLoanList.get(0);
	}
	
	@RequestMapping("/rentHousePopup")
	public String rentHouseLoanPopup() {
		return "loan/rentHouseLoanForm";
	}
	
	//전세 자금 대출 비교 모달
	@ResponseBody
	@RequestMapping("/RentHouseLoanCompareModal")
	public String RentHouseLoanCompareModal(@RequestParam String rentHouseLoanID, Model model) {
		ArrayList<RentHouseLoanBaseVO> rentHouseLoanList = service.RentHouseLoanCompareModal(rentHouseLoanID);
		model.addAttribute("rentHouseLoanList", rentHouseLoanList);
		return "loan/rentHouseLoanForm";
	}	
}