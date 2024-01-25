package com.alanskrzecz.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alanskrzecz.bookclub.models.Book;
import com.alanskrzecz.bookclub.repositories.BookRepository;

@Service
public class BookService {
	private final BookRepository bookRepository;

	public BookService(BookRepository bookRepository) {
		this.bookRepository = bookRepository;
	}
	
	public List<Book> allBooks(){
		return bookRepository.findAll();
	}
	
	// findOne
	public Book oneBook(Long id) {
		Optional<Book> optionalBook = bookRepository.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	
	// create
	public Book addBook(Book newBook) {
		return bookRepository.save(newBook);
	}
	
	// update/edit
	public Book updateBook(Book book) {
		return bookRepository.save(book);
	}
	
	// delete
	public void deleteBook(Long id) {
		bookRepository.deleteById(id);
	}
}
