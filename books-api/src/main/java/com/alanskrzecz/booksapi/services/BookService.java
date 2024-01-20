package com.alanskrzecz.booksapi.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alanskrzecz.booksapi.models.Book;
import com.alanskrzecz.booksapi.repositories.BookRepository;

@Service
public class BookService {
    // adding the book repository as a dependency
    private final BookRepository bookRepository;
    
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }
    // returns all the books
    public List<Book> allBooks() {
        return bookRepository.findAll();
    }
    // creates a book
    public Book createBook(Book b) {
        return bookRepository.save(b);
    }
    // retrieves a book
    public Book findBook(Long id) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        if(optionalBook.isPresent()) {
            return optionalBook.get();
        } else {
            return null;
        }
    }
//    //update book
//    public Book updateBook(Book b) {
//        return bookRepository.save(b);
//    }
    
    public List<Book> booksDescriptionContaining(String search){
    	return bookRepository.findByDescriptionContaining(search);
    }
	public void deleteBook(Long id) {
		// TODO Auto-generated method stub
		if (id != null) {
			bookRepository.deleteById(id);
		}
		
		
	}
	public Book updateBook(Long id, String title, String desc, String lang, Integer numOfPages) {
		// TODO Auto-generated method stub
		Book book = bookRepository.findById(id).orElse(null);
		if (book != null) {
			book.setTitle(title);
			book.setDescription(desc);
			book.setLanguage(lang);
			book.setNumberOfPages(numOfPages);
			return bookRepository.save(book);
		}
		return null;
	}
}
