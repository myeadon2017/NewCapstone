package com.hcl.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.dao.AlbumDAO;
import com.hcl.dao.UserDAO;
import com.hcl.exceptions.InvalidUserException;
import com.hcl.exceptions.PasswordConfirmationException;
import com.hcl.model.Album;
import com.hcl.model.User;
import com.hcl.service.AlbumService;

import lombok.val;
//This is used as a controller for my albums REST operations
@RestController
@SessionAttributes("user")
public class AlbumController {

	@Autowired
	UserDAO userDao;
	@Autowired
	AlbumDAO albumDao;
	
	@Autowired
	AlbumService service;
	
	@GetMapping("/addtocart/{id}/{aid}")
	public ModelAndView addToCart(@PathVariable("id") int id, @PathVariable("aid") int aid,
			HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		session.setAttribute("user", user);
		Album album = albumDao.findById(aid).get();
		user.getUserCart().add(album);
		session.setAttribute("userCart", user.getUserCart());
		user.setTotal(user.getTotal() + album.getPrice());
		userDao.save(user);
		return new ModelAndView("/usercart");
	}
	@GetMapping("/usercart/{id}")
	public ModelAndView showCart(@PathVariable("id") int id, HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		user = userDao.findById(id).get();
		session.setAttribute("user", user);
		session.setAttribute("cart", user.getUserCart());
		userDao.save(user);
		return new ModelAndView("/usercart");
	}
	@GetMapping("/checkout/{id}")
	public ModelAndView showCheckout(@PathVariable("id") int id, HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		user = userDao.findById(id).get();
		session.setAttribute("user", user);
		session.setAttribute("cart", user.getUserCart());
		userDao.save(user);
		return new ModelAndView("/checkout");
	}
	@GetMapping("/confirmation/{id}")
	public ModelAndView showConfirmation(@PathVariable("id") int id, HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		user = userDao.findById(id).get();
		user.getUserCart().clear();
		user.setTotal(0.00);
		session.setAttribute("user", user);
		session.setAttribute("cart", user.getUserCart());
		userDao.save(user);
		return new ModelAndView("/confirmation");
	}
	
	@GetMapping("/deletealbum/{id}")
	public ModelAndView returnTasks(@PathVariable("id") int Id) {
		albumDao.deleteById(Id);
		return new ModelAndView("redirect:/list-albums");
	}
	
	@GetMapping("{name}/{id}/managerhome")
	public ModelAndView showManagerHome(@PathVariable("name") String name, @PathVariable("id") int id,
			HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		session.setAttribute("user", user);
		user = userDao.findById(id).get();
		List<Album> userCart = user.getUserCart();
		session.setAttribute("userCart", userCart);
		return new ModelAndView("/managerhome");
	}
	
	@GetMapping("{name}/{id}/userhome")
	public ModelAndView showUserHome(@PathVariable("name") String name, @PathVariable("id") int id,
			HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		session.setAttribute("user", user);
		user = userDao.findById(id).get();
		List<Album> userCart = user.getUserCart();
		session.setAttribute("userCart", userCart);
		return new ModelAndView("/userhome");
	}

	
	@GetMapping("/list-albums")
	public ModelAndView showAlbums(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		session.setAttribute("user", user);
		session.setAttribute("albums", service.retrieveAlbums());
		return new ModelAndView ("/list-albums");
	}
	@GetMapping("/list-albums2")
	public ModelAndView showAlbums2(HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		session.setAttribute("user", user);
		session.setAttribute("albums", service.retrieveAlbums());
		return new ModelAndView ("/list-albums2");
	}
	
	@GetMapping("/editalbum/{id}")
	public ModelAndView showEditAlbum(@PathVariable("id") int id, HttpServletRequest request, ModelMap model) {
		HttpSession session = request.getSession();
		User user = (User) model.get("user");
		session.setAttribute("user", user);
		Album album = albumDao.findById(id).get();
		return new ModelAndView("/editalbum").addObject(album);
	}

	@PostMapping("/editalbum/{id}")
	public ModelAndView editAlbum(@PathVariable("id") int id,
			@RequestParam("cover") String cover, @RequestParam("title") String
			  title,
			  @RequestParam("artist") String artist, @RequestParam("genre") String
			  genre,
			  @RequestParam("price") Double price, @RequestParam("inventory") Integer inventory) {
		
		String message=null;
		
		message = "Successfully updated Product";
		Album album= albumDao.findById(id).get();
		album.setCover(cover);
		album.setTitle(title);
		album.setArtist(artist);
		album.setGenre(genre);
		album.setPrice(price);
		album.setInventory(inventory);
		albumDao.save(album);
		return new ModelAndView("redirect:/list-albums").addObject("message", message);
	}

	 
	  @GetMapping("/addalbum")
		public ModelAndView showAddAlbum(HttpServletRequest request, ModelMap model) {
		  HttpSession session = request.getSession();
			User user = (User) model.get("user");
			session.setAttribute("user", user);
			return new ModelAndView("add-album");
		}

		@PostMapping("/addalbum")
		public ModelAndView addalbum(
				  @RequestParam("cover") String cover, @RequestParam("title") String
				  title,
				  @RequestParam("artist") String artist, @RequestParam("genre") String
				  genre,
				  @RequestParam("price") Double price, @RequestParam("inventory") Integer inventory 
				  ) {
					String message = null;
					
					message = "Successfully Added Product";
					Album album = new Album();
					album.setCover(cover);
					album.setTitle(title);
					album.setArtist(artist);
					album.setGenre(genre);
					album.setPrice(price);
					album.setInventory(inventory);
					albumDao.save(album);
			return new ModelAndView("add-album").addObject("message", message);
		}
		
		
	@GetMapping("/{id}/deletealbum/{aid}")
	public ModelAndView returnAlbums(@PathVariable("id") int id, @PathVariable("aid") int aid, HttpServletRequest request, ModelMap model ) {
		HttpSession session = request.getSession();
		User user = new User();
		user = userDao.findById(id).get();
		session.setAttribute("user", user);
		user.getUserCart().clear();
		user.setTotal(0.00);
		session.setAttribute("userCart", user.getUserCart());
		userDao.save(user);
		return new ModelAndView("/usercart");
	}
}
