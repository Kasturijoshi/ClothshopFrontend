package com.niit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.dao.CatDao;
import com.niit.dao.SuppDao;
import com.niit.model.Customer;

@Controller
public class HomeController {
	@Autowired
	HttpSession httpsession;
	
	@Autowired
	SuppDao SupplierDAO;
	
	@Autowired
	CatDao catagoryDAO;
	
@RequestMapping("/")
public String home()
{
	httpsession.setAttribute("catagoryList",catagoryDAO.getAllCatagory());
	httpsession.setAttribute("supplierList",SupplierDAO.getAllSupplier());
	return "index";
}
@RequestMapping("/Register")
public String register(Model m)
{
	 m.addAttribute("Customer", new Customer());
	return "Register";
}
@RequestMapping("/Aboutus")
public String Aboutus()
{
	
	return "Aboutus";
}
}

