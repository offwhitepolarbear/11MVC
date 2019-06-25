package com.model2.mvc.web.chat;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@RequestMapping( value="enterChat")
	public String enterChat() throws Exception {
		
		System.out.println("아무튼 페이지로 보냈음");
				
		return "redirect:/chat/chat.jsp";
	}

}
