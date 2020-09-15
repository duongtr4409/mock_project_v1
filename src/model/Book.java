/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Objects;

/**
 *
 * @author tuanc
 */
public class Book {

    private int book_id;
    private String bookTitle;
    private String author;
    private String brief;
    private String publisher;
    private String content;
    private String category;

    public Book() {
    }

    public Book(String bookTitle, String author, String brief, String publisher, String content, String category) {
        this.bookTitle = bookTitle;
        this.author = author;
        this.brief = brief;
        this.publisher = publisher;
        this.content = content;
        this.category = category;
    }



    public Book(String bookTitle, String author, String brief, String publisher, String category) {
        this.bookTitle = bookTitle;
        this.author = author;
        this.brief = brief;
        this.publisher = publisher;
        this.category = category;
    }


    public int getId() {
        return book_id;
    }

    public void setId(int book_id) {
        this.book_id = book_id;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + book_id + ", bookTitle=" + bookTitle + ", author=" + author + ", brief=" + brief + ", publisher=" + publisher + ", content=" + content + ", category=" + category + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + this.book_id;
        hash = 53 * hash + Objects.hashCode(this.bookTitle);
        hash = 53 * hash + Objects.hashCode(this.author);
        hash = 53 * hash + Objects.hashCode(this.brief);
        hash = 53 * hash + Objects.hashCode(this.publisher);
        hash = 53 * hash + Objects.hashCode(this.content);
        hash = 53 * hash + Objects.hashCode(this.category);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Book other = (Book) obj;
        if (this.book_id != other.book_id) {
            return false;
        }
        if (!Objects.equals(this.bookTitle, other.bookTitle)) {
            return false;
        }
        if (!Objects.equals(this.author, other.author)) {
            return false;
        }
        if (!Objects.equals(this.brief, other.brief)) {
            return false;
        }
        if (!Objects.equals(this.publisher, other.publisher)) {
            return false;
        }
        if (!Objects.equals(this.content, other.content)) {
            return false;
        }
        if (!Objects.equals(this.category, other.category)) {
            return false;
        }
        return true;
    }

    
}
