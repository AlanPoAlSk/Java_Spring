package com.alanskrzecz.bookclub.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.alanskrzecz.bookclub.models.Book;
import com.alanskrzecz.bookclub.services.BookService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BookController {
	private final BookService bookService;
	
	
	
	public BookController(BookService bookService) {
		this.bookService = bookService;
	}

	@GetMapping("/books")
	public String bookBoard(HttpSession session, Model model) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		
		model.addAttribute("bookList", bookService.allBooks());
		
		
		return "dashbooks";
	}
	
	@GetMapping("/books/new")
	public String newBookForm(@ModelAttribute("newBook")Book newBook, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		return "newBook";
	}
	
	@PostMapping("/books/new")
	public String processNewBook(
			@Valid @ModelAttribute("newBook")Book newBook, BindingResult result, HttpSession session
			) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			return "newBook";
		} else {
			bookService.addBook(newBook);
			return "redirect:/books";
		}
		
	}
	
	@GetMapping("/books/{id}")
	public String bookDetails(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		model.addAttribute("book", bookService.oneBook(id));
		return "detailsBook";
		
	}
	
	@GetMapping("/books/{id}/edit")
	public String editBook(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		model.addAttribute("book", bookService.oneBook(id));
		return "editBook";
	}
	
	@PutMapping("/books/{id}/edit")
	public String processEditBook(
			@Valid @ModelAttribute("book")Book book, BindingResult result, HttpSession session
			) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			return "editBook";
		} else {
			bookService.updateBook(book);
			return "redirect:/books";
		}
		
	}
	
	@DeleteMapping("/books/{id}")
	public String processDeleteBook(@PathVariable("id")Long id, HttpSession session) {
		if(session.getAttribute("userId")== null) {
			return "redirect:/logout";
		}
		bookService.deleteBook(id);
		return "redirect:/books";
	}
	
	
}
