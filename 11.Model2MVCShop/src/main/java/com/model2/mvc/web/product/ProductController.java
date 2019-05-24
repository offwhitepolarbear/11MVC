package com.model2.mvc.web.product;

import java.io.File;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['filePath']}")
	String filePath;
	
	@RequestMapping( value="addProduct", method=RequestMethod.GET )
	public String addProductView() throws Exception {

		System.out.println("/product/addProduct :GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	//@RequestMapping("/addProduct.do")
	@RequestMapping( value="addProduct", method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session) throws Exception {
		
		System.out.println("/product/addProduct : POST");
		//�޷�������
		product.setManuDate(product.getManuDate().replace("/", ""));
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("uploadFile");
		System.out.println("���� ���� ���� : "+files.size());
		System.out.println(filePath+"�������Դϴ�.");
			product.setFileName(files.get(0).getOriginalFilename());		
		
		for (int i = 0; i < files.size(); i++) {
			 File file = new File(filePath, files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);
		}

		productService.addProduct(product);
				
		System.out.println("�١ڡ١��μ�Ʈ�� ���ε�� ���� �����١ڡ١� : "+product.getProdNo());
				
		return "redirect:/product/listProduct?menu=manage";
	}
	
	@RequestMapping( value="restockView/{prodNo}", method=RequestMethod.POST )
	public String restockView( @PathVariable String prodNo, Model model) throws Exception {
		//@RequestParam("uploadFile") MultipartFile uploadFile,
		
		System.out.println("/product/restockView : GET");
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/restock.jsp";
		
	}
		
	
	@RequestMapping( value="restock", method=RequestMethod.POST )
	public String restock( @ModelAttribute("product") Product product) throws Exception {
		
		System.out.println("/product/restock : POST");

		productService.restock(product);
		
		return "redirect:/product/listProductManager";
	}
	
	@RequestMapping( value="updateStock", method=RequestMethod.POST )
	public String updateStock( @ModelAttribute("product") Product product) throws Exception {
		
		System.out.println("/product/updateStock : POST");
				
		productService.updateStock(product);
		
		return "redirect:/product/listProductManager";
	}
	
	//@RequestMapping("/getProduct.do")
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct(@RequestParam("prodNo") String prodNo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//System.out.println("/getProduct.do");
		System.out.println("/product/getProduct : GET");

		
		String history = null;
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		
		if (cookies != null) {
			System.out.println("��Ű�� �ֽ��ϴ�.");
			Cookie CookieOne = new Cookie("history", prodNo + "");
				for (int i = 0; i < cookies.length; i++) {
					Cookie cookie = cookies[i];
						if (cookie.getName().equals("history")) {
							history = cookie.getValue();
							if(history.substring(history.length()-5).equals(prodNo+"")) {
								CookieOne = new Cookie("history", history);
								
								System.out.println("�ߺ���ȸ�� �ߺ��κ� ������.");

							}
							else {
								CookieOne = new Cookie("history", history + "," + prodNo);
								System.out.println("���ο� ��ǰ��������� �߰���.");

							}
						}	
				}
				//��Ű�� �����ϴ� �ּҰ�/product/... �� ����Ǿ
				//�⺻������ ����� port/ �� �����ϴ� �����丮���� ��ȸ �Ұ�������
				//��Ű�� ����� �� �ִ� ��μ����� ���ּ���
				CookieOne.setPath("/");
			response.addCookie(CookieOne);
		}
		
		//Business Logic
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	//@RequestMapping("/updateProductView.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.GET )

	public String updateProductView( @RequestParam("prodNo") String prodNo , Model model) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	//@RequestMapping("/updateProduct.do")
	@RequestMapping( value="updateProduct", method=RequestMethod.POST )

	public String updateProduct( @ModelAttribute("product") Product product, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception{

		System.out.println("/product/updateProduct : POST");
		
		System.out.println(product);
		

		System.out.println("/product/addProduct : POST");
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("uploadFile");
		System.out.println("���� ���� ���� : "+files.size());
		System.out.println(filePath+"�������Դϴ�.");
		
		product.setFileName(files.get(0).getOriginalFilename());		
		product.setManuDate(product.getManuDate().replace("-", ""));
		
		for (int i = 0; i < files.size(); i++) {
			 File file = new File(filePath, files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);
		}
		productService.updateProduct(product);

		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
	//@RequestMapping("/listProduct.do")
	@RequestMapping( value="listProduct")
	public String listProduct(@ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		//System.out.println("�޴��� ���°� �ٽ� ��������"+menu);
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping( value="listProductManager")
	public String listProductManager(@ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProductManager");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProductManager.jsp";
	}
	
	
}