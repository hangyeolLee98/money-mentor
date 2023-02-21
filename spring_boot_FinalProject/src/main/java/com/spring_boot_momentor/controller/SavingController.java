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

import com.spring_boot_momentor.model.SavingBaseVO;
import com.spring_boot_momentor.model.SavingOptionVO;
import com.spring_boot_momentor.service.SavingService;


@Controller
public class SavingController {
	@Autowired
	SavingService service;

	SavingBaseVO vo = new SavingBaseVO();
	SavingOptionVO vo2 = new SavingOptionVO();

	private static final int FIRST_PAGE_INDEX = 1;
	private static final int LAST_PAGE_INDEX = 3;
	private static String finnum = "";

	@RequestMapping("/Saving")
	public String insertSaving() {

		try {
			for (int k = 0; k < 2; k++) {
				if (k == 0) {
					finnum = "030300";
				}
				if (k == 1) {
					finnum = "020000";
				}
				for (int j = FIRST_PAGE_INDEX; j <= LAST_PAGE_INDEX; j++) {
					String apiURL = "http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo="+finnum+"&pageNo="+j;

//			String apiURL = "http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo=030300&pageNo=1";
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
			JSONObject result = (JSONObject) obj.get("result"); 
			JSONArray dataList = (JSONArray) result.get("baseList"); 

			for (int i = 0; i < dataList.size(); i++) {
				JSONObject jsonObj = (JSONObject) dataList.get(i);
				System.out.println(i);
				//공시 제출월
				String dclsMonth = (String) jsonObj.get("dcls_month");
				// 회사명번호, 상품번호
				String comNum = (String) jsonObj.get("fin_co_no");
				String prdNum = (String) jsonObj.get("fin_prdt_cd");
				
				String savingID = comNum + prdNum;
				// 회사명, 상품명
				String comName = (String) jsonObj.get("kor_co_nm");
				String prdName = (String) jsonObj.get("fin_prdt_nm");
				// 가입방법
				String joinWay = "";
				if (String.valueOf(jsonObj.get("join_way")).equals("null")) {
					joinWay = "-";
				} else {
					joinWay = (String) jsonObj.get("join_way");
				}
				// 만기후 이자율
				String interest = (String) jsonObj.get("mtrt_int");
				// 우대조건
				String spclCnd = (String) jsonObj.get("spcl_cnd");
				// 한도
				Integer maxLimit = 0;
				if (String.valueOf(jsonObj.get("max_limit")).equals("null")) {
					maxLimit = 0;
				} else {
					maxLimit = Integer.parseInt(String.valueOf(jsonObj.get("max_limit")));
				}
				// 가입대상
				String joinMember = (String) jsonObj.get("join_member");
				// 유의사항
				String etcNote = (String) jsonObj.get("etc_note");
				// 공시시작일
				String dclsStart = (String) jsonObj.get("dcls_strt_day");
				
			
				vo.setSavingID(savingID);
				vo.setDclsMonth(dclsMonth);
				vo.setComNum(comNum);
				vo.setPrdNum(prdNum);
				vo.setComName(comName);
				vo.setPrdName(prdName);
				vo.setJoinWay(joinWay);
				vo.setInterest(interest);
				vo.setSpclCnd(spclCnd);
				vo.setMaxLimit(maxLimit);
				vo.setJoinMember(joinMember);
				vo.setEtcNote(etcNote);
				vo.setDclsStart(dclsStart);
				service.insertSavingBase(vo);
			}
				}
			}
			System.out.println("Base성공");
			

			for (int k = 0; k < 2; k++) {
				if (k == 0) {
					finnum = "020000";
				}
				if (k == 1) {
					finnum = "030300";
				}

				for (int j = FIRST_PAGE_INDEX; j <= LAST_PAGE_INDEX; j++) {
					String apiURL2 = "http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo="
							+ finnum + "&pageNo=" + j;
//					String apiURL2 = "http://finlife.fss.or.kr/finlifeapi/savingProductsSearch.json?auth=9092fe04a7c3c5365acc18c7a390dd26&topFinGrpNo=030300&pageNo=1";

					URL url2 = new URL(apiURL2);
					HttpURLConnection con2 = (HttpURLConnection) url2.openConnection();
					con2.setRequestMethod("GET");
					con2.setRequestProperty("Content-Type", "application/json;UTF-8");
					int responseCode2 = con2.getResponseCode();
					BufferedReader br2;
					if (responseCode2 == 200) { // 정상 호출
						br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
					} else { // 에러 발생
						br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));
					}
					String inputLine2;
					StringBuffer response2 = new StringBuffer();
					while ((inputLine2 = br2.readLine()) != null) {
						response2.append(inputLine2);
					}
					br2.close();
					System.out.println(response2.toString());
					JSONParser parser2 = new JSONParser();
					JSONObject obj2 = (JSONObject) parser2.parse(response2.toString());
					JSONObject dataObj2 = (JSONObject) obj2.get("result");
					JSONArray optionList2 = (JSONArray) dataObj2.get("optionList");

						for (int i = 0; i < optionList2.size(); i++) {
						JSONObject jsonOption = (JSONObject) optionList2.get(i);
						//공시 제출월
						String dclsMonth = (String) jsonOption.get("dcls_month");

						String comNum = (String) jsonOption.get("fin_co_no");
						String prdNum = (String) jsonOption.get("fin_prdt_cd");
						
						String savingID = comNum + prdNum;
						
						
						
						Double intrRate = 0.0;
						if (String.valueOf(jsonOption.get("intr_rate")).equals("null")) {
							intrRate = 0.0;
						} else {
							intrRate = Double.parseDouble(String.valueOf(jsonOption.get("intr_rate")));
						}
						Double intrRate2 = 0.0;
						if (String.valueOf(jsonOption.get("intr_rate2")).equals("null")) {
							intrRate2 = 0.0;
						} else {
							intrRate2 = Double.parseDouble(String.valueOf(jsonOption.get("intr_rate2")));
						}
						Integer saveTrm = 0;
						if (String.valueOf(jsonOption.get("save_trm")).equals("null")) {
							saveTrm = 0;
						} else {
							saveTrm = Integer.parseInt(String.valueOf(jsonOption.get("save_trm")));
						}
						String rsrvTypeName = (String) jsonOption.get("rsrv_type_nm");
						String intrRateTypeName = (String) jsonOption.get("intr_rate_type_nm");
						
						vo2.setSavingID(savingID);
						vo2.setDclsMonth(dclsMonth);
						vo2.setComNum(comNum);
						vo2.setPrdNum(prdNum);
						vo2.setIntrRate(intrRate);
						vo2.setIntrRate2(intrRate2);
						vo2.setSaveTrm(saveTrm);
						vo2.setRsrvTypeName(rsrvTypeName);
						vo2.setIntrRateTypeName(intrRateTypeName);
						service.insertSavingOption(vo2);
						
						

					}
				}
			}
			System.out.println("Option성공");
		} catch (Exception e) {
			System.out.println(e);
		}
		return "saving/savingForm";
	}
	
	@RequestMapping("/savingForm")
	public String viewSavingListAll() {
		return "saving/savingForm";
	}
	
	//전체 적금 조회
	@RequestMapping("/savingListAll")
	public String viewSavingListAll(Model model) {
		ArrayList<SavingBaseVO> savingList = service.listAllSaving();
		model.addAttribute("savingList", savingList);
		return "saving/savingResultForm";
	}
	
	
	//적금 검색 처리
	@RequestMapping("/savingSearch")
	public String savingSearch(@RequestParam String prdName,
			  				   @RequestParam String joinWay,
			  				   @RequestParam String saveTrm, Model model){
		HashMap<String ,Object> map = new HashMap<String, Object>();
		map.put("prdName", prdName);
		map.put("joinWay", joinWay);
		map.put("saveTrm", saveTrm);
		
		// 서비스로 전송해서 DB 검색 결과 받아옴
		ArrayList<SavingBaseVO> savingList = service.savingSearch(map);	
		model.addAttribute("savingList", savingList);
		System.out.println(savingList);
		return "saving/savingResultForm";
	}
	
	//적금 비교 추가
	@ResponseBody
	@RequestMapping("/SavingCompare")
	public SavingBaseVO SavingCompare(@RequestParam String savingID, Model model) {
		ArrayList<SavingBaseVO> savingList= service.SavingCompare(savingID);
//		System.out.println("savingList >>>" + savingList.get(0).getIntrRate());
		model.addAttribute("savingList", savingList.get(0));
		return savingList.get(0);
	}
	
	@RequestMapping("/savingPopup")
	public String savingPopup() {
		return "saving/savingForm";
	}
	
	@ResponseBody
	@RequestMapping("/SavingCompareModal")
	public String SavingCompareModal(@RequestParam String savingID, Model model) {
		ArrayList<SavingBaseVO> savingList = service.SavingCompareModal(savingID);
		model.addAttribute("savingList", savingList);
		return "saving/savingForm";
	}
}
