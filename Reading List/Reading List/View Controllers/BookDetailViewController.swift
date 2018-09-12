//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Scott Bennett on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookController: BookController?
    var book: Book?

    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var reasonToReadTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
   
    func updateViews() {
        guard let book = book else {
            self.navigationItem.title = "Add a new book"
            return
        }
        self.navigationItem.title = book.title
        bookTitleTextField.text = book.title
        reasonToReadTextView.text = book.reasonToRead
        
    }

    
    @IBAction func saveBookTapped(_ sender: Any) {
        guard let title = bookTitleTextField.text,
        let reasonToRead = reasonToReadTextView.text else { return }
        
        if book == nil {
            bookController?.CreateBook(withName: title, reasonToRead: reasonToRead)
        } else {
            guard let book = book else { return }
            bookController?.updateBook(with: book, title: title, reasonToRead: reasonToRead)
        }
        
        navigationController?.popViewController(animated: true)
    }

}
