package com.niit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	 @RequestMapping("/Catagory")
	 public String home(Model m) {
	  m.addAttribute("isEditing", false);
	  m.addAttribute("Catagory", new Catagory());
	  m.addAttribute("CatagoryList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "");
	  return "home";
	 }

	  // Saving Product
	 @RequestMapping(value = "/save", method = RequestMethod.POST)
	 public String save(@ModelAttribute("product") Catagory c, Model m) {
		 catagoryDAO.save(c);
	  m.addAttribute("product", new Catagory());
	  m.addAttribute("productList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "product added successfully");
	  return "Catagory";
	 }

	  // Displaying Update Form
	 @RequestMapping(value = "/update/{pid}", method = RequestMethod.GET)
	 public String update(@PathVariable("catid") int catid, Model m) {
	  Catagory c = catagoryDAO.getById(catid);
	  m.addAttribute("isEditing", true);
	  m.addAttribute("Catagory", c);
	  m.addAttribute("CatagoryList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "");
	  return "Catagory";
	 }

	  // Updating Product
	 @RequestMapping(value = "/update", method = RequestMethod.POST)
	 public String update(@ModelAttribute("product") Catagory c, Model m) {
		 catagoryDAO.update(c);
	  m.addAttribute("Catagory", new Catagory());
	  m.addAttribute("CatagoryList",catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "product updated successfully");
	  return "Catagory";
	 }

	  // Deleting Product
	 @RequestMapping(value = "/delete/{pid}", method = RequestMethod.GET)
	 public String delete(@PathVariable("catid") int catid, Model m) {
		 catagoryDAO.deleteById(catid);
	  m.addAttribute("Catagory", new Catagory());
	  m.addAttribute("CatagoryList", catagoryDAO.getAllCatagory());
	  m.addAttribute("msg", "product deleted successfully");
	  return "Catagory";
	 }
}
