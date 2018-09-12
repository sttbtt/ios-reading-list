//
//  BookController.swift
//  Reading List
//
//  Created by Scott Bennett on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    // Load data from storage
    init() { loadFromPersistentStore() }
    
    // MARK: - Properties
    var books = [Book]()
    
    // Computed properties
    private var readingListURL: URL? {
        let fm = FileManager.default
        guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return dir.appendingPathComponent("ReadingList.plist")
    }
    
    var readBooks: [Book] {
        return books.filter {$0.hasBeenRead == true}
    }
    
    var unreadBooks: [Book] {
        return books.filter {$0.hasBeenRead == false}
    }
    
 
    // Save data to persistent storage
    func saveToPersistentStore() {
        guard let url = readingListURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }
    

    // Load data from persistent storage
    func loadFromPersistentStore() {
        let fm = FileManager.default
        guard let url = readingListURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let decoder = PropertyListDecoder()
            let booksData = try Data(contentsOf: url)
            let decodeBooks = try decoder.decode([Book].self, from: booksData)
            books = decodeBooks
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }
    
 
    // Create and save book
    func CreateBook(withName title: String, reasonToRead: String) {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
    }
 
    
    // Delete and save book
    func DeleteBook(book: Book) {
        guard let index = books.index(of: book) else { return }
        books.remove(at: index)
        saveToPersistentStore()
    }
 
    
    // Update and save "has been read" property
    func updateHasBeenRead(for book: Book) {
        guard let index = books.index(of: book) else { return }
        books[index].hasBeenRead = !books[index].hasBeenRead
        saveToPersistentStore()
    }
 
    
    // Update and save book
    func updateBook(with book: Book, title: String, reasonToRead: String) {
        guard let index = books.index(of: book) else { return }
        books[index].title = title
        books[index].reasonToRead = reasonToRead
        saveToPersistentStore()
    }
    
}



