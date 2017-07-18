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

import com.niit.dao.ProDao;
import com.niit.model.Product;

@Controller
public class ProController {
	@Autowired
	ProDao ProductDAO;

	  // Landing Page--product is added in Model for Spring Form---List is added
	 // to retrive all data
	 @RequestMapping("/Product")
	 public String home(Model m) {
	  m.addAttribute("isEditing", false);
	  m.addAttribute("Product", new Product());
	  m.addAttribute("ProductList", ProductDAO.getAllProduct());
	  m.addAttribute("msg", "");
	  return "Product";
	 }

	  // Saving Product
	 @RequestMapping(value = "/savepro", method = RequestMethod.POST)
	 public String savepro(@Valid @ModelAttribute("Product") Product p,BindingResult result, Model m) 
	 {
		 if(result.hasErrors()){
			 return "Product";
		 }
		 else {
		 
			 ProductDAO.savepro(p);
	  m.addAttribute("Product", new Product());
	  m.addAttribute("ProductList", ProductDAO.getAllProduct());
	  m.addAttribute("msg", "Product added successfully");
	  return "Product";
	 }
	 }

	  // Displaying Update Form
	 @RequestMapping(value = "/updatepro/{pid}", method = RequestMethod.GET)
	 public String updatepro(@PathVariable("pid") int pid, Model m) {
		 Product p = ProductDAO.getproById(pid);
	  m.addAttribute("isEditing", true);
	  m.addAttribute("Product", p);
	  m.addAttribute("ProductList", ProductDAO.getAllProduct());
	  m.addAttribute("msg", "");
	  return "Product";
	 }

	  // Updating Product
	 @RequestMapping(value = "/updatepro", method = RequestMethod.POST)
	 public String updatepro(@ModelAttribute("Product") Product p, Model m) {
		 ProductDAO.updatepro(p);
	  m.addAttribute("Product", new Product());
	  m.addAttribute("ProductList",ProductDAO.getAllProduct());
	  m.addAttribute("msg", "product updated successfully");
	  return "Product";
	 }

	  // Deleting Product
	 @RequestMapping(value = "/deletepro/{pid}", method = RequestMethod.GET)
	 public String deletepro(@PathVariable("pid") int pid, Model m) {
		 ProductDAO.deleteproById(pid);
	  m.addAttribute("Product", new Product());
	  m.addAttribute("ProductList", ProductDAO.getAllProduct());
	  m.addAttribute("msg", "product deleted successfully");
	  return "Product";
	 }
}
