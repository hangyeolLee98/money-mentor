package com.spring_boot_momentor.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_momentor.model.CalenderProductVO;
import com.spring_boot_momentor.model.CalenderVO;
import com.spring_boot_momentor.model.PlanVO;
import com.spring_boot_momentor.service.CalenderService;


@Controller
public class CalenderController {
	@Autowired
	private CalenderService service;
	
	@RequestMapping("/profile/calender")
	public String calender(Model model, HttpSession session) {
		String userID = (String)session.getAttribute("sid");
		model.addAttribute("userID", userID);
		return "detailProfile/calender/calenderMain";
	}
	
	@ResponseBody 
	@RequestMapping("/profile/calender/getSID")
	public String getSID(HttpSession session) {
		String userID = (String)session.getAttribute("sid");
		return userID;
	}
	
	@ResponseBody 
	@RequestMapping("/profile/calender/getPlanData")
	public ArrayList<PlanVO> getCalenderData(HttpSession session) {
		String userID = (String)session.getAttribute("sid");
		ArrayList<PlanVO> planList = service.calenderView(userID);
		return planList;
	}

	@RequestMapping("/profile/calender/changePrdName")
	public String changePrdName(HttpSession session,
												@RequestParam("prdName") String prdName,
												@RequestParam("dataID") int dataID) {
		
		String userID = (String)session.getAttribute("sid");
		
		service.changePrdName(prdName, userID, dataID);

		return "redirect:/profile/calender";
	}

	@ResponseBody 
	@RequestMapping("/profile/calender/getPrdData/{kind}/{kindDetail}/{order}")
	public ArrayList<CalenderProductVO> getPrdCardData(
													@PathVariable String kind,
													@PathVariable String kindDetail,
													@PathVariable String order) {
		
		ArrayList<CalenderProductVO> prd = service.calenderPrdList(kind, kindDetail, order);
				
		return prd;
		
	}

	@ResponseBody 
	@RequestMapping("/profile/calender/sendFormData/{prdType}/{prdID}")
	public String sendFormData(CalenderVO vo,
											@PathVariable String prdID,
											@PathVariable String prdType,
											@RequestParam("calSubDate") String calSubDate,
											@RequestParam("calTransfer") int calTransfer,
											@RequestParam("calMaturity") int calMaturity,
											@RequestParam("calPayment") int calPayment,
											@RequestParam("calDeposit") int calDeposit,
											@RequestParam("prdName") String prdName,
											HttpSession session) {
		
		String memId = (String)session.getAttribute("sid");
		String result = "";
		int planCount = 0;


		//vo에 올리기 전, 중복이 있는지 검사 / 사용자 지정 데이터는 중복 검사 X
		if(!prdID.equals("0")) {
			planCount = service.planDuplicateCheck(memId, prdID, prdType);
		}
		
		if(planCount == 0) {
			result = "ok";
			
			vo.setUserID(memId);
			vo.setCalMaturity(calMaturity);
			vo.setCalSubDate(calSubDate);
			vo.setCalTransfer(calTransfer);
			vo.setPrdID(prdID);
			vo.setPrdType(prdType);
			vo.setCalPayment(calPayment);
			vo.setPrdName(prdName);
			vo.setCalDeposit(calDeposit);
			service.insertPlan(vo);
		}
		else {
			result = "fail";
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/profile/calender/deletePlan")
	public  int deletePlan(@RequestParam("chbox[]") ArrayList<String> chkArr) {	

		int result = 0;
		
		if(chkArr != null) {
			for(String dataID : chkArr) {
				service.deletePlan(Integer.parseInt(dataID));
			}
		}
		
		result = 1;
				
		return result;
		
	}

	@RequestMapping("/profile/calender/addPlan")
	public String addPlan() {	
		return "detailProfile/calender/addPlanView";
	}

	@RequestMapping("/profile/calender/modifyPlanView/{dataID}")
	public String modifyPlanView(Model model, 
								HttpSession session,
								@PathVariable int dataID) {
		
		String userID = (String)session.getAttribute("sid");
		
		ArrayList<CalenderVO> cal = service.getPlanModify(userID, dataID);
		model.addAttribute("cal", cal);
		
		return "detailProfile/calender/modifyPlanView";
	}

	@ResponseBody
	@RequestMapping("/profile/calender/modifyPlan/{dataID}")
	public String modifyPlan(HttpSession session,
							CalenderVO vo,
							@PathVariable int dataID,
							@RequestParam("calSubDate") String calSubDate,
							@RequestParam("calTransfer") int calTransfer,
							@RequestParam("calMaturity") int calMaturity,
							@RequestParam("calPayment") int calPayment,
							@RequestParam("prdName") String prdName) {
		
		String userID = (String)session.getAttribute("sid");
		vo.setCalSubDate(calSubDate);
		vo.setCalTransfer(calTransfer);
		vo.setCalMaturity(calMaturity);
		vo.setCalPayment(calPayment);
		vo.setPrdName(prdName);
		vo.setDataID(dataID);
		vo.setUserID(userID);
		service.modifyPlan(vo);
		
		return "detailProfile/calender/modifyPlanView";
	}
	

	@ResponseBody
	@RequestMapping("/profile/calender/categoryChart")
	public List<Integer> categoryChart(HttpSession session) {
		
		String userID = (String)session.getAttribute("sid");
		
		List<Integer> categoryChart = new ArrayList<Integer>();
		String[] category = {"card", "insu", "deposit", "savings", "loan"};
		
		String strPrice = "";
		int price = 0;
		
		for(int i = 0; i < category.length; i++) {
			strPrice = service.prdTotalFee(userID, category[i]);
			if(strPrice == null) {
				strPrice = "0";
			}
			
			price = Integer.parseInt(strPrice);
			
			categoryChart.add(price);
		}
		
		return categoryChart;
	}
	
	@ResponseBody
	@RequestMapping("/profile/calender/totalAssetChart")
	public List<Integer> totalAssetChart(HttpSession session) {
		
		String userID = (String)session.getAttribute("sid");
		
		List<Integer> assetChart = new ArrayList<Integer>();
		String[] category = {"card", "insu", "deposit", "savings", "loan"};

		String strPrice = "";
		int price = 0;
		int savePrice = service.prdTotalDeposit(userID);
		int borrowPrice = 0;
		
		for(int i = 0; i < category.length; i++) {
			strPrice = service.prdTotalFee(userID, category[i]);
			if(strPrice == null) {
				strPrice = "0";
			}
			
			price = Integer.parseInt(strPrice);
			
				borrowPrice += price;
		}

		assetChart.add(savePrice);
		assetChart.add(borrowPrice);
		return assetChart;
	}

	@ResponseBody
	@RequestMapping("/profile/calender/insertPrdCategory")
	public ArrayList<String> insertPrdCategory(@RequestParam("kind") String kind) {
		ArrayList<String> category = service.insertPrdCategory(kind);
		return category;
	}
	

	@ResponseBody
	@RequestMapping("profile/calender/search")
	public ArrayList<CalenderProductVO> calenderSearch(@RequestParam("kind") String kind,
													   @RequestParam("text") String text) {

		ArrayList<CalenderProductVO> prd = service.calenderSearch(kind, text);
		
		return prd;
	}
	
}
