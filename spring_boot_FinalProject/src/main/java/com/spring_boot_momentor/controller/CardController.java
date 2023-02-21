package  com.spring_boot_momentor.controller;

import java.io.IOException;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.spring_boot_momentor.model.CardVO;
import com.spring_boot_momentor.service.CardService;

@Controller
@Component
public class CardController {
	@Autowired
	CardService service;

	@RequestMapping("/card")
	public String insertCard() {
		// 원하는곳 URL 입력
		String hyundaiURL = "https://www.hyundaicard.com/cpc/ma/CPCMA0101_01.hc";
		Connection conn = Jsoup.connect(hyundaiURL);
		try {
			Document doc = conn.get();

			Elements hyundaiCardList = doc.getElementsByClass("list05");

			for (int idx = 0; idx < hyundaiCardList.size(); idx++) {
				CardVO vo = new CardVO();

				Elements cardInfos = hyundaiCardList.get(idx).getElementsByClass("info2");

				for (int cnt = 0; cnt < cardInfos.size(); cnt++) {
					Elements cardInfo = cardInfos.get(cnt).select("li");

					Element cardLists = hyundaiCardList.get(idx).getElementsByClass("card_plt").get(cnt);

					// h4_b_lt 카드 이름
					Elements hyundaiCardName = cardLists.getElementsByClass("h4_b_lt");
					// p2_m_2ln mt12 설명
					Elements hyundaiCardDescribed = cardLists.getElementsByClass("p2_m_2ln mt12");
					// img url 이미지 url
					Element hyundaiCardImgUrl = cardLists.getElementsByClass("img").get(0);

					final String name = hyundaiCardName.text();
					final String des = hyundaiCardDescribed.text();
					String img = hyundaiCardImgUrl.select("img").attr("src");

					// 카드 URL뽑기
					String imgUrl = img.substring(46, img.length());
					imgUrl = imgUrl.substring(0, imgUrl.length() - 6);
					// https://www.hyundaicard.com/cpc/cr/CPCCR0201_01.hc?cardWcd=imgUrl

					String fee = "";
					int intFee = 0;
					for (int list = 0; list < cardInfo.size(); list++) {
						if (cardInfo.get(list).text().indexOf("국내전용") != -1) {
							fee = cardInfo.get(list).text();
							fee = fee.substring(5);
							fee = fee.replace(",", "");
							;
							fee = fee.replace("원", "");

							if (fee.equals("연회비 없음")) {
								intFee = 0;
								continue;
							}

							intFee = Integer.parseInt(fee);
						}
					}

					vo.setCardName(name);
					vo.setCardDes(des);
					vo.setCardImgUrl(img);
					vo.setCardFee(intFee);
					vo.setCardUrl(imgUrl);
					vo.setComCtg("현대");
					service.insertCard(vo);
				}
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "index";
	}

	@RequestMapping("/card/KB")
	public String insertKBCard() {
		try {
			String URL = "https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0047";

			// 카드 페이지 받아옴
			Document doc = Jsoup.connect(URL).get();

			// 페이지에 있는 카테고리를 토대로 몇 번 반복할 건지 정함
			Elements tabsMenu = doc.getElementsByClass("tabs__menu");
			int tabsMenuIndexs = tabsMenu.select("li").size();

			// 첫 카테고리부터 반복해 크롤링
			for (int index = 1; index <= tabsMenuIndexs; index++) {
				URL = "https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0047?pageNo=1&cateIdx=" + index + "";
				doc = Jsoup.connect(URL).get();
				CardVO vo = new CardVO();

				// card-box__after class를 가진 div 박스를 전부 긁어옴
				Elements cards = doc.getElementsByClass("card-box__after");
				Elements cardsBefore = doc.getElementsByClass("card-box__before");
				int cardValues = cards.size();
				// div 박스를 하나하나 읽어와 안쪽에 있는 요소를 받아옴
				for (int value = 0; value < cardValues; value++) {
					Element card = cards.get(value);
					Element cardBefore = cardsBefore.get(value);
					// 카드 이름
					String name = card.select("h3").text();
					// 카드 설명
					String des = card.select("p").text();
					String imgUrl = cardBefore.select("img").get(0).attr("src");
					String cardUrl = imgUrl.substring(61, 66);
					// https://card.kbcard.com/CRD/DVIEW/HCAMCXPRICAC0076?mainCC=a&cooperationcode=cardUrl

					String annulKind = "";
					String annulPrice = "";

					// 기본값은 0
					int price = 0;

					// 연회비(국내인지 비자인지 어떤 연회비인지 따로 설정하기 위해 for문을 씀
					int annualValue = card.getElementsByClass("card-type__item").size();

					System.out.println();

					if (annualValue == 0) {
						// 데이터 저장
						vo.setCardName(name);
						vo.setCardDes(des);
						vo.setCardImgUrl(imgUrl);

						// fee String -> int
						vo.setCardFee(0);
						vo.setCardUrl(cardUrl);
						vo.setComCtg("KB");
						service.insertCard(vo);
					} else {
						for (int annual = 0; annual < annualValue; annual++) {
							// img의 alt 값을 저장
							annulKind = card.getElementsByClass("card-type__item").get(annual)
									.getElementsByClass("card-type__logo").select("img").attr("alt");

							// alt 값이 국내 전용이면 연회비를 가져옴
							if (annulKind.equals("국내전용")) {
								annulPrice = card.getElementsByClass("card-type__item").get(annual)
										.getElementsByClass("card-type__money").text();

								// 연회비가 있으면 그 연회비를 저장하고
								if (!(annulPrice.equals("연회비 없음"))) {
									annulPrice = annulPrice.replace(",", "");
									price = Integer.parseInt(annulPrice);
								}

								// 아니면 0인 그대로 저장
								// 데이터 저장
								vo.setCardName(name);
								vo.setCardDes(des);
								vo.setCardImgUrl(imgUrl);

								// fee String -> int
								vo.setCardFee(price);
								vo.setCardUrl(cardUrl);
								vo.setComCtg("KB");
								service.insertCard(vo);
							}
						}
					}
				}
			}
			System.out.println("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "index";
	}

	// Selenium 카드 데이터 수집
	
	private WebDriver driver;
	private WebDriverWait wait;
	private static String url = "https://www.lottecard.co.kr/app/LPCDADA_V100.lc"; // 크롤링 진행할 페이지 주소 입력
	
	@RequestMapping("/card/lotte")
	public String lotteCard() {
		
		System.setProperty("webdriver.chrome.driver",
				"C:\\Program Files (x86)\\Google\\Chrome\\ChromeDriver\\chromedriver.exe");
		// 크롬 드라이버 세팅 (드라이버 설치한 경로 입력)

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--disable-popup-blocking"); //팝업안띄움
	    options.addArguments("headless"); //브라우저 안띄움
	    options.addArguments("--disable-gpu"); //gpu 비활성화
	    driver = new ChromeDriver(options);

		try {
			getDataList();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		driver.close(); // 탭 닫기
		driver.quit(); // 브라우저 닫기
		return "index";
	}
	
	// 데이터 가져오기
		private List<WebElement> getDataList() throws InterruptedException {
			CardVO vo = new CardVO();
			wait = new WebDriverWait(driver, Duration.ofSeconds(3));
			
			driver.get(url); // 브라우저에서 url로 이동한다.
			Thread.sleep(1000); // 강제로 1초 대기
			
			for(int i=0; i<4; i++) {
				driver.findElement(By.xpath("//*[@id=\"btnMore\"]")).click(); // 더보기 버튼을 클릭
				wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//*[@id=\"btnMore\"]"))); // 클릭 후 페이지가 로드될 때까지 대기
			}
			
			List<WebElement> elements = driver.findElements(By.cssSelector(".cardList #ajaxCardList li"));
	        for (WebElement element : elements) {
	            vo.setCardName(element.findElement(By.cssSelector("a .tit")).getText());    
	            vo.setCardDes(element.findElement(By.cssSelector("a .txt")).getText());
	            vo.setCardImgUrl(element.findElement(By.cssSelector("img")).getAttribute("src"));
	            String commonUrl = "https://www.lottecard.co.kr/app/LPCDADB_V100.lc?vtCdKndC=";
	            String urlExtraction = element.findElement(By.cssSelector("a")).getAttribute("onclick").substring(7, 20);
	            String cardurluse = commonUrl + urlExtraction;
	           
	            
	            vo.setCardFee(0);
	            vo.setCardUrl(cardurluse);
	            vo.setComCtg("lotte");
	            service.insertCard(vo);
	        }
	        

			return elements;
		}
		
		
		
		private WebDriver driver1;
		private WebDriverWait wait1;
		private static String url1 = "https://www.hanacard.co.kr/OPI31000000D.web?schID=pcd&mID=OPI31000005P&CT_ID=241704030444153"; // 크롤링 진행할 페이지 주소 입력
		
		@RequestMapping("/card/hana")
		public String hanaCard() {
			
			System.setProperty("webdriver.chrome.driver",
					"C:\\Program Files (x86)\\Google\\Chrome\\ChromeDriver\\chromedriver.exe");
			// 크롬 드라이버 세팅 (드라이버 설치한 경로 입력)

			ChromeOptions options = new ChromeOptions();
			options.addArguments("--disable-popup-blocking"); //팝업안띄움
		    options.addArguments("headless"); //브라우저 안띄움
		    options.addArguments("--disable-gpu"); //gpu 비활성화
		    driver1 = new ChromeDriver(options);

			try {
				getDataList1();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			driver1.close(); // 탭 닫기
			driver1.quit(); // 브라우저 닫기
			return "index";
		}
		
		// 데이터 가져오기
			private List<WebElement> getDataList1() throws InterruptedException {
				CardVO vo = new CardVO();
				wait1 = new WebDriverWait(driver1, Duration.ofSeconds(3));
				
				driver1.get(url1); // 브라우저에서 url로 이동한다.
				Thread.sleep(1000); // 강제로 1초 대기
				
				
				List<WebElement> elements = driver1.findElements(By.cssSelector(".card_slide_area > li"));
				for(int i=1; i<7; i++) {
					
				WebElement dddd = driver1.findElement(By.xpath("//*[@id=\"stc_list\"] >\r\n"+ "li:nth-child[i]\"]"));
				System.out.println("gkgk" +dddd);
				driver1.findElement(By.xpath("//*[@id=\"stc_list\"] >li[i]\"]")).click(); 
			    wait1.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//*[@id=\"stc_list\"] >\r\n"+ "li:nth-child[i]\"]"))); // 클릭 후 페이지가 로드될 때까지 대기
					
		        for (WebElement element : elements) {
		        	System.out.println(element);
		            vo.setCardName(element.findElement(By.cssSelector(".txt > dt")).getText());
		           
		          
		            
		            vo.setCardDes(element.findElement(By.cssSelector(".txt dd")).getText());
		            
		            vo.setCardImgUrl(element.findElement(By.cssSelector("img")).getAttribute("src"));
		            String commonUrl = "https://www.hanacard.co.kr/OPI41000000D.web?schID=pcd&mID=PI41015249P&CD_PD_SEQ=";        
		            String urlExtraction = element.findElement(By.cssSelector(".btn_ty04")).getAttribute("onclick").substring(13, 18);
		         
		            String cardurluse = commonUrl + urlExtraction;
		            Object fee = element.findElement(By.cssSelector(".s2 ul li")).getText();
		            
		           vo.setCardFee((int)fee);
		            vo.setCardUrl(cardurluse);
		            vo.setComCtg("hana");
		            service.insertCard(vo);
		        	}
		        	
				}
				return elements;
				
			}
		
		@RequestMapping("/CardList")
		public String CardList() {
			return "list/cardList";
		}

		// 카드 전체 리스트
		@RequestMapping("/cardallList")
		public String listAllCard(Model model) {
			ArrayList<CardVO> cardList1 = service.listAllCard();
			model.addAttribute("cardList1", cardList1);
			return "list/cardSearchResultView";

		}
		
		@RequestMapping("/cardsearch")
		public String CardAllSearch(@RequestParam String cardId, Model model) {
			ArrayList<CardVO> cardList1 = service.CardAllSearch(cardId);
			model.addAttribute("cardList1", cardList1);
			System.out.println(cardList1.size());
			return "list/cardSearchResultView";
		}

		
		// 카드만
		@RequestMapping("/cardCategory")
		public String cardCategory(
								  
								   @RequestParam("comCtg") String comCtg,
				Model model) {
			
			
			ArrayList<CardVO> cardList1 = service.cardCategory(comCtg);
			
			model.addAttribute("cardList1", cardList1);
			
			return "list/cardSearchResultView";
		}
		
		// 해택만
		@RequestMapping("/cardCategory2")
		public String cardCategory2(@RequestParam("cardDes") String cardDes,
								  
								   
				Model model) {
			
			
			ArrayList<CardVO> cardList1 = service.cardCategory2(cardDes);
			
			model.addAttribute("cardList1", cardList1);
			
			return "list/cardSearchResultView";
		}
		
		// 연회비 
		@RequestMapping("/cardCategory3")
		public String cardCategory3(@RequestParam("cardFee") String cardFee,
								  
								   
				Model model) {
			
			
			ArrayList<CardVO> cardList1 = service.cardCategory3(Integer.parseInt(cardFee));
			
			model.addAttribute("cardList1", cardList1);
			
			return "list/cardSearchResultView";
		}
		
		// 짬뽕 1
		@RequestMapping("/cardCategory4")
		public String cardCategory4(@RequestParam("cardDes") String cardDes,
									@RequestParam("comCtg") String comCtg,
									
								   
				Model model) {
			ArrayList<CardVO> cardList1 = new ArrayList<CardVO>();
			if(comCtg=="") {
				 cardList1 = service.cardCategory2(cardDes);
			}else {
			
			cardList1 = service.cardCategory4(cardDes,comCtg);
			}
			model.addAttribute("cardList1", cardList1);
			
			return "list/cardSearchResultView";
		}
		
		
		// 짬뽕 2
		@RequestMapping("/cardCategory5")
		public String cardCategory5(@RequestParam("cardDes") String cardDes,
									@RequestParam("comCtg") String comCtg,
									@RequestParam("cardFee") int cardFee,
								   
				Model model) {
			ArrayList<CardVO> cardList1 = new ArrayList<CardVO>();
			if(comCtg=="" && cardDes=="") {
				 cardList1 = service.cardCategory3(cardFee);
			}else {
			
			cardList1 = service.cardCategory5(cardDes,comCtg,cardFee);
			}
			model.addAttribute("cardList1", cardList1);
			
			return "list/cardSearchResultView";
		}
		
		// 상품 비교 추가
		@ResponseBody
		@RequestMapping("/CardCompare")
		public CardVO CardCompare(@RequestParam String cardId, Model model) {
			CardVO cardList1 = service.CardCompare(cardId);
			model.addAttribute("cardList1", cardList1);
			return cardList1;
		}

//		@RequestMapping("/popup")
//		public String popup() {
//			return "list/cardList";
//		}


		
		

}