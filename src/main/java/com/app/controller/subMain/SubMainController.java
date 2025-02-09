package com.app.controller.subMain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.subMain.Categories;
import com.app.dto.subMain.Places;
import com.app.service.subMain.SubMainService;


@Controller
public class SubMainController {
	
	
	@Autowired
	SubMainService subMainService;
	
	
	
	@GetMapping("/subMain")
	public String subMainAction(Model model) {

		List<Places> placesList = subMainService.findPlacesList();
		List<Categories> categoriesList = subMainService.findCategoriesList();
				
		System.out.println("main화면" + placesList);
		
		model.addAttribute("placesList", placesList);
		model.addAttribute("categoriesList", categoriesList);
		
		return "subMain/subMain";
	}
	
	
	
	@PostMapping("/subMain")
	public String subMainAction(@RequestParam List<String> categoriesId, Model model) {

		if(categoriesId == null || categoriesId.isEmpty()) {
			categoriesId = new ArrayList<>();
		}
		System.out.println(categoriesId);
//		List<Integer> categoryIds = new ArrayList<>();
//		for(String id : categoriesId) {
//			categoryIds.add(Integer.parseInt(id));
//		}
		
		List<Places> placesList = subMainService.findPlacesByCategoriesId(categoriesId);
		List<Categories> categoriesList = subMainService.findCategoriesList();
		
		System.out.println("필터시 " + placesList);
		System.out.println("필터시 " + categoriesList);
		
		model.addAttribute("placesList", placesList);
		model.addAttribute("categoriesList", categoriesList);
		
		return "/subMain/subMain";
	}
	
	
	@GetMapping("/subMain/pages")
	public String listPages(@RequestParam(defaultValue = "1") int page,
							@RequestParam(defaultValue = "5") int pageSize,
							Model model) {
		
		Map<String, Integer> paginationParams = new HashMap<>();
		paginationParams.put("offset", (page-1) * pageSize);
		paginationParams.put("limit", pageSize);
		
		List<Places> places = subMainService.findPlacesByPage(paginationParams);
		int totalPages = subMainService.getTotalPages(pageSize);
		
		model.addAttribute("places", places);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		
		return "/subMain/subMain";
		
	}
	
	
	/*
	 * 

	//객실 등록
	@GetMapping("/admin/registerRoom")
	public String registerRoom() {
		return "admin/registerRoom";
	}
	
	@PostMapping("/admin/registerRoom")
	public String registerRoomAction(Room room) {
		
		//값 넘어온거 확인
		System.out.println(room.toString());
		//등록
		int result = roomService.saveRoom(room);
		System.out.println(result);
		
		if(result > 0) {
			return "redirect:/admin/rooms";
		} else {
			return "admin/registerRoom";	
		}
		
	}
	
	//관리자 객실 목록 확인
	@GetMapping("/admin/rooms")
	public String rooms(Model model) {
		
		System.out.println("/admins/rooms 경로 접근 확인");
		log.info("/admins/rooms 경로 접근 확인 INFO");
		log.error("/admins/rooms 경로 접근 확인 ERROR");
		log.debug("/admins/rooms 경로 접근 확인 DEBUG");
		
		
		log.info("방에 들어감");
		log.debug("방에 문열고 들어가고 문 닫음");
		log.info("가방 내려놓음");
		log.debug("가방을 책상 앞에 내려놓음");
		log.info("화장실 들어감");
		log.debug("화장실 문열고 불켜고 들어감");
		
		
		List<Room> roomList = roomService.findRoomList();
		//service.findRoomList 호출 -> DAO findRoomList -> DB (Mybatis mapper) select 
		//						<- List<Room>			<- List<Room>
		// Controller DB로부터 조회 데이터 -> 화면 전달 -> 화면 출력(표시)
		model.addAttribute("roomList", roomList);
			
		return "admin/rooms";
	}
	
	//관리자 특정 객실에 대한 정보 (상세페이지)
	
	//
	//    /admin/roomInfo?roodId=2
	//    /admin/roomInfo?roodId=1
	//    /admin/roomInfo?roodId=40
	//@GetMapping("/admin/roomInfo")  

	//  /admin/room/2
	//  /admin/room/50
	//  /admin/room/99
	@GetMapping("/admin/room/{roomId}")
	public String room(@PathVariable String roomId, Model model) {
		
		int roomIdInt = Integer.parseInt(roomId);
		
		Room room = roomService.findRoomByRoomId(roomIdInt);
		model.addAttribute("room", room);
		
		return "admin/room";
	}
	
	
	//객실 정보 삭제
	@GetMapping("/admin/removeRoom")
	public String removeRoom(HttpServletRequest request) {
		String roomId = request.getParameter("roomId");
		
		int roomIdInt = Integer.parseInt(roomId);
		
		int result = roomService.removeRoom(roomIdInt);
		
		//log.info
		
		return "redirect:/admin/rooms";
//		if(result > 0) {
//			
//		} else {
//			
//		}
	}
	
	//객실 정보 수정
	@GetMapping("/admin/modifyRoom")
	public String modifyRoom(HttpServletRequest request) {
		String roomId = request.getParameter("roomId");
		int roomIdInt = Integer.parseInt(roomId);
		//roomId -> 해당 호실에 대한 정보 조회
		// 화면에 세팅
		Room room = roomService.findRoomByRoomId(roomIdInt);
		
		request.setAttribute("room", room);
		
		return "admin/modifyRoom";
	}
	
	@PostMapping("/admin/modifyRoom")
	public String modifyRoomAction(Room room) {
		//roomId
		
		System.out.println(room);
		int result = roomService.modifyRoom(room);
		
		if(result > 0 ) { //수정 성공 -> 목록 or 호실상세정보 페이지
			
			log.info("room 정보 수정 : {}", room);
			
			return "redirect:/admin/room/" + room.getRoomId();		
		} else {  //수정 실패 -> 다시 수정페이지로
			//return "admin/modifyRoom";
			return "redirect:/admin/modifyRoom?roomId=" + room.getRoomId();
		}
		
	}
	
	
	
	//고객 관리/등록
	
	@GetMapping("/admin/users/add")
	public String addUser() {
		
		return "admin/addUser";
	}
	
	@PostMapping("/admin/users/add")
	public String addUserAction(User user) {
		//사용자 추가 (관리자X)
		
		//유효성 검증
		if(user.getId().length() < 2) {
			return "admin/addUser";
		}
		
		if(user.getName().length() > 10) {
			return "admin/addUser";
		}
		
		user.setUserType(CommonCode.USER_USERTYPE_CUSTOMER);
		int result = userService.saveUser(user);
		//int result = userService.saveCustomerUser(user);
		System.out.println("사용자 추가 처리 결과 : " + result);
		
		if(result > 0) {
			return "redirect:/admin/users";
		} else {
			return "admin/addUser";			
		}
	}
	
	@GetMapping("/admin/users")
	public String users(Model model, UserSearchCondition userSearchCondition) {
		
		System.out.println(userSearchCondition);
		
		//List<User> userList = userService.findUserList();
		List<User> userList = userService.findUserListBySearchCondition(userSearchCondition);
		
		
		model.addAttribute("userList", userList);
		model.addAttribute("userSearchCondition", userSearchCondition);
		
		return "admin/users";
		
	}
	
	//고객 상세페이지
	@GetMapping("/admin/user/{id}")
	public String user(@PathVariable String id, Model model) {
		
		User user = userService.findUserById(id);
		model.addAttribute("user", user);
		
		return "admin/user";
	}
	
	//사용자정보 수정 페이지
	@GetMapping("/admin/modifyUser/{id}")
	public String modifyUser(@PathVariable String id, Model model) {
		
		User user = userService.findUserById(id);
		model.addAttribute("user", user);
		
		return "admin/modifyUser";
	}
	
	@PostMapping("/admin/modifyUser")
	public String modifyUserAction(User user) {
		
		System.out.println(user);
		
		int result = userService.modifyUser(user);
		
		if(result > 0 ) {
			return "redirect:/admin/user/" + user.getId();
		} else {
			return "redirect:/admin/modifyUser/" + user.getId();
		}
		
	}
	
	
}
	 * 
	 * */
	
	
	
}
