package com.niit;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.dao.CusDao;
import com.niit.model.Customer;

@Controller
public class CusController {
	@Autowired
	CusDao customerDAO;

	  // Landing Page--product is added in Model for Spring Form---List is added
	 // to retrive all data
	 @RequestMapping("/Customer")
	 public String home(Model m) {
	  m.addAttribute("isEditing", false);
	  m.addAttribute("Customer", new Customer());
	  m.addAttribute("CustomerList", customerDAO.getAllCustomer());
	  m.addAttribute("msg", "");
	  return "Register";
	 }

	  // Saving Customer
	 @RequestMapping(value = "/savecus", method = RequestMethod.POST)
	 public String savecus(@Valid @ModelAttribute("Customer") Customer cs,BindingResult result, Model m) 
	 {
		 if(result.hasErrors()){
			 return "Register";
		 }
		 else {
		 
			 customerDAO.savecus(cs);
	  m.addAttribute("Customer", new Customer());
	  m.addAttribute("CustomerList", customerDAO.getAllCustomer());
	  m.addAttribute("msg", "Customer added successfully");
	  return "Register";
	 }
	 }

	  // Displaying Update Form
	 @RequestMapping(value = "/updatecus/{cusid}", method = RequestMethod.GET)
	 public String updatecus(@PathVariable("cusid") int cusid, Model m) {
		 Customer cs = customerDAO.getcusById(cusid);
	  m.addAttribute("isEditing", true);
	  m.addAttribute("Customer", cs);
	  m.addAttribute("CustomerList", customerDAO.getAllCustomer());
	  m.addAttribute("msg", "");
	  return "Register";
	 }

	  // Updating Customer
	 @RequestMapping(value = "/updatecus", method = RequestMethod.POST)
	 public String updatecus(@ModelAttribute("Customer") Customer cs, Model m) {
		 customerDAO.updatecus(cs);
	  m.addAttribute("Customer", new Customer());
	  m.addAttribute("CustomerList",customerDAO.getAllCustomer());
	  m.addAttribute("msg", "Customer updated successfully");
	  return "Register";
	 }

	  // Deleting Customer
	 @RequestMapping(value = "/deletecus/{cusid}", method = RequestMethod.GET)
	 public String deletecus(@PathVariable("cusid") int cusid, Model m) {
		 customerDAO.deletecusById(cusid);
	  m.addAttribute("Customer", new Customer());
	  m.addAttribute("CustomerList", customerDAO.getAllCustomer());
	  m.addAttribute("msg", "Customer deleted successfully");
	  return "Register";
	 }
}
