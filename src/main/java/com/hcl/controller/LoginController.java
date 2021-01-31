package com.hcl.controller;

import java.util.concurrent.atomic.AtomicBoolean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.dao.UserDAO;
import com.hcl.exceptions.IncorrectDetailsException;
import com.hcl.exceptions.InvalidUserException;
import com.hcl.exceptions.PasswordConfirmationException;
import com.hcl.model.User;
import com.hcl.service.Authentication;

import lombok.val;
//This is used as a controller for my login REST operations
@RestController
@SessionAttributes("user")
public class LoginController {

	@Autowired
	UserDAO userDao;

	@Autowired
	Authentication auth;
	
	@GetMapping("/index")
	public ModelAndView showIndex() {
		return new ModelAndView("index");
	}
	
	@PostMapping("/index")
	public ModelAndView Index() {
		return new ModelAndView("index");
	}
	

	@GetMapping("/register")
	public ModelAndView showRegister() {
		return new ModelAndView("registration");
	}

	@PostMapping("/register")
	public ModelAndView register(@RequestParam("name") String name,
			@RequestParam("confirmation") String confirmation,
			@RequestParam("password") String password,
			@RequestParam("billingStreetAddress1") String billingStreetAddress1,
			@RequestParam("billingStreetAddress2") String billingStreetAddress2,
			@RequestParam("billingCity") String billingCity,
			@RequestParam("billingState") String billingState,
			@RequestParam("billingZipcode") String billingZipcode,
			@RequestParam("shippingStreetAddress1") String shippingStreetAddress1,
			@RequestParam("shippingStreetAddress2") String shippingStreetAddress2,
			@RequestParam("shippingCity") String shippingCity,
			@RequestParam("shippingState") String shippingState,
			@RequestParam("shippingZipcode") String shippingZipcode) {

		val isUnique = new AtomicBoolean(true);
		String message = null;

		try {
			userDao.findOneByNameAndPassword(name.toLowerCase(), password).ifPresent(u -> isUnique.set(false));

			if (!password.equals(confirmation)) {
				throw new PasswordConfirmationException("Password and Confirmation does not match");
			} else if (!isUnique.get()) {
				throw new InvalidUserException("Username is already taken");
			} else {
				message = "Successfully Registered";
				User user = new User();
				user.setName(name.toLowerCase());
				user.setPassword(password);
				user.setBillingStreetAddress1(billingStreetAddress1);
				user.setBillingStreetAddress2(billingStreetAddress2);
				user.setBillingCity(billingCity);
				user.setBillingState(billingState);
				user.setBillingZipcode(billingZipcode);
				user.setShippingStreetAddress1(shippingStreetAddress1);
				user.setShippingStreetAddress2(shippingStreetAddress2);
				user.setShippingCity(shippingCity);
				user.setShippingState(shippingState);
				user.setShippingZipcode(shippingZipcode);
				userDao.save(user);
			}
		} catch (InvalidUserException | PasswordConfirmationException e) {
			message = e.getMessage();
		}
		return new ModelAndView("registration").addObject("message", message);
	}

	@GetMapping("/login")
	public ModelAndView showLogin() {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	public ModelAndView login(ModelMap model, @RequestParam("name") String name,
			@RequestParam("password") String password, HttpServletRequest request) {
		boolean isValid = auth.authenticate(name, password);

		try {
		if(auth.getCurrentUser().getId() == 1) {
			model.put("user", auth.getCurrentUser());
			HttpSession session = request.getSession();
			session.setAttribute("user", auth.getCurrentUser());
			return new ModelAndView("redirect:/" + auth.getCurrentUser().getName() + "/"+ auth.getCurrentUser().getId() + "/managerhome");
		}
			else if (isValid) {
				model.put("user", auth.getCurrentUser());
				HttpSession session = request.getSession();
				session.setAttribute("user", auth.getCurrentUser());
				return new ModelAndView("redirect:/" + auth.getCurrentUser().getName() + "/"+ auth.getCurrentUser().getId() + "/userhome");
			} else {
				throw new IncorrectDetailsException("Invalid Credentials");
			}
		} catch (IncorrectDetailsException e) {
			HttpSession session = request.getSession();
			session.setAttribute("message", e.getMessage());
			return new ModelAndView("login");
		}
	}

	@GetMapping("/logout")
	public ModelAndView signOut(ModelMap model, HttpServletRequest request) {
		model.put("user", null);
		auth.logout();
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		session.invalidate();
		return new ModelAndView("redirect:/login");
	}

}
