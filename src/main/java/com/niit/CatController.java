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

import com.niit.dao.CatDao;
import com.niit.model.Catagory;

@Controller
public class CatController {
	@Autowired
	CatDao catagoryDAO;

	  // Landing Page--product is added in Model for Spring Form---List is added
	 // to retrive all data
	 @RequestMapping("/catagory")
	 public String home(Model m) {
	  m.addAttribute("isEditing", false);
	  m.addAttribute("catagory", new Catagory());
	  m.addAttribute("catagoryList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "");
	  return "catagory";
	 }

	  // Saving catagory
	 @RequestMapping(value = "/savecat", method = RequestMethod.POST)
	 public String savecat(@Valid @ModelAttribute("catagory") Catagory c,BindingResult result, Model m) 
	 {
		 if(result.hasErrors()){
			 return "catagory";
		 }
		 else {
		 
		 catagoryDAO.savecat(c);
	  m.addAttribute("catagory", new Catagory());
	  m.addAttribute("catagoryList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "catagory added successfully");
	  return "catagory";
	 }
	 }

	  // Displaying Update Form
	 @RequestMapping(value = "/updatecat/{catid}", method = RequestMethod.GET)
	 public String updatecat(@PathVariable("catid") String catid, Model m) {
	  Catagory c = catagoryDAO.getcatById(catid);
	  m.addAttribute("isEditing", true);
	  m.addAttribute("catagory", c);
	  m.addAttribute("catagoryList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "");
	  return "catagory";
	 }

	  // Updating catagory
	 @RequestMapping(value = "/updatecat", method = RequestMethod.POST)
	 public String updatecat(@ModelAttribute("catagory") Catagory c, Model m) {
		catagoryDAO.updatecat(c);
	  m.addAttribute("catagory", new Catagory());
	  m.addAttribute("catagoryList",catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "catagory updated successfully");
	  return "catagory";
	 }

	  // Deleting catagory
	 @RequestMapping(value = "/deletecat/{catid}", method = RequestMethod.GET)
	 public String deletecat(@PathVariable("catid") String catid, Model m) {
		 catagoryDAO.deletecatById(catid);
	  m.addAttribute("catagory", new Catagory());
	  m.addAttribute("catagoryList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "catagory deleted successfully");
	  return "catagory";
	 }
}
