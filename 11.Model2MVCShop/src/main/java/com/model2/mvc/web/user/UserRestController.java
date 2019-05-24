package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	@RequestMapping( value="json/updateUser", method=RequestMethod.POST )
	public User updateUser(@RequestBody User user) throws Exception{
	
		System.out.println("/user/json/updateUser : POST");
		
		userService.updateUser(user);
		User responseUser = userService.getUser(user.getUserId());
		
		return responseUser;
		
	}
	
	@RequestMapping( value="json/listUser", method=RequestMethod.POST )
	public Map listUser(@RequestBody Search search) throws Exception{
		
		Map<String , Object> returnMap = userService.getUserList(search);
		
		return returnMap;
		
	}
	
	
	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
	public boolean checkDuplication(@RequestBody User user) throws Exception{
		
		System.out.println("id�ߺ�Ȯ�� ����Ʈ��Ʈ�ѷ��Դϴ�~");
	
		boolean result = userService.checkDuplication(user.getUserId());
	
		return result;
		
	}
	
	
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public User addUser(@RequestBody User user) throws Exception{
		System.out.println("user/json/addUser :POST ������Ʈ ����!!");
		userService.addUser(user);
		User reUser = userService.getUser(user.getUserId());
		reUser.setSsn("������ �ٳ�� User�½��ϴ�.");
		return reUser;
		
	}
		
}